#!/bin/bash
# 
# Default .bashrc file
# 
# Uncomment to force sourcing this file by non-interactive scripts
# export BASH_ENV=$HOME/.bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Short-circuit and return if we are in Thinlinc Startup
if [ -n "$TLPREFIX" -a -z "$TLPROFILE" ]; then
        return
fi

# User specific environment

# $HOME/.local/bin and $HOME/bin are already in $PATH, consider $PROJECT/bin
# export PATH="$PATH:$PROJECT/bin"

# Custom prompt: for interactive shells only.
if [[ $- == *i* ]]; then
    HOSTNAME=$(hostname -f)
    export PS1='\[\e[1m\]\u@${HOSTNAME%.*.*.*}:[\W]\[\e[0m\] $ '
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=


# User specific aliases and functions can go here:
#

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/apps/spack/anvil/apps/anaconda/2021.05-py38-gcc-8.4.1-vrzyh2x/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/apps/spack/anvil/apps/anaconda/2021.05-py38-gcc-8.4.1-vrzyh2x/etc/profile.d/conda.sh" ]; then
        . "/apps/spack/anvil/apps/anaconda/2021.05-py38-gcc-8.4.1-vrzyh2x/etc/profile.d/conda.sh"
    else
        export PATH="/apps/spack/anvil/apps/anaconda/2021.05-py38-gcc-8.4.1-vrzyh2x/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
