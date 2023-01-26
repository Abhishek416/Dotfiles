#!/bin/sh

if command -v fzf &> /dev/null; then
    [ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
    [ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

    if [[ "$(uname -s)" == "Darwin" && "$(command -v brew)" != "" ]] ; then
        local FZF_HOME=$(brew --prefix)/opt/fzf
        [ -f $FZF_HOME/shell/completion.zsh ] && source $FZF_HOME/shell/completion.zsh
        [ -f $FZF_HOME/shell/key-bindings.zsh ] && source $FZF_HOME/shell/key-bindings.zsh
    fi
fi
