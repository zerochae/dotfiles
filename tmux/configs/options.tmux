#!/usr/bin/env bash

readonly term_color_override=",xterm-256color:Tc"
readonly term_undercurl_override=",*:Smulx=\E[4::%p1%dm"
readonly term_undercurl_override2=",*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m"


tmux set-option -g              allow-passthrough on
tmux set-environment -g         'IGNOREEOF' 2
tmux set-option -g              default-shell "$SHELL" 
tmux set-option -g              default-command /bin/zsh
tmux set-option -g              default-terminal "xterm-256color"
tmux set-option -g              prefix C-b
tmux set-option -g              mode-keys vi
tmux set-option -g              status-keys vi
tmux set-option -ga             terminal-overrides "$term_color_override"
tmux set-option -as             terminal-overrides "$term_undercurl_override"
tmux set-option -as             terminal-overrides "$term_undercurl_override2"
tmux set-option -gq             status-utf8 on
tmux set-option -g              mouse on
tmux set-option -g              @emulate-scroll-for-no-mouse-alternate-buffer on
tmux set-option -g              @scroll-down-exit-copy-mode off
tmux set-option -g              @scroll-without-changing-pane on
tmux set-option -g              @scroll-in-moused-over-pane on

tmux set-window-option -g       mode-keys vi
tmux set-window-option -gq      utf8 on

