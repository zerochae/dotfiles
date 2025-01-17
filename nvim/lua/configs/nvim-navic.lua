local present, navic = pcall(require, "nvim-navic")

if not present then
  return
end

navic.setup {
  icons = {
    File = "󰈙 ",
    Module = " ",
    Namespace = "󰌗 ",
    Package = " ",
    Class = " ",
    Method = "󰆧 ",
    Property = "󰜢 ",
    Field = " ",
    Constructor = " ",
    Color = "󰏘 ",
    Enum = " ",
    Interface = " ",
    Function = "󰆧 ",
    Variable = " ",
    Constant = "󰏿 ",
    String = "󰉿 ",
    Number = "󰎠 ",
    boolean = "◩ ",
    Array = "󰅪 ",
    Object = "󰅩 ",
    Key = "󰌋 ",
    Null = "󰟢 ",
    EnumMember = " ",
    Struct = " ",
    Event = " ",
    Operator = "󰆕 ",
    TypeParameter = "󰊄 ",
  },
  highlight = true,
  lsp = { auto_attach = true },
}
