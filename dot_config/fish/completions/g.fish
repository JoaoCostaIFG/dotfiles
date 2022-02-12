function is_git_repo
  if [ -d .git ]
    echo .git
  else
    git rev-parse --git-dir 2>/dev/null
  end
end

function g_heads
  git for-each-ref --format="%(refname:strip=2)" \
    "refs/heads/**" "refs/remotes/**" 2>/dev/null
end

function g_tags
  git for-each-ref --format="%(refname:strip=2)" \
    "refs/tags/**" 2>/dev/null
end

function g_remotes
  git remote 2>/dev/null |
    awk '($3=="(push)") {print $1}'
end

# all subcmmands that g knows
set -l commands (g getallalias)

# disable file complition for the whole command
complete -c g -f

complete -c g -w git

# when we have nothing, complete those commands
complete -c g -n "not __fish_seen_subcommand_from $commands" \
  -a "$commands"

complete -c g -n "__fish_seen_subcommand_from br ck ckb m merge" \
  -a "(g_heads)"

complete -c g -n "__fish_seen_subcommand_from pl pul p pu psh" \
  -a "(g_remotes)"

complete -c g -n "__fish_seen_subcommand_from t tag tags" \
  -a "(g_tags)"

complete -c g -s f
