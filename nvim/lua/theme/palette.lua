---@class PaletteSurface
---@field bg string main background
---@field bg2 string elevated surface (floats, popups)
---@field bg3 string highest elevation
---@field bg_tab_off string inactive tab background
---@field code_block string code block background

---@class PaletteUI
---@field mode_fg string statusline mode foreground
---@field border string general border
---@field float_border string floating window border
---@field comment string comment text

---@class PaletteBase
---@field red string
---@field orange string
---@field tangerine string red-orange accent
---@field yellow string
---@field green string
---@field cyan string
---@field blue string
---@field magenta string
---@field white string foreground text
---@field black string dark foreground

---@class PaletteBright
---@field peach string bright red
---@field lime string bright green
---@field lemon string bright yellow
---@field sky string bright blue
---@field fuchsia string bright magenta
---@field aqua string bright cyan
---@field ivory string bright white
---@field charcoal string bright black (gray)

---@class PalettePastel
---@field coral string pastel red
---@field emerald string pastel green
---@field sunshine string pastel yellow
---@field sapphire string pastel blue
---@field lavender string pastel magenta
---@field mint string pastel cyan
---@field pearl string pastel white
---@field obsidian string pastel black (dim gray)

---@class PaletteDark
---@field maroon string dark red
---@field forest string dark green
---@field mustard string dark yellow
---@field navy string dark blue
---@field plum string dark magenta
---@field teal string dark cyan
---@field gray string dark white
---@field onyx string darkest black
---@field grape string dark accent

---@class Palette: PaletteSurface, PaletteUI, PaletteBase, PaletteBright, PalettePastel, PaletteDark
---@field none string transparent

---@type Palette
local _type_check = nil

return _type_check
