autoload -Uz plug

# Colors
autoload -Uz colors && colors

# completions
autoload -Uz compinit
zstyle ':completion:*' menu yes select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
# _comp_options+=(globdots)		# Include hidden files.
# zle_highlight=('paste:none')
for dump in "${ZDOTDIR:-$HOME}/.zcompdump"(N.mh+24); do
  compinit
done
# compinit -C

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey -s '^o' 'ranger^M'
bindkey '^ ' autosuggest-accept
bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down

# bindings
bindkey -s '^x' '^usource ${ZDOTDIR:-$HOME}/.zshrc\n'
bindkey -M menuselect '?' history-incremental-search-forward
bindkey -M menuselect '/' history-incremental-search-backward

unsetopt beep
setopt auto_cd
setopt glob_dots
setopt nomatch
setopt menu_complete
setopt extended_glob
setopt interactive_comments
setopt append_history

HISTFILE="${ZDOTDIR:-$HOME}/.history"
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

