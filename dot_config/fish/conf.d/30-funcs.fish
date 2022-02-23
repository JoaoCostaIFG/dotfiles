# FUNCS
# In order to use the functions I already used for bash (and other POSIX compliant shells),
# the following file needs to be sourced.
# The problem is that much of the syntax isn't compatible with fish. One could attempt
# to use some regex based method (e.g. with sed or awk) like the one bellow for it to
# be parsable by fish:
#   `sed 's/\s{$/;/; s/}$/end/; s/;\s*do$/;/; s/\s*done$/end/; s/;\s*then$/;/; s/\s*fi$/end/'`
# This wouldn't work with variable definitions. For that reason, I'm using
# [babelfish](https://github.com/bouk/babelfish) to translate the file and source it on fish.
# That file should strieve to be simple, because babelfish isn't feature complete (as far as I know).

babelfish <"$HOME/.config/funcrc" | source

