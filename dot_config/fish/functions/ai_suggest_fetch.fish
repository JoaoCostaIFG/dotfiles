function ai_suggest_fetch
    set -l last_cmd $argv[1]
    set -l exit_status $argv[2]
    set -l working_dir $argv[3]

    # Gather context
    # Recent command history (last 5 commands, excluding the current one)
    set -l recent_history (history --max 6 | tail -n 5 | string collect)

    # Git context (if in a git repo)
    set -l git_context ""
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set -l git_branch (git branch --show-current 2>/dev/null)
        set -l git_status (git status --short 2>/dev/null | head -5 | string collect)
        set -l git_status_summary ""
        
        if test -n "$git_status"
            set -l modified (git status --short 2>/dev/null | grep -c "^ M" || echo 0)
            set -l staged (git status --short 2>/dev/null | grep -c "^M" || echo 0)
            set -l untracked (git status --short 2>/dev/null | grep -c "^?" || echo 0)
            set git_status_summary "Modified: $modified, Staged: $staged, Untracked: $untracked"
        else
            set git_status_summary "Clean working tree"
        end

        set git_context "
Git branch: $git_branch
Git status: $git_status_summary"
    end

    # Determine if command failed
    set -l status_info ""
    if test "$exit_status" = "0"
        set status_info "Exit status: 0 (success)"
    else
        set status_info "Exit status: $exit_status (FAILED - suggest a fix or alternative)"
    end

    # Build prompt for AI
    set -l prompt "You are a shell assistant. Based on the context below, suggest ONE logical next command the user might want to run. Only output the command itself, no explanation, no markdown, no backticks, no code fences.

Working directory: $working_dir
$status_info
$git_context
Recent command history (oldest to newest):
$recent_history

Last command executed: $last_cmd

Suggest the next command:"

    # Call llm directly (not ask, to avoid gum spinner in background)
    set -l result (echo "$prompt" | llm -m 'github_copilot/gpt-4.1' 2>/dev/null | string trim)

    # Update universal variable (triggers __ai_suggest_on_update in parent shell)
    set -U __ai_suggestion "$result"
end
