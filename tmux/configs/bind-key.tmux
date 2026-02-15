#!/usr/bin/env bash

tmux unbind-key -a

tmux unbind-key -T         copy-mode-vi Enter
tmux bind-key   -T         copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"
tmux bind-key   -T         copy-mode-vi Escape send -X cancel
tmux bind-key   -T         copy-mode-vi v send-keys -X begin-selection
tmux bind-key   -T         copy-mode-vi V send-keys -X select-line
tmux bind-key   -T         copy-mode-vi C-v send -X rectangle-toggle
tmux bind-key   -T         copy-mode-vi MouseDragEndPane send-keys -X copy-pipe-and-cancel "pbcopy"
tmux bind-key   -T         copy-mode-vi o send-keys -X copy-pipe-and-cancel \
  'tmux send-keys "C-q"; xargs -I {} tmux send-keys "nvim {}"; tmux send-keys "C-m"'
# bind-key -T copy-mode-vi o send-keys -X copy-pipe-and-cancel "$TMUX_DIR/sh/open-file.pl"

tmux bind-key              "/" copy-mode "\;" send-keys "?"
tmux bind-key              v copy-mode
tmux bind-key              b choose-buffer -Z "run \"tmux saveb -b %% - | tmux loadb -\""
tmux bind-key              p paste-buffer -p
tmux bind-key              : command-prompt
tmux bind-key              d detach
tmux bind-key              n neww
tmux bind-key              R source-file ~/.tmux.conf

tmux bind-key   -n         C-h previous-window
tmux bind-key   -n         C-l next-window

tmux bind-key              q confirm-before kill-pane
tmux bind-key              Q confirm-before kill-window
tmux bind-key              f run-shell  "$TMUX_DIR/sh/search-regex.sh"
