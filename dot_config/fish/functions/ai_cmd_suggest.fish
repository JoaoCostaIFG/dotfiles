function ai_cmd_suggest
    set -l last_exit $status
    set -l prompt
    set -l new_cmd
    set -l cmd_line

    set -l base_prompt
    if test (count $argv) -ge 1
        set base_prompt "$argv[1]"
    else
        return 1
    end

    set -l current_content (commandline)
    set -l ls_output (ls)

    if test -z "$current_content"
        set -l last_cmd (history | head -1)
        if test -z "$last_cmd"
            return 0
        end

        if test "$last_exit" -eq 0
            set prompt "Only provide a single fish shell command as your response. Do not include any explanations, markdown formatting (like ```), or extra text. The previous command ran successfully. Suggest a single logical follow-up command.\n```fish\n$last_cmd\n```\nThe current directory contains these files:\n$ls_output"
        else
            set prompt "Only provide a single fish shell command as your response. Do not include any explanations, markdown formatting (like ```), or extra text. The previous command FAILED with exit code $last_exit. Suggest a single fixed or corrected command.\n```fish\n$last_cmd\n```\nThe current directory contains these files:\n$ls_output"
        end
        set new_cmd (echo "$prompt" | ask | string trim)

        set cmd_line "$new_cmd"
        commandline "$cmd_line"
        commandline --cursor (string length "$cmd_line")
        return
    end

    set prompt "Only provide a single fish shell command as your response. Do not include any explanations, markdown formatting (like ```), or extra text. $base_prompt\n```fish\n$current_content\n```\nThe current directory contains these files:\n$ls_output"
    set new_cmd (echo "$prompt" | ask | string trim)

    # Replace the current commandline content with the AI's suggestion
    set cmd_line "$new_cmd"
    commandline "$cmd_line"
    commandline --cursor (string length "$cmd_line") # Move cursor to end
end
