alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias lw=$HOME/Documents/workspace/LeaveWork/lw.sh
alias ls='logo-ls -D'
alias ll='logo-ls -oDh'
# alias ls='lsd'
# alias ll='lsd -ll'
alias coffee='caffeinate -d'
alias vimdiff='nvim -d'
alias intel="arch -x86_64"
alias arm="arch -arm64"
alias ibrew="arch -x86_64 /usr/local/bin/brew"
alias abrew="arch -arm64 /opt/homebrew/bin/brew"
alias ip='myip=$(ipconfig getifaddr en0); echo -e "\n\033[33m IP address: \033[36m$myip\033[0m"; echo $myip | pbcopy'
alias unipick='kitty +kitten unicode_input'
alias db='mysql -p'
alias wiki='glow ~/Dev/wiki'

alias c='cd ~/.config && vim'
alias zc='vim ~/.zshrc'
alias gc='vim ~/.gitconfig'
alias tc='vim ~/.tmux.conf'
alias vc='cd ~/.config/nvim && vim'
alias hc='vim ~/.hammerspoon/init.lua'

# alias zs='source ~/.zshrc'
alias ts="tmux source ~/.tmux.conf"
alias zs='antidote bundle <$ZSH_PLUGINS/.zsh_plugins.txt >$ZSH_PLUGINS/.zsh_plugins.zsh && source ~/.zshrc'
