#!/usr/bin/env bash

SESSION="cluster"
SESSION_EXISTS=$(tmux ls | grep $SESSION)

if [[ "$SESSION_EXISTS" == "" ]]; then
    # initialize session and window
    tmux new-session -c $HOME -d -s $SESSION
    tmux rename-window -t 0 "Raspberry-Pi"

    # split window in four panes
    tmux split-window -c $HOME -h -t 0
    tmux split-window -c $HOME -v -t 0
    tmux split-window -c $HOME -v -t 2

    # login to the raspberry pi's
    # ssha is an alias for >> eval '$(ssh-agent -s)' && ssh-add ~/.ssh/id_ed25519
    tmux send-keys -t 0 "ssha"
    tmux send-keys -t 1 "ssha"
    tmux send-keys -t 2 "ssha"
    tmux send-keys -t 3 "ssha"
fi

tmux attach-session -t $SESSION:0