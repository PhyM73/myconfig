# Initialize in interactive mode, to supplement .bashrc 

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Only run once
if [ -z "$_INIT_SH_LOADED" ]; then
    _INIT_SH_LOADED=1
else
    return
fi

# Append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000



# Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -f "$HOME/.local/etc/config.sh" ]; then
    . "$HOME/.local/etc/config.sh"
fi

if [ -f "$HOME/.local/etc/local.sh" ]; then
    . "$HOME/.local/etc/local.sh"
fi

# Source global definitons
if [ -n "$BASH_VERSION" ]; then
   if [ -f /etc/bashrc ]; then
        . /etc/bashrc
   fi
fi

# If in login mode
if [ -n "$BASH_VERSION" ]; then
    if shopt -q login_shell; then
        if [ -f "$HOME/.local/etc/login.sh" ] && [ -z "$_INIT_SH_NOLOG" ]; then
            . "$HOME/.local/etc/login.sh"
        fi
    fi
elif [ -n "$ZSH_VERSION" ]; then
    if [[ -o login ]]; then
        if [ -f "$HOME/.local/etc/login.sh" ] && [ -z "$_INIT_SH_NOLOG" ]; then
            . "$HOME/.local/etc/login.sh"
        fi
    fi
fi


# Clean PATH, move redundant things.
if [ -n "$PATH" ]; then
    old_PATH=$PATH:; PATH=
    while [ -n "$old_PATH" ]; do
        x=${old_PATH%%:*}      
        case $PATH: in
           *:"$x":*) ;;         
           *) PATH=$PATH:$x;;  
        esac
        old_PATH=${old_PATH#*:}
    done
    PATH=${PATH#:}
    unset old_PATH x
fi

export PATH


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# User specific aliases and functions
if [ -f /cvmfs/cms.cern.ch/ ]; then
    source /cvmfs/cms.cern.ch/cmsset_default.sh
    export CMSSW_GIT_REFERENCE=/cvmfs/cms.cern.ch/cmssw.git.daily
fi

export PS1='[\u\[\e[34m\]@\[\e[0m\]\h \W]\$ '

# enhance cd command
shopt -s cdspell
export CDPATH=.:~

# enhance history search
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
