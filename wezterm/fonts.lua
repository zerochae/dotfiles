----------------- en font -----------------
-- { family = "IBM Plex Mono", weight = "Medium" },
-- { family = "Departure Mono", weight = "Medium" },
-- { family = "HBIOS-SYS", weight = "Medium" },
-- { family = "Maple Mono", weight = "Medium" },
-- { family = "Monaspace Neon Var", weight = "DemiBold" },
-- { family = "Monaspace Radon Var", weight = "DemiBold" },
-- { family = "0xProto", weight = "Thin" },
-- { family = "FiraCode Nerd Font Mono", weight = "Medium" },
-- { family = "CaskaydiaCove Nerd Font Mono", weight = "Medium" },
-- { family = "Iosevka", weight = "Medium" }, -- very slow!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- { family = "JetBrainsMono Nerd Font", weight = "Medium" },
-- { family = "SpaceMono Nerd Font Mono", weight = "Medium" },
--
----------------- symbol font -----------------
-- { family = "Symbols Nerd Font", weight = "Medium" },

----------------- ko font -----------------
-- { family = "GalmuriMono9", weight = "Medium" },
-- { family = "DOSGothic", weight = "DemiBold" },
-- { family = "Monoplex KR Nerd", weight = "Medium" },
-- { family = "배달의민족 한나체 Air", weight = "DemiBold" },
-- { family = "Neo둥근모 Code", weight = "Medium" },
-- { family = "Apple SD 산돌고딕 Neo", weight = "Medium" },
-- { family = "AppleMyungjo", weight = "DemiBold" },
-- { family = "D2CodingLigature Nerd Font", weight = "Medium" },
--
----------------- not use -----------------
-- { family = "Monaspace Xenon Var", weight = "Medium" },
-- { family = "Monaspace Krypton Var", weight = "DemiBold" },
-- { family = "GoMono Nerd Font", weight = "Medium" },
-- { family = "GohuFont 14 Nerd Font Mono", weight = "Medium" },
-- { family = "LiterationMono Nerd Font", weight = "Medium" },
-- { family = "ZedMono Nerd Font", weight = "Medium" },
-- { family = "Hack Nerd Font", weight = "Medium" },
-- { family = "SF Mono", weight = "Medium" },
-- { family = "Source Code Pro", weight = "Medium" },
-- { family = "ProFontWindows Nerd Font", weight = "Medium" },
-- { family = "MesloLGS NF", weight = "Medium" },
-- { family = "Mononoki Nerd Font", weight = "Medium" },
-- { family = "ShureTechMono Nerd Font", weight = "Medium" },

local zeroXProto = {
  { family = "0xProto", weight = "Medium" },
  { family = "JetBrainsMono Nerd Font", weight = "Medium" },
  { family = "SpaceMono Nerd Font Mono", weight = "Medium" },
  { family = "Symbols Nerd Font", weight = "Medium" },
  { family = "Apple SD 산돌고딕 Neo", weight = "Medium" },
}

local goMono = {
  { family = "GoMono Nerd Font", weight = "Medium" },
  { family = "SpaceMono Nerd Font Mono", weight = "Medium" },
  { family = "Symbols Nerd Font", weight = "Medium" },
  { family = "AppleMyungjo", weight = "DemiBold" },
}

local jetBrainsMono = {
  -- { family = "GoMono Nerd Font", weight = "Medium" },
  { family = "JetBrainsMono Nerd Font", weight = "Medium" },
  { family = "SpaceMono Nerd Font Mono", weight = "Medium" },
  { family = "Symbols Nerd Font", weight = "Medium" },
  { family = "Monoplex KR Nerd", weight = "Medium" },
}

local departureMono = {
  { family = "Departure Mono", weight = "Medium" },
  { family = "JetBrainsMono Nerd Font", weight = "Medium" },
  { family = "SpaceMono Nerd Font Mono", weight = "Medium" },
  -- { family = "Symbols Nerd Font", weight = "Medium" },
  { family = "GalmuriMono9", weight = "Light" },
}

local monaspace = {
  { family = "Monaspace Neon Var", weight = "DemiBold" },
  { family = "Monaspace Xenon Var", weight = "Medium" },
  -- { family = "Monaspace Krypton Var", weight = "DemiBold" },
  { family = "JetBrainsMono Nerd Font", weight = "Medium" },
  { family = "SpaceMono Nerd Font Mono", weight = "Medium" },
  { family = "Symbols Nerd Font", weight = "Medium" },
  { family = "Monoplex KR Nerd", weight = "Medium" },
}

local spaceMono = {
  { family = "SpaceMono Nerd Font Mono", weight = "DemiBold" },
  { family = "JetBrainsMono Nerd Font", weight = "Medium" },
  { family = "Monoplex KR Nerd", weight = "DemiBold" },
}

local fonts = {
  goMono = goMono,
  jetBrainsMono = jetBrainsMono,
  zeroXProto = zeroXProto,
  departureMono = departureMono,
  monaspace = monaspace,
  spaceMono = spaceMono,
}

return fonts.spaceMono
