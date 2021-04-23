# .bashrc

# Source global definitons
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# User specific aliases and functions
alias ll='ls -AlF --color=auto'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias jl='jupyter lab --no-browser'
alias root='root -l'


if [ -f /cvmfs/cms.cern.ch/ ]; then
    source /cvmfs/cms.cern.ch/cmsset_default.sh
    export CMSSW_GIT_REFERENCE=/cvmfs/cms.cern.ch/cmssw.git.daily
fi

export PS1='[\u\[\e[34m\]@\[\e[0m\]\h \W]\$ '
