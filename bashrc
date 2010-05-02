source ~/dotfiles/bash/env
source ~/dotfiles/bash/config
source ~/dotfiles/bash/aliases

# private aliases, machine specific, etc
if [ -f ~/dotfiles/bash/paliases ]; then
  source ~/dotfiles/bash/paliases;
fi

source ~/dotfiles/git-completion

if [[ -s /Users/codeofficer/.rvm/scripts/rvm ]]; then 
	source /Users/codeofficer/.rvm/scripts/rvm; 
fi