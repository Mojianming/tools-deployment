#!/bin/bash
# set -e
# set -x

SESSION=$1
WIN=$2

if [[ -z ${SESSION} ]];then
    SESSION="local"
fi

if [[ -z ${WIN} ]];then
    WIN="editor"
fi

tmux has-session -t ${SESSION} &> /dev/null

if [[ $? -ne 0 ]];then
    tmux new-session -s ${SESSION} -d
    # tmux new-session -s ${SESSION} -n ${WIN} -d
    # tmux rename-window ${WIN}
    # tmux send-keys -t ${SESSION} 'ls' C-m
    tmux split-window -v -p 32 -t ${SESSION}
    tmux select-pane -t :.1
    tmux split-window -h -p 32 -t ${SESSION}
    tmux select-pane -t :.1
    tmux select-window -t ${SESSION}:1
fi

tmux rename-window ${WIN}
tmux att -t ${SESSION}

