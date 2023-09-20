zsh_plugins=${ZSH_PLUGINS:-~}/.zsh_plugins.zsh

# Ensure you have a .zsh_plugins.txt file where you can add plugins.
[[ -f ${zsh_plugins:r}.txt ]] || touch ${zsh_plugins:r}.txt

# Lazy-load antidote.
fpath+=(${ZDOTDIR:-~}/.antidote)
autoload -Uz $fpath[-1]/antidote

# Generate static file in a subshell when .zsh_plugins.txt is updated.
if [[ ! $zsh_plugins -nt ${zsh_plugins:r}.txt ]]; then
    antidote bundle <$ZSH_PLUGINS/.zsh_plugins.txt >$ZSH_PLUGINS/.zsh_plugins.zsh
fi

# Source your static plugins file.
source $zsh_plugins
