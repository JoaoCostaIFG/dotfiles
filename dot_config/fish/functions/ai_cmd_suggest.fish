function ai_cmd_suggest
    set -l base_prompt
    if test (count $argv) -ge 1
        set base_prompt "$argv[1]"
    else
        return 1
    end

    set -l current_content (commandline)

    set -l prompt "Only provide a single fish shell command as your response. Do not include any explanations, markdown formatting (like ```), or extra text. $base_prompt\n```fish\n$current_content\n```"
    echo
    spinner &
    set -l spinner_pid $last_pid
    trap "kill $spinner_pid >/dev/null 2>&1" SIGINT
    set -l new_cmd (echo "$prompt" | ask | string trim)
    kill $spinner_pid >/dev/null 2>&1

    # Replace the current commandline content with the AI's suggestion
    set -l cmd_line "$new_cmd"
    commandline "$cmd_line"
    commandline --cursor (string length "$cmd_line") # Move cursor to end
end
