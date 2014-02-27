# archlinux
# Add nano as default editor
# export EDITOR=vim
export EDITOR='DYLD_FORCE_FLAT_NAMESPACE=1 vim'
PATH=$PATH:~/.gem/ruby/2.0.0/bin #add gems
export GEM_HOME=~/.gem/ruby/2.0.0
export VISUAL='mvim -f'

# git colors
git config --global color.ui true

# other
# alias ls='ls --color=auto'
# [ ! "$UID" = "0" ] && archbey2

# git completion
# source /usr/share/git/completion/git-completion.bash
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# ctags on mac
export PATH="/usr/local/bin:$PATH"
# python stuff on mac
export PATH=/usr/local/share/python:$PATH
# fix for YCM vim:
DYLD_FORCE_FLAT_NAMESPACE=1



function monitor_none(){
  xrandr --output LVDS1 --mode 1366x768 --output VGA1 --off
}

function monitor_above(){
  xrandr --output LVDS1 --mode 1366x768 --output VGA1 --mode 1920x1080 --above LVDS1
}

function monitor_left(){
  xrandr --output LVDS1 --mode 1366x768 --output VGA1 --mode 1920x1080 --left-of LVDS1
}

function monitor_right(){
  xrandr --output LVDS1 --mode 1366x768 --output VGA1 --mode 1920x1080 --right-of LVDS1
}

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM=xterm-256color
else export TERM=xterm-color
fi

function cowsay_echo(){
  # edge case
  if [ "$#" -eq 0 ]; then
    cowsay ' '
  else
    cowsay $@
  fi
}


# Usage: seasprint xx.pdf (modified from Kyle)
function seasprint() {
   cat "$1" | ssh davidxu@eniac.seas.upenn.edu lpr -P169 -o page-ranges=$2-$3 -o Duplex=DuplexNoTumble
}


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# {{{
# Node Completion - Auto-generated, do not touch.
# shopt -s progcomp
# for f in $(command ls ~/.node-completion); do
#   f="$HOME/.node-completion/$f"
#   test -f "$f" && . "$f"
# done
# }}}

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# always show git branch
# Git branch in prompt.
# Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [ "$color_prompt" = yes ]; then
    PS1="\w \t\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
# enable programmable completion features
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# have it show it after changing
function cd_ls(){
  builtin cd "$@"; ls
}

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
export COFFEELINT_CONFIG=~/.coffeelintrc

source ~/.files/.git-completion.bash
