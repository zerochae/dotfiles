local new_cmd = vim.api.nvim_create_user_command
local misspell_config_path = "$DEV_CONFIG/misspell/.misspellignore"

new_cmd("MisspellAdd", function(opts)
  local word = opts.args
  require("custom.configs.null-ls.utils").add_ignore_word(misspell_config_path, word)
end, { nargs = "?" })

new_cmd("MisspellRemove", function(opts)
  local word = opts.args
  require("custom.configs.null-ls.utils").remove_ignore_word(misspell_config_path, word)
end, { nargs = "?" })

new_cmd("MisspellShow", function()
  require("custom.configs.null-ls.utils").show_ignore_list(misspell_config_path)
end, {})

new_cmd("Q", ":q", {})
new_cmd("W", ":w", {})
new_cmd("Wq", ":wq", {})
