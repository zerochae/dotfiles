lua << END
require('lualine').setup {
    options = { 
        theme = 'tokyonight',
        component_separators = '',
    },
    sections = { 
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {},
        lualine_x = {'fileformat'},
        lualine_y = {'progress'},
        lualine_z = {'filetype'}
    },
    tabline = {
        lualine_a = {'buffers'},
        lualine_b = {''},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'tabs'}
    }
}
END

