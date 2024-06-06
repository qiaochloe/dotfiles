# POWERLEVEL10K (should stay close to the top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# PATH
export PATH=~/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# HOMEBREW
export PATH="/opt/homebrew/bin:$PATH"

source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

# ALIASES
alias config='/usr/bin/git --git-dir=/Users/qiaochloe/.cfg/ --work-tree=/Users/qiaochloe' # DOTFILES (.cfg repo)
alias path='echo $PATH | tr -s ":" "\n"' # PRETTY PRINT THE PATH

# VIM BINDINGS
bindkey -v
# Avoid the annoying backspace/delete issue where backspace stops deleting characters
bindkey -v '^?' backward-delete-char

# THE FUCK
eval $(thefuck --alias)

# ZOXIDE
eval "$(zoxide init --cmd cd --hook prompt zsh)"

# CONDA
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
# . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"  # commented out by conda initialize
    else
# export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"  # commented out by conda initialize
    fi
fi
unset __conda_setup

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ZSH-SYNTAX-HIGHLIGHTING (keep at the bottom)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# RUBY
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init - zsh)"

# RUST
export PATH="$HOME/.cargo/bin:$PATH"

# CONDA
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
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
# <<< conda initialize <<<

# opam configuration
[[ ! -r /Users/qiaochloe/.opam/opam-init/init.zsh ]] || source /Users/qiaochloe/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

