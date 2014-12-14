source ~/.zsh/antigen.zsh

antigen bundle sindresorhus/pure

antigen use oh-my-zsh

# bundles
antigen bundles <<EOBUNDLES
  zsh-users/zsh-syntax-highlighting
  colorize
  command-not-found
  cp
  autoenv
  tmux
  tmuxinator
  vi-mode
  git
  battery
  bower
  brew
  coffee
  gitfast
  git-extras
  jsontools
  npm
  nyan
  lol
  osx
  pip
  web-search
  virtualenv
EOBUNDLES

antigen apply

autoload -U promptinit && promptinit
prompt pure

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

export KEYTIMEOUT=1


export PATH=~/tools/arcanist/bin:$PATH
# ctags on mac
export PATH="/usr/local/bin:$PATH"
export EDITOR='DYLD_FORCE_FLAT_NAMESPACE=1 vim'


