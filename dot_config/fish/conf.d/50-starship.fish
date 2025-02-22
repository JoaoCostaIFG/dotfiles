# starship
# only set it for interactive sessions
status is-interactive || exit

if command -v starship >/dev/null
    starship init fish --print-full-init | source
end
