lua << END
require('lualine').setup {
 options = {
    theme = 'tokyonight'
  }
}
require('nvim-web-devicons').setup{
  default = true;
}
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "" },  -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
  },
}
END

