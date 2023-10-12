#!/usr/bin/env bash

tmux set-option -g mouse on
tmux set-option -g mode-keys vi
tmux set-option -g default-terminal "$TERM"
tmux set-option -ga terminal-overrides ",xterm-256color:Tc"
tmux set-option -as terminal-overrides ",*:Smulx=\E[4::%p1%dm"
tmux set-option -as terminal-overrides ",*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m"
tmux set-option -q -g status-utf8 on

tmux set-window-option -g mode-keys vi
tmux set-window-option -q -g utf8 on
