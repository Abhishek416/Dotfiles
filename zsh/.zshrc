# Useful Functions
source "$ZDOTDIR/functions.zsh"

# Normal files to source
# add "zsh-vim-mode"
add "alias.zsh"
add "export.zsh"
add "supercharge.zsh"
add "fzf.zsh"
add "prompt.zsh"

# Plugins
plug "zsh-users/zsh-autosuggestions"

if command -v bat &> /dev/null; then
  alias cat="bat -pp --theme \"Visual Studio Dark+\"" 
  alias catt="bat --theme \"Visual Studio Dark+\"" 
fi

# PS1="%B%{$fg[cyan]%}[ %{$fg[white]%}%M %{$fg[magenta]%}%~ %{$fg[cyan]%}]%{$reset_color%} $%b "
