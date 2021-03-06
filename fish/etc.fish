function fish_user_key_bindings
  bind \cp history-search-backward
  bind \cn history-search-forward
  bind \ch backward-word
  bind \cl forward-word
  bind \cw backward-kill-word
end


set -x FZF_DEFAULT_COMMAND 'rg --files'
# set -x FZF_DEFAULT_COMMAND 'ag -l -g ""'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -x OCAMLRUNPARAM "b"

# doesn't support new files
# set -x FZF_DEFAULT_COMMAND '
#   (git ls-tree -r --name-only HEAD ||
#    find * -name ".*" -prune -o -type f -print -o -type l -print) 2> /dev/null'

fundle plugin 'edc/bass'

fundle init

function nvm
  bass source ~/.nvm/nvm.sh ';' nvm $argv
end

#source ~/.config/fish/nvm-wrapper/nvm.fish

# eval (opam config env --shell=fish)


# set -x TERM xterm-256color
