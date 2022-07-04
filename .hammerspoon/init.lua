local inputEnglish = "com.apple.keylayout.ABC"
local esc_bind

function convert_to_eng_with_esc()
  local inputSource = hs.keycodes.currentSourceID()
  if not (inputSource == inputEnglish) then
    hs.enenttap.keyStroke({},'right')
    hs.keycodes.currentSourceID(inputEnglish)
  end
  esc_bind:disable()
  hs.enenttap.keyStroke({},'escape')
  esc_bind:enable()
end

esc_bind = hs.hotkey.new({},'escape',convert_to_eng_with_esc):enable()
