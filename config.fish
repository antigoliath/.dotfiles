source ~/.config/fish/exports.fish
source ~/.config/fish/functions.fish
source ~/.config/fish/aliases.fish

function fish_user_key_bindings
  bind \cp history-search-backward
  bind \cn history-search-forward
  bind \ch backward-word
  bind \cl forward-word
  bind \cw backward-kill-word
end


