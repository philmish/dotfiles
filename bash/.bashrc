# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source the git promp script
. "$HOME/scripts/git-prompt.sh"
PS1='[\t] $(__git_ps1 " (%s)") \u@\h  \w\n  > '

if [[ -f ~/.bash_aliases ]]; then
    source ~/.bash_aliases
fi

export EDITOR="nvim"
export PAGER="bat -p"

# completion
if [[ -f source /usr/share/bash-completion/completions/git ]]; then
    source /usr/share/bash-completion/completions/git
fi
