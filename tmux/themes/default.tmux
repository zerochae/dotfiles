#!/usr/bin/env bash
bg="#1e1e2e"
fg="#cdd6f4"
cyan="#56b6c2"
gray="#4b5263"
pink="#e06c75"
red="#be5046"
green="#98c379"
blue="#61afef"
orange="#d19a66"
black="#5c6370"

# black2="#282c34"
# magenta="#c678dd"
# yellow="#e5c07b"

main() {
    get-tmux-option() {
        local option value default
        option="$1"
        default="$2"
        value="$(tmux show-option -gqv "$option")"

        if [ -n "$value" ]; then
            echo "$value"
        else
            echo "$default"
        fi
    }

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

    # status
    set status "on"
    set status-bg "${bg}"
    set status-justify "left"
    set status-left-length "100"
    set status-right-length "100"

    # messages
    set message-style "fg=${cyan},bg=${gray},align=centre"
    set message-command-style "fg=${cyan},bg=${gray},align=centre"

    # panes
    set pane-border-style "fg=${gray}"
    set pane-active-border-style "bg=default fg=#1a1a26"
    set pane-border-status bottom
    set pane-border-format ""
    set pane-border-lines heavy

    # windows
    setw window-status-activity-style "fg=${fg},bg=${bg},none"
    setw window-status-separator ""
    setw window-status-style "fg=${fg},bg=${bg},none"


    wt_enabled="$(get-tmux-option "window_tabs_enabled" "on")"
    readonly wt_enabled
    readonly show_session="#{?client_prefix,#[fg=$red],#[fg=$green]}#[bg=$bg]█#{?client_prefix,#[bg=$red],#[bg=$green]}#[fg=$bg] #[fg=$fg,bg=$bg] #S "
    readonly show_directory_in_window_status="#[fg=$bg,bg=$blue] #I #[fg=$fg,bg=$gray] #{b:pane_current_path} "
    readonly show_directory_in_window_status_current="#[fg=$bg,bg=$orange] #I #[fg=$fg,bg=$bg] #{b:pane_current_path} "
    readonly show_window_in_window_status="#[fg=$fg,bg=$bg] #W #[fg=$bg,bg=$blue] #I#[fg=$blue,bg=$bg]█#[fg=$fg,bg=$bg,nobold,nounderscore,noitalics] "
    readonly show_window_in_window_status_current="#[fg=$fg,bg=$bg] #W #[fg=$bg,bg=$orange] #I#[fg=$orange,bg=$bg]█#[fg=$fg,bg=$bg,nobold,nounderscore,noitalics] "
    local right_column2=$show_session
    local window_status_format=$show_directory_in_window_status
    local window_status_current_format=$show_directory_in_window_status_current

    if [[ "${wt_enabled}" == "on" ]]
    then
        window_status_format=$show_window_in_window_status
        window_status_current_format=$show_window_in_window_status_current
    fi

    set status-left ""
    set status-right "${right_column2}"

    setw window-status-format "${window_status_format}"
    setw window-status-current-format "${window_status_current_format}"
    setw clock-mode-colour "${blue}"
    setw mode-style "fg=${pink} bg=${black} bold"
}

main "$@"
