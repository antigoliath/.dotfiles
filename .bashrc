# archlinux
# Add nano as default editor
# export EDITOR=vim
export EDITOR='DYLD_FORCE_FLAT_NAMESPACE=1 vim'
PATH=$PATH:~/.gem/ruby/2.0.0/bin #add gems
export GEM_HOME=~/.gem/ruby/2.0.0

# fix tmux colors
alias tmux="TERM=screen-256color-bce tmux"
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

# https://wiki.archlinux.org/index.php/DualScreen
alias monitor='monitor_none'
alias monitort='monitor_above'
alias monitorr='monitor_right'
alias monitorl='monitor_left'


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

# globals
export EC2='ubuntu@davidxu.me'

# navigation aliases
alias la='ls -a'
alias ll='ls -l'
alias l='ls'
alias lla='ls -la'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias sl='sl -al'
alias less-watch="watchr -e 'watch(".*\.less$") { |f| system("lessc #{f[0]} > #{f[0]}.css") }'"
alias cd='cd_ls'

# ssh
alias labs='ssh davidxu@pennapps.com'

# web
alias wget='wget -c'

# search
alias ack='ack --flush --color'

# applications
alias minecraft='java -Xmx1024M -Xms512M -cp ~/Desktop/minecraft.jar net.minecraft.LauncherFrame'
alias sass='sass --watch'
# alias python='ipython'
alias chrome-local='chromium-browser --allow-file-access-from-files'
alias google-chrome='google-chrome --audio-buffer-size=2048'
alias chrome='open -a Google\ Chrome --args --disable-web-security'
alias venv='virtualenv'

# editor-related
# ain't no one usin' nothin but vim!
alias vi='vim'
# alias emacs='vim'
alias nano='vim'
alias gedit='vim'
# hack for YCM
alias vim='DYLD_FORCE_FLAT_NAMESPACE=1 vim'
alias mvim='DYLD_FORCE_FLAT_NAMESPACE=1 mvim'

alias lvim="!vim" # lastvim

# system
alias logout='lxsession-logout'
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

alias install='sudo apt-get install'
alias uninstall='sudo apt-get rm'
alias update='sudo apt-get update'

# funny stuff
alias ecco='cowsay_echo'


function cowsay_echo(){
  # edge case
  if [ "$#" -eq 0 ]; then
    cowsay ' '
  else
    cowsay $@
  fi
}

# have it show it after changing
function cd_ls(){
  builtin cd $@; ls
}

# Usage: seasprint xx.pdf (modified from Kyle)
function seasprint() {
   cat "$1" | ssh davidxu@eniac.seas.upenn.edu lpr -P169 -o page-ranges=$2-$3 -o Duplex=DuplexNoTumble
}

# Block or unblock Facebook (taken from KH)
blockfb() {
    if [ -f /etc/hosts-fb ]; then # Facebook is blocked
        read -sp "Are you sure you want to unblock Facebook? " response
        if [ $response != "yes" ]; then
            echo "Sorry, I guess you're not sure."
        else
            sudo mv /etc/hosts-fb /etc/hosts
            echo "Facebook has been unblocked."
        fi
    else # Block Facebook
        sudo cp /etc/hosts /etc/hosts-fb
        sudo sh -c 'echo "127.0.0.1 facebook.com" >> /etc/hosts'
        sudo sh -c 'echo "127.0.0.1 www.facebook.com" >> /etc/hosts'
        sudo sh -c 'echo "127.0.0.1 https://www.facebook.com" >> /etc/hosts'
        echo "Facebook has been blocked."
    fi
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

# always show git branch
# Git branch in prompt.
# Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\w \t\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
