#!/usr/bin/env bash

set -g prefix C-b

bind-key -T copy-mode-vi 'v' send -X begin-selection
bind-key -T copy-mode-vi 'V' send -X select-line
bind-key -T copy-mode-vi 'r' send -X rectangle-toggle
bind-key h select-pane -L
bind-key j select-pane -D
bind-key k select-pane -U
bind-key l select-pane -R
bind-key V split-window -v
bind-key H split-window -h
bind-key / copy-mode \; send-key ?
bind-key -n C-h previous-window
bind-key -n C-l next-window

unbind-key -Tcopy-mode-vi Enter
unbind-key C-b

# Copy-paste like vim
# bind -T copy-mode-vi v send -X begin-selection
# bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"
# bind P paste-buffer
# bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "pbcopy"
