source ~/.files/fish/exports.fish
source ~/.files/fish/functions.fish
source ~/.files/fish/aliases.fish
source ~/.files/fish/fish_prompt.fish

function fish_user_key_bindings
  bind \cp history-search-backward
  bind \cn history-search-forward
  bind \ch backward-word
  bind \cl forward-word
  bind \cw backward-kill-word
end

set -x FZF_DEFAULT_COMMAND 'ag -l -g ""'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

# doesn't support new files
# set -x FZF_DEFAULT_COMMAND '
#   (git ls-tree -r --name-only HEAD ||
#    find * -name ".*" -prune -o -type f -print -o -type l -print) 2> /dev/null'

