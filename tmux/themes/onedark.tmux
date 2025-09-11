#!/usr/bin/env bash
# shellcheck disable=2121

set() {
    local option=$1
    local value=$2
    tmux set-option -gq "$option" "$value"
}

setw() {
    local option=$1
    local value=$2
    tmux set-window-option -gq "$option" "$value"
}

main() {

    bg="#1e1e2e"
    fg="#cdd6f4"
    magenta="#c678dd"
    gray="#4b5263"
    red="#be5046"
    green="#98c379"
    blue="#61afef"
    orange="#d19a66"

    # black="#5c6370"
    # pink="#e06c75"
    # cyan="#56b6c2"
    # black2="#282c34"
    # yellow="#e5c07b"

    # status
    set status "on"
    set status-bg "${bg}"
    set status-justify "left"
    set status-left-length "100"
    set status-right-length "100"

    # messages
    set message-style "fg=${green},bg=${bg},align=centre"
    set message-command-style "fg=${magenta},bg=${bg},align=centre"

    # panes
    set pane-border-style "fg=${gray}"
    set pane-active-border-style "bg=default fg=#1a1a26"
    set pane-border-status bottom
    set pane-border-format ""
    set pane-border-lines heavy
    set mode-style "fg=blue,bg=default,reverse"

    # windows
    setw window-status-activity-style "fg=${fg},bg=${bg},none"
    setw window-status-separator ""
    setw window-status-style "fg=${fg},bg=${bg},none"
    setw clock-mode-colour "${blue}"

    readonly show_session="#{?client_prefix,#[fg=$red],#[fg=$green]}#[bg=$bg]█#{?client_prefix,#[bg=$red],#[bg=$green]}#[fg=$bg] #[fg=$fg,bg=$bg] #S "
    readonly show_window_in_window_status="#[fg=$fg,bg=$bg] #W #[fg=$bg,bg=$blue] #I#[fg=$blue,bg=$bg]█#[fg=$fg,bg=$bg,nobold,nounderscore,noitalics] "
    readonly show_window_in_window_status_current="#[fg=$fg,bg=$bg] #W #[fg=$bg,bg=$orange] #I#[fg=$orange,bg=$bg]█#[fg=$fg,bg=$bg,nobold,nounderscore,noitalics] "

    local status_right=$show_session
    local window_status_format=$show_window_in_window_status
    local window_status_current_format=$show_window_in_window_status_current

    set status-left ""
    set status-right "${status_right}"

    setw window-status-format "${window_status_format}"
    setw window-status-current-format "${window_status_current_format}"
}

main "$@"
