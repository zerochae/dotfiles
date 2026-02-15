#!/usr/bin/env bash
# shellcheck disable=2121,2034

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
	bg="#1A1A26"
	bg2="#2D3139"
	bar="#3F424A"
	fg="#abb2bf",

	coral="#d8868d",
	peach="#e1717a",
	red="#e06c75"
	maroon="#d35c65"

	gray="#4b5263"
	black="#5c6370"

	aqua="#7bc6d0",
	mint="#6bb6c0",
	cyan="#56b6c2"
	teal="#46a6b2",

	fuchsia="#d7a1e7",
	lavender="#c791d7",
	magenta="#c678dd"
	plum="#b568cd",

	sky="#8fc6f4",
	sapphire="#7fb6e4",
	blue="#61afef"
	navy="#519fdf",

	lime="#b3d39c",
	emerald="#a3c38c",
	green="#98c379"
	forest="#88b369",

	sunkiss="#f3b8a2"
	sunset="#f6cca0"
	orange="#d19a66"
	ember="#ae7750"
	grape="#CC9561",

	lemon="#edd4a6",
	sunshine="#dcc496",
	yellow="#e5c07b"
	mustard="#d4b06b",

	# black2="#282c34"

	# status
	set status "on"
	set status-style bg=default
	set status-justify "centre"
	set status-left-length "20"
	set status-right-length "20"
	set status-position bottom

	# messages
	set message-style "fg=${orange},bg=default,align=centre"
	set message-command-style "fg=${magenta},bg=default,align=centre"

	# panes
	set pane-border-style "bg=default fg=${bg}"
	set pane-active-border-style "bg=default fg=${orange}"
	set pane-border-status bottom
	set pane-border-format "#[fg=${orange}]#{?pane_active,#[bold],}[ #[fg=${grape}]#T#[fg=${orange}] ]"
	# set pane-border-format '                                                                                                                                                                                                  '
	set pane-border-lines double

	# windows
	setw window-status-activity-style "fg=${fg},bg=${bg},none"
	setw window-status-separator ""
	setw window-status-style "fg=${fg},bg=${bg},none"
	setw clock-mode-colour "${blue}"

	# style
	set mode-style "fg=$blue,bg=$bg,reverse"

	# cpu
	set @cpu_low_icon ""
	set @cpu_medium_icon ""
	set @cpu_high_icon ""
	set @cpu_medium_thresh "30"
	set @cpu_high_thresh "70"
	set @cpu_percentage_format "%0.f%%"
	set @cpu_low_bg_color "#[bg=$fuchsia]"
	set @cpu_low_fg_color "#[fg=$fuchsia]"
	set @cpu_medium_bg_color "#[bg=$magenta]"
	set @cpu_medium_fg_color "#[fg=$magenta]"
	set @cpu_high_bg_color "#[bg=$plum]"
	set @cpu_high_fg_color "#[fg=$plum]"

	# battery
	set @batt_icon_charge_tier1 ""
	set @batt_icon_charge_tier2 ""
	set @batt_icon_charge_tier3 ""
	set @batt_icon_charge_tier4 ""
	set @batt_icon_charge_tier5 ""
	set @batt_icon_charge_tier6 ""
	set @batt_icon_charge_tier7 ""
	set @batt_icon_charge_tier8 ""
	set @batt_icon_status_charged ""
	set @batt_icon_status_charging ""
	set @batt_icon_status_discharging ""
	set @batt_icon_status_attached ""
	set @batt_icon_status_unknown ""

	set @batt_color_charge_primary_tier1 "$maroon"
	set @batt_color_charge_primary_tier2 "$red"
	set @batt_color_charge_primary_tier3 "$mustard"
	set @batt_color_charge_primary_tier4 "$yellow"
	set @batt_color_charge_primary_tier5 "$lime"
	set @batt_color_charge_primary_tier6 "$emerald"
	set @batt_color_charge_primary_tier7 "$green"
	set @batt_color_charge_primary_tier8 "$forest"
	set @batt_color_status_primary_charged "$forest"
	set @batt_color_status_primary_charging "$forest"
	set @batt_color_status_primary_discharging "$forest"
	set @batt_color_status_primary_attached "$forest"
	set @batt_color_status_primary_unknown "$forest"

	# prefix_highlight
	set @prefix_highlight_empty_prompt "  TMUX "
	set @prefix_highlight_prefix_prompt " WAIT"
	set @prefix_highlight_copy_prompt " COPY"
	set @prefix_highlight_sync_prompt " SYNC"
	set @prefix_highlight_show_copy_mode 'on'
	set @prefix_highlight_show_sync_mode 'on'
	set @prefix_highlight_fg "$bg,bold"
	set @prefix_highlight_bg "$orange"
	set @prefix_highlight_empty_attr "fg=$bg,bg=$blue,bold"
	set @prefix_highlight_copy_mode_attr "fg=$bg,bg=$mint,bold"
	set @prefix_highlight_sync_mode_attr "fg=$bg,bg=$peach,bold"

	#online-status
	set @online_icon " "
	set @offline_icon "#[bg=default,fg=$maroon] "

	readonly online_status_info="#[bg=default]#{online_status}"
	readonly prefix_highlight="#{prefix_highlight}#[fg=$bar,bg=$green]█#[fg=$fg,bg=$bg2]"
	readonly battery_info="#{battery_color_bg} #{battery_icon} #{battery_color_fg}#[bg=$bg2] #{battery_percentage} "
	readonly cpu_pct_not_100p="#{?#{m/r:^[0-9]#{a:37},#{cpu_percentage}}, #{cpu_percentage},#{cpu_percentage}}"
	readonly cpu_pct_justified="#{?#{==:#{cpu_percentage},100#{a:37}},#{cpu_percentage},$cpu_pct_not_100p}"
	readonly cpu_info="#[bg=$bg,fg=$fg]#{cpu_bg_color}#[fg=$bg] #{cpu_icon} #{cpu_fg_color}#[bg=$bg2] $cpu_pct_justified"
	readonly session_info="#[fg=$forest,bg=$bg2] #[fg=$fg,bg=$bg2]#S"
	readonly show_window_in_window_status="#[fg=$bg,bg=$sapphire]  #W  "
	readonly show_window_in_window_status_current="#[fg=$bg,bg=$orange]  #W  "

	local status_left="$prefix_highlight $session_info $online_status_info"
	local status_right="$cpu_info $battery_info"
	local window_status_format=$show_window_in_window_status
	local window_status_current_format=$show_window_in_window_status_current

	set status-left "${status_left}"
	set status-right "${status_right}"
	setw window-status-format "${window_status_format}"
	setw window-status-current-format "${window_status_current_format}"
}

main "$@"
