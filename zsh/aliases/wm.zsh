startwm() {
    yabai --start-service
    skhd --start-service
    open -n /Applications/Übersicht.app
}

stopwm() {
    yabai --stop-service
    skhd --stop-service
}
