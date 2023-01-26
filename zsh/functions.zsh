# Function to source files if they exist
function add(){
  [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

function plug() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then 
        # For plugins
        add "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        add "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh" || \
        add "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh-theme"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    fi
}
