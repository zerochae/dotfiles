#!/usr/bin/env bash

set -g mouse on
set -g mode-keys vi
set -g default-terminal "$TERM"
set -ga terminal-overrides ",xterm-256color:Tc"
set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0

setw -g mode-keys vi
