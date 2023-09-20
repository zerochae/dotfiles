alias tk='tmux kill-session -t'
alias tls='tmux ls'
alias ta='tmux attach -t'
alias td='tmux detach'
alias t="\
  tmux new-session -d -s gray -n ' ' -c $CONFIG \; \
       new-window -n ' ' -c $DEV \; \
       new-window -n ' ' -c $WORKSPACE \; \
       new-window -n ' ' -c $WORKSPACE \; \
       new-window -n ' ' -c $WORKSPACE \; \
       new-window -n ' ' -c $DEV \; \
       new-window -n ' ' -c $DEV/note/ \; \
       new-window -n ' ' -c $DEV \; && \
  tmux attach -t"
