# HOMEBREW
export PATH=~/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH="/opt/homebrew/bin:$PATH"

# CONDA
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# DOTFILES (.cfg repo)
alias config='/usr/bin/git --git-dir=/Users/qiaochloe/.cfg/ --work-tree=/Users/qiaochloe'

# THE FUCK
eval $(thefuck --alias)

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
