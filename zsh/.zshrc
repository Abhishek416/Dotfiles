HISTFILE=~/.cache/zsh/history

autoload -Uz colors && colors
PS1="%B%{$fg[cyan]%}[ %{$fg[white]%}%M %{$fg[magenta]%}%~ %{$fg[cyan]%}]%{$reset_color%} $%b "

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d $HOME/.cache/zsh/zcompdump
_comp_opions+=(globdots) # Include hidden files

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source
#zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-exports"
#zsh_add_file "zsh-prompt"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Use vim keys in tab complete menu:
bindkey -s '^o' 'ranger^M'
bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down
