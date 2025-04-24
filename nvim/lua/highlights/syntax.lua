local colors = require "ui.assets.colors"

return {

  override = {
    ["@constant"] = { fg = colors.orange },
    ["@variable"] = { fg = colors.white },
    ["@property"] = { fg = colors.peach },
    ["@parameter"] = { fg = colors.orange },
    ["@operator"] = { fg = colors.cyan },
    ["@punctuation.bracket"] = { fg = colors.orange },
    ["@function.builtin"] = { fg = colors.cyan },
    ["@punctuation.delimiter"] = { fg = colors.cyan },
    Conditional = { fg = colors.plum },
    Repeat = { fg = colors.tangerine },
    -- LspInlayHint = { link = "Comment" },
  },

  add = {
    ["@namespace.builtin"] = { fg = colors.yellow },

    -- lua
    LuaDocumentTag = { fg = colors.plum },
    LuaDocumentParam = { fg = colors.orange },
    LuaGlobalVim = { fg = colors.mustard },
    ["@variable.member.lua"] = { fg = colors.red, link = "" },

    -- tsx, vue, javascript, typescript
    ["@type.qualifier.tsx"] = { fg = colors.magenta, link = "" },
    ["@type.qualifier.vue"] = { fg = colors.magenta, link = "" },
    ["@type.qualifier.typescript"] = { fg = colors.magenta, link = "" },
    ["@type.qualifier.javascript"] = { fg = colors.magenta, link = "" },

    ["@parameter.tsx"] = { fg = colors.orange, link = "" },
    ["@parameter.vue"] = { fg = colors.orange, link = "" },
    ["@parameter.javascript"] = { fg = colors.orange, link = "" },
    ["@parameter.typescript"] = { fg = colors.orange, link = "" },

    ["@variable.parameter.tsx"] = { fg = colors.orange, link = "" },
    ["@variable.parameter.vue"] = { fg = colors.orange, link = "" },
    ["@variable.parameter.javascript"] = { fg = colors.orange, link = "" },
    ["@variable.parameter.typescript"] = { fg = colors.orange, link = "" },
    ["@variable.parameter.lua"] = { fg = colors.orange, link = "" },
    ["@variable.parameter.java"] = { fg = colors.orange, link = "" },

    ["@property.tsx"] = { fg = colors.peach },
    ["@property.vue"] = { fg = colors.peach },
    ["@property.javascript"] = { fg = colors.peach },
    ["@property.typescript"] = { fg = colors.peach },
    ["@property.html"] = { fg = colors.peach },

    ["@tag.tsx"] = { fg = colors.red },
    ["@tag.vue"] = { fg = colors.red },
    ["@tag.javascript"] = { fg = colors.red },
    ["@tag.typescript"] = { fg = colors.red },
    ["@tag.html"] = { fg = colors.red },

    ["@tag.builtin.tsx"] = { fg = colors.red },
    ["@tag.builtin.javascript"] = { fg = colors.red },

    ["@constructor.tsx"] = { fg = colors.red, link = "" },
    ["@constructor.vue"] = { fg = colors.red, link = "" },
    ["@constructor.javascript"] = { fg = colors.red, link = "" },
    ["@constructor.typescript"] = { fg = colors.red, link = "" },

    ["@operator.tsx"] = { fg = colors.cyan },
    ["@operator.vue"] = { fg = colors.cyan },
    ["@operator.javascript"] = { fg = colors.cyan },
    ["@operator.typescript"] = { fg = colors.cyan },
    ["@operator.html"] = { fg = colors.cyan },

    ["@punctuation.special.tsx"] = { fg = colors.magenta },
    ["@punctuation.special.vue"] = { fg = colors.magenta },
    ["@punctuation.special.javascript"] = { fg = colors.magenta },
    ["@punctuation.special.typescript"] = { fg = colors.magenta },

    ["@tag.attribute.tsx"] = { fg = colors.orange },
    ["@tag.attribute.vue"] = { fg = colors.orange },
    ["@tag.attribute.javascript"] = { fg = colors.orange },
    ["@tag.attribute.typescript"] = { fg = colors.orange },
    ["@tag.attribute.html"] = { fg = colors.orange },

    ["@tag.delimiter.tsx"] = { fg = colors.cyan },
    ["@tag.delimiter.vue"] = { fg = colors.cyan },
    ["@tag.delimiter.javascript"] = { fg = colors.cyan },
    ["@tag.delimiter.typescript"] = { fg = colors.cyan },
    ["@tag.delimiter.html"] = { fg = colors.cyan },

    ["@punctuation.delimiter.tsx"] = { fg = colors.cyan },
    ["@punctuation.delimiter.vue"] = { fg = colors.cyan },
    ["@punctuation.delimiter.javascript"] = { fg = colors.cyan },
    ["@punctuation.delimiter.typescript"] = { fg = colors.cyan },
    ["@punctuation.delimiter.html"] = { fg = colors.cyan },

    ["@punctuation.bracket.tsx"] = { fg = colors.cyan },
    ["@punctuation.bracket.vue"] = { fg = colors.cyan },
    ["@punctuation.bracket.javascript"] = { fg = colors.cyan },
    ["@punctuation.bracket.typescript"] = { fg = colors.cyan },
    ["@punctuation.bracket.lua"] = { fg = colors.cyan },
    ["@punctuation.bracket.java"] = { fg = colors.cyan },

    ["@text.uri.tsx"] = { fg = colors.none },
    ["@text.uri.vue"] = { fg = colors.none },
    ["@text.uri.javascript"] = { fg = colors.none },
    ["@text.uri.typescript"] = { fg = colors.none },
    ["@text.uri.html"] = { fg = colors.none },
    ["@variable.member.typescript"] = { fg = colors.red, link = "" },
    ["@variable.member.javascript"] = { fg = colors.red, link = "" },
    ["@variable.member.tsx"] = { fg = colors.red, link = "" },

    -- rust
    ["@variable.rust"] = { fg = colors.red },
    ["@function.macro.rust"] = { fg = colors.blue },
    ["@namespace.rust"] = { fg = colors.orange },
    ["@variable.member.rust"] = { fg = colors.red, link = "" },
    ["@module.rust"] = { fg = colors.magenta },
    ["@punctuation.bracket.rust"] = { fg = colors.cyan },

    -- java
    ["@include.java"] = { fg = colors.magenta },
    ["@type.qualifier.java"] = { fg = colors.magenta },
    ["@repeat.java"] = { fg = colors.magenta },
    ["@attribute.java"] = { fg = colors.orange },
    ["@variable.member.java"] = { fg = colors.red, link = "" },

    -- html
    htmlTag = { fg = colors.cyan },
    htmlEndTag = { fg = colors.cyan },
    htmlArg = { fg = colors.orange, link = "" },

    -- css
    ["@variable.css"] = { fg = colors.red },

    -- bash
    ["@constant.bash"] = { fg = colors.red },

    --gitcommit
    ["@spell.gitcommit"] = { fg = colors.blue },
    ["@text.gitcommit"] = { fg = colors.cyan },
  },
}
