# POWERLEVEL10K (should stay close to the top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme

# ALIASES
alias config='/usr/bin/git --git-dir=/Users/qiaochloe/.cfg/ --work-tree=/Users/qiaochloe' # DOTFILES (.cfg repo)
alias path='echo $PATH | tr -s ":" "\n"' # PRETTY PRINT THE PATH

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

# HOMEBREW
export PATH="/opt/homebrew/bin:$PATH"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# PATH
export PATH=~/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# THE FUCK
eval $(thefuck --alias)

# ZOXIDE
eval "$(zoxide init --cmd cd --hook prompt zsh)"

# ZSH-SYNTAX-HIGHLIGHTING (keep at the bottom)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh