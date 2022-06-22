export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(
  git
  zsh-autosuggestions
  autojump
  asdf
  fzf
)
source /Users/kwon-gray/util/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $ZSH/oh-my-zsh.sh
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)Gray"
  fi
}
eval $(/opt/homebrew/bin/brew shellenv)

# nodejs
export PATH=/usr/local/bin:$PATH

# ruby
export PATH={$Home}/.rbenv/bin:$PATH && \
eval "$(rbenv init -)"

# asdf
# . $(brew --prefix asdf)/libexec/asdf.sh

# LANG
export LANG=en_US.UTF-8

# Alias
alias vi="nvim"
alias vim="nvim"
# alias ls="lsd --no-symlink"
# alias ll="lsd -l --no-symlink"
# alias lt="lsd --tree --no-symlink"
alias lw=/Users/kwon-gray/Documents/workspace/LeaveWork/lw.sh
alias ls='logo-ls -D'
# alias la='logo-ls -A'
alias ll='logo-ls -oDh'
# equivalents with Git Status on by Default
# alias lsg='logo-ls -D'
# alias lag='logo-ls -AD'
# alias llg='logo-ls -alD'

# word-warp
  # disable
  # tput rmam
  # enalbes
  # tput smam
test -e /Users/kwon-gray/.iterm2_shell_integration.zsh && source /Users/kwon-gray/.iterm2_shell_integration.zsh || true

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi
