source ~/.zsh/antigen.zsh

antigen use oh-my-zsh

# bundles
antigen bundles <<EOBUNDLES
  zsh-users/zsh-syntax-highlighting
  colorize
  cp
  autoenv
  git
  bower
  coffee
  gitfast
  git-extras
  jsontools
  npm
  sindresorhus/pure
  nyan
EOBUNDLES

antigen apply

autoload -U promptinit && promptinit
prompt pure

bindkey '^P' up-history
bindkey '^k' up-history
bindkey '^N' down-history
bindkey '^j' down-history
bindkey '^h' backward-word
bindkey '^l' forward-word
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

export KEYTIMEOUT=1

export PATH=~/tools/arcanist/bin:$PATH
# ctags on mac
export PATH="/usr/local/bin:$PATH"
export EDITOR='DYLD_FORCE_FLAT_NAMESPACE=1 vim'
