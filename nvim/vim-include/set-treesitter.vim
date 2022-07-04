lua << END
require('nvim-treesitter.configs').setup {
  highlight = {
    enalbe = true,
    disable = {""},
    additional_vim_highlighting = true
  }
}
END