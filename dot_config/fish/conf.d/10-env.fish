# This will read the file with environment variables and
# process the lines so they can be run on fish

status is-login || exit

replay source "$HOME/.profile"
