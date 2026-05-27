# powerlevel10k (should stay close to the top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# path
export PATH=~/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# homebrew
export PATH="/opt/homebrew/bin:$PATH"
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

# aliases
alias c='clear'
alias lazyvim="NVIM_APPNAME=lazyvim nvim"
alias path='echo $PATH | tr -s ":" "\n"'

# vim bindings for terminal
bindkey -v
# avoid the backspace/delete issue where backspace stops deleting characters
bindkey -v '^?' backward-delete-char

# zoxide
eval "$(zoxide init --hook prompt zsh)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# direnv
eval "$(direnv hook zsh)"

# zsh-syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
