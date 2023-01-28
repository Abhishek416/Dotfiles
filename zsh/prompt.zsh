autoload -Uz add-zsh-hook vcs_info
add-zsh-hook precmd vcs_info

zstyle ':vcs_info:*' check-for-changes true
setopt prompt_subst


# zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
# # 
# +vi-git-untracked(){
#     if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
#         git status --porcelain | grep '??' &> /dev/null ; then
#         hook_com[staged]+='!' # signify new files with a bang
#     fi
# }

zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
# zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})%{$reset_color%}"
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

PS1="%B%{$fg[yellow]%}⚡% %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}"
PS1+="\$vcs_info_msg_0_ "
