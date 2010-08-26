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
	[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
fi


if [[ -s `brew --prefix`/Library/Contributions/brew_bash_completion.sh ]]; then
	source `brew --prefix`/Library/Contributions/brew_bash_completion.sh;
fi
