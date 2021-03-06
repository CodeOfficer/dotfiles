source ~/dotfiles/bash/env
source ~/dotfiles/bash/config
source ~/dotfiles/bash/aliases

# private aliases, machine specific, etc
if [ -f ~/dotfiles/bash/paliases ]; then
  source ~/dotfiles/bash/paliases;
fi

# if [[ -s /Users/codeofficer/.rvm/scripts/rvm ]]; then
#   source /Users/codeofficer/.rvm/scripts/rvm;
#   [[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
# fi
#
# if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
#   source /usr/local/etc/bash_completion.d/git-completion.bash
# fi

# [[ $- == *i* ]]   &&   . ~/dotfiles/git-prompt/git-prompt.sh