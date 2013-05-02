# archlinux
# Add nano as default editor
export EDITOR=vim

alias ls='ls --color=auto'
[ ! "$UID" = "0" ] && archbey2

# git completion
source /usr/share/git/completion/git-completion.bash

# https://wiki.archlinux.org/index.php/DualScreen

# above: xrandr --output VGA1 --mode 1024x768 --output HDMI1 --mode 1024x768 --above VGA1

# left-of: xrandr --output VGA1 --mode 1024x768 --output HDMI1 --mode 1024x768 --left-of VGA1

# right-of: xrandr --output VGA1 --mode 1024x768 --output HDMI1 --mode 1024x768 --right-of VGA1


if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM=xterm-256color
else export TERM=xterm-color
fi

# globals
export EC2='ubuntu@davidxu.me'

# navigation aliases
alias cd='cd_ls'
alias la='ls -a'
alias ll='ls -l'
alias l='ls'
alias lla='ls -la'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias sl='sl -al'

# ssh
alias labs='ssh davidxu@pennapps.com'

# web
alias wget='wget -c'

# search
alias ack='ack --flush --color'

# applications
alias minecraft='java -Xmx1024M -Xms512M -cp ~/Desktop/minecraft.jar net.minecraft.LauncherFrame'
alias sass='sass --watch'
alias python='ipython'
alias chrome-local='chromium-browser --allow-file-access-from-files'
alias google-chrome='google-chrome --audio-buffer-size=2048'
alias chrome='google-chrome'
alias venv='virtualenv'

# editor-related
# ain't no one usin' nothin but vim!
alias vi='vim'
alias emacs='vim'
alias nano='vim'
alias gedit='vim'

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
        # if [ $response != "YesI'mfucking*positive*" ]; then
        #     echo "Sorry, I guess you're not sure."
        # else
            sudo mv /etc/hosts-fb /etc/hosts
            echo "Facebook has been unblocked."
        # fi
    else # Block Facebook
        sudo cp /etc/hosts /etc/hosts-fb
        sudo sh -c 'echo "127.0.0.1 facebook.com" >> /etc/hosts'
        sudo sh -c 'echo "127.0.0.1 www.facebook.com" >> /etc/hosts'
        echo "Facebook has been blocked."
    fi
}



# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}
