# fix tmux colors
alias tmux="env TERM=screen-256color-bce tmux"
# https://wiki.archlinux.org/index.php/DualScreen
alias monitor='monitor_none'
alias monitort='monitor_above'
alias monitorr='monitor_right'
alias monitorl='monitor_left'
# navigation aliases

alias ls='ls -FG'
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias lla='ls -la'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias sl='sl -al'


# have it show it after changing
function cd_ls
  if count $argv > /dev/null
    \cd "$argv"; ls
  else
    \cd ~; ls
  end
end

# alias cd='cd_ls'

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
# alias nano='vim'
# alias gedit='vim'
# hack for YCM
# macvim, dyld for youcompleteme

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

# ssh
alias eniac='ssh davidxu@eniac.seas.upenn.edu'

# funny stuff
alias ecco='cowsay_echo'

# git
alias gco='git commit'
alias gcom='git commit -m '
alias gra='git remote add'
alias grr='git remote rm'
alias gc='git clone'
alias gch='git cherry-pick'
alias gr='git rebase'
alias gri='git rebase -i'
alias grf='git reflog show'
alias gd='git diff'
alias gd='git diff'
alias gps='git push'
alias gpl='git pull'
alias gf='git fetch'
alias ga='git add'

# coding
alias node='env NODE_NO_READLINE=1 rlwrap node'
alias git='hub'

alias mouse_accel_off='defaults write .GlobalPreferences com.apple.mouse.scaling 0'
alias mouse_accel_on='defaults write .GlobalPreferences com.apple.mouse.scaling 1'

alias up='cd ~/code/upthere/upthere/'
alias uprest='cd ~/code/upthere/core/upthere/ ; bin/rest_bridge --env=staging'

alias jshint='jshint --config ~/.files/.jshintrc'

alias mux=tmuxinator

# ag
alias ssg='ag -p ~/.files/.agignore'
