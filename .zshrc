if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git web-search zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

function ghpr() {
  GH_FORCE_TTY=100% gh pr list | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 | awk '{print $1}' | xargs gh pr checkout
}

alias vim="nvim"
alias v="nvim"
alias bb="brazil-build"
alias bbb="brazil-recursive-cmd -all brazil-build --reverse"
alias gg="./gradlew"
alias gt="lazygit"
alias cd="z"
alias ci="zi"
alias cat="bat"
alias cc="clear"
alias zh="cat ~/dot/help/tips.md"
alias lt="exa -T -L 3 --icons --git-ignore"
alias ls="exa -a -l --no-permissions --icons --no-user -h -s extension"
alias lss="exa -a -l --no-permissions --icons --no-user -h -s size -r"

eval "$(zoxide init zsh)"

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
