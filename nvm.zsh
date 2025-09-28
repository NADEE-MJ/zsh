# Load NVM if it exists - prefer system installation first, fallback to user installation
if [ -f "/usr/share/nvm/init-nvm.sh" ]; then
    source /usr/share/nvm/init-nvm.sh
else
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi
