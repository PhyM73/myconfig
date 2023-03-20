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

# History settings

# for setting history length see HISTSIZE and HISTFILESIZE in zsh(1)
HISTSIZE=100000000
HISTFILESIZE=1000000000

# Add Timestamp to history
setopt EXTENDED_HISTORY

# Append to history
setopt APPEND_HISTORY

# Adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY

# Ignore duplucated history commands
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

# Correct path or command
setopt CORRECT
setopt CORRECT_ALL

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
if [ -f ~/.my_aliases ]; then
    . ~/.my_aliases
fi

# User specific aliases and functions
if [ -e /cvmfs/cms.cern.ch/ ]; then
    source /cvmfs/cms.cern.ch/cmsset_default.sh
    export CMSSW_GIT_REFERENCE=/cvmfs/cms.cern.ch/cmssw.git.daily
fi

export PROMPT='%(?.%F{green}@.%F{red}?%?)%f%m:%F{cyan}%1~%f $(git_prompt_info)'

# enhance cd command
export CDPATH=.:~
