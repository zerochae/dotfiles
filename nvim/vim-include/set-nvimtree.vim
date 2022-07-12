lua << END
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

function tree_toggle_on_setup()
    require'nvim-tree'.toggle(false,true)
end
vim.fn.timer_start(1, tree_toggle_on_setup)

vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_respect_buf_cwd = 1
vim.g.nvim_tree_root_folder_modifier = ':t:r'

vim.api.nvim_create_autocmd('BufEnter', {
    command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
    nested = true,
})
END

nnoremap <C-t> :NvimTreeToggle<CR>
nnoremap <leader>n :NvimTreeFocus<CR>
