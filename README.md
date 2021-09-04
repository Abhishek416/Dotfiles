# Introduction 
Personal config files that i use with dwm.

# Dotfiles ( .config )
![ desktop image ]($HOME/pics/screenshots/desktop.png)

## Installation
you have to install git
```
# clone them first
git clone https://github.com/Abhishek416/dotfiles.git -b stable 

# make dotfiles your .config directory 
mv dotfiles .config OR
cp -rf dotfiles/* ~/.config/

```

## .xinitrc && .zprofile
copy them from $HOME/.config/x/ && $HOME/.config/zsh/ OR
create them on your own. 
( zprofile recommended to copy )

```
cp $HOME/.config/x/.xinitrc $HOME/
cp $HOME/.config/zsh/zprofile $HOME/.zprofile
```
