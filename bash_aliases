#! /bin/bash
alias ll='ls -AhlF --color=auto'
alias la='ls -Ah'
alias l='ls -CFh'
alias l.='ls -d .* --color=tty'         # short listing, only hidden files - .*
alias ltime='ls -lAthF'                 # long, sort by newest to oldest
alias Ltime='ls -lAtrhF'                # long, sort by oldest to newest
alias lchange='ls -lcr'                 # sort by change time
alias lh='ls -lSrh'                     # sort by size human readable
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias cp='cp -v'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias path='echo -e ${PATH//:/\\n}'     # path:         Echo all executable Paths

alias jl='jupyter lab --no-browser'
alias root='root -l'

alias lxplus='ssh lxplus'
