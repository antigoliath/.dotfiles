set -x PATH /usr/local/bin $PATH
set -x EDITOR vim
set -x NVM_DIR "/Users/robo/.nvm" set -x KEYTIMEOUT 1
if test -e /usr/local/bin/fish
  set -x SHELL /usr/local/bin/fish
else if test -e /usr/bin/fish
  set -x SHELL /usr/bin/fish
else
  echo "[.files] ERROR: fish was not found in /usr/local/bin/fish or /usr/bin/fish. SHELL was not set."
end

# globals
set -x EC2 'ubuntu@184.73.248.188'
set -x do 'dxu@198.199.119.65'
set -x gj 'ubuntu@ec2-54-183-131-12.us-west-1.compute.amazonaws.com'

set -x PATH (yarn global bin) $PATH
