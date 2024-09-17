#!/bin/bash

LOGFILE=~/.brew_usage_log

function log_brew_usage {
    echo "$(date): $1" >> $LOGFILE
}

if [ -n "$ZSH_VERSION" ]; then
    autoload -Uz add-zsh-hook
    add-zsh-hook preexec log_brew_usage
fi
