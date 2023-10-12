#!/usr/bin/env bash
# shellcheck disable=2035

# unbind
tmux unbind-key -T copy-mode-vi Enter

# copy mode
tmux bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"
tmux bind-key -T copy-mode-vi Escape send -X cancel
tmux bind-key -T copy-mode-vi v send -X begin-selection
tmux bind-key -T copy-mode-vi V send -X select-line
tmux bind-key -T copy-mode-vi C-v send -X rectangle-toggle
tmux bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "pbcopy"
tmux bind-key "/" copy-mode "\;" send-key "?"
tmux bind-key v copy-mode

tmux bind-key b choose-buffer -Z "run \"tmux saveb -b %% - | tmux loadb -\""
tmux bind-key p paste-buffer -p

# move
tmux bind-key -n C-h previous-window
tmux bind-key -n C-l next-window

# pane
# tmux bind-key h select-pane -L
# tmux bind-key j select-pane -D
# tmux bind-key k select-pane -U
# tmux bind-key l select-pane -R

# split
# tmux bind-key V split-window -v
# tmux bind-key H split-window -h
