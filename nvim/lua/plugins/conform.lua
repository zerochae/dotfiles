local function find_up(names, start)
  return vim.fs.find(names, { upward = true, path = start })[1]
end

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    notify_on_error = true,

    formatters = {
      eslint_yarn_pnp = {
        command = "yarn",
        args = { "-s", "eslint", "--fix", "--format", "json", "$FILENAME" },
        stdin = false,
        tempfile = function(ctx)
          local ext = (ctx.filename or ""):match "^.+(%..+)$" or ".js"
          return vim.fn.tempname() .. ext
        end,
        cwd = function(ctx)
          local root = find_up({ ".git" }, ctx.dirname)
          return root and vim.fs.dirname(root) or ctx.dirname
        end,
        env = function(ctx)
          local pnp = find_up({ ".pnp.cjs" }, ctx.dirname)
          if pnp then
            return { NODE_OPTIONS = "--require=" .. pnp }
          end
          return {}
        end,
        exit_codes = { 0, 1 },

        condition = function(ctx)
          local has_pnp = find_up({ ".pnp.cjs" }, ctx.dirname) ~= nil
          local has_biome = find_up({ "biome.json", "biome.jsonc" }, ctx.dirname) ~= nil
          return has_pnp and not has_biome
        end,
      },

      eslint = {
        command = function(ctx)
          local root = find_up({ ".git" }, ctx.dirname)
          if root then
            local eslint_bin = vim.fs.dirname(root) .. "/node_modules/.bin/eslint"
            if vim.fn.executable(eslint_bin) == 1 then
              return eslint_bin
            end
          end
          return "eslint"
        end,
        args = { "--fix", "--format", "json", "$FILENAME" },
        stdin = false,
        tempfile = function(ctx)
          local ext = (ctx.filename or ""):match "^.+(%..+)$" or ".js"
          return vim.fn.tempname() .. ext
        end,
        cwd = function(ctx)
          local root = find_up({ ".git" }, ctx.dirname)
          return root and vim.fs.dirname(root) or ctx.dirname
        end,
        exit_codes = { 0, 1 },
        condition = function(ctx)
          local has_pnp = find_up({ ".pnp.cjs" }, ctx.dirname) ~= nil
          local has_biome = find_up({ "biome.json", "biome.jsonc" }, ctx.dirname) ~= nil
          return not has_pnp and not has_biome
        end,
      },

      prettier_pnp = {
        command = (vim.fn.exepath "prettier" ~= "" and vim.fn.exepath "prettier") or "prettier",
        stdin = true,
        args = { "--stdin-filepath", "$FILENAME" },
        cwd = function(ctx)
          local root = find_up({ "package.json", "yarn.lock", ".git" }, ctx.dirname)
          return root and vim.fs.dirname(root) or ctx.dirname
        end,
        env = function(ctx)
          local pnp = find_up({ ".pnp.cjs" }, ctx.dirname)
          if pnp then
            return { NODE_OPTIONS = "--require=" .. pnp }
          end
          return {}
        end,
        condition = function(ctx)
          local has_pnp = find_up({ ".pnp.cjs" }, ctx.dirname) ~= nil
          local has_biome = find_up({ "biome.json", "biome.jsonc" }, ctx.dirname) ~= nil
          return has_pnp and not has_biome
        end,
      },

      prettier = {
        command = function(ctx)
          local root = find_up({ ".git" }, ctx.dirname)
          if root then
            local prettier_bin = vim.fs.dirname(root) .. "/node_modules/.bin/prettier"
            if vim.fn.executable(prettier_bin) == 1 then
              return prettier_bin
            end
          end
          return "prettier"
        end,
        stdin = true,
        args = { "--stdin-filepath", "$FILENAME" },
        cwd = function(ctx)
          local root = find_up({ ".git" }, ctx.dirname)
          return root and vim.fs.dirname(root) or ctx.dirname
        end,
        condition = function(ctx)
          local has_pnp = find_up({ ".pnp.cjs" }, ctx.dirname) ~= nil
          local has_biome = find_up({ "biome.json", "biome.jsonc" }, ctx.dirname) ~= nil
          return not has_pnp and not has_biome
        end,
      },

      sql_formatter = {
        command = "sql-formatter",
        stdin = true,
        args = {
          "--config",
          vim.fn.expand "$DEV/config/sqlformatter/.sqlformatter.json",
        },
        cwd = function(ctx)
          local root = find_up({ "yarn.lock", ".git" }, ctx.dirname)
          return root and vim.fs.dirname(root) or ctx.dirname
        end,
      },

      biome = {
        command = function(ctx)
          local root = find_up({ "biome.json", "biome.jsonc" }, ctx.dirname)
          if root then
            local biome_bin = vim.fs.dirname(root) .. "/node_modules/.bin/biome"
            if vim.fn.executable(biome_bin) == 1 then
              return biome_bin
            end
          end
          return "biome"
        end,
        stdin = true,
        args = { "check", "--write", "--stdin-file-path", "$FILENAME" },
        cwd = function(ctx)
          local root = find_up({ "biome.json", "biome.jsonc", ".git" }, ctx.dirname)
          return root and vim.fs.dirname(root) or ctx.dirname
        end,
        condition = function(ctx)
          return find_up({ "biome.json", "biome.jsonc" }, ctx.dirname) ~= nil
        end,
      },
    },

    formatters_by_ft = {
      javascript = { "biome", "eslint_yarn_pnp", "eslint", "prettier_pnp", "prettier" },
      javascriptreact = { "biome", "eslint_yarn_pnp", "eslint", "prettier_pnp", "prettier" },
      typescript = { "biome", "eslint_yarn_pnp", "eslint", "prettier_pnp", "prettier" },
      typescriptreact = { "biome", "eslint_yarn_pnp", "eslint", "prettier_pnp", "prettier" },
      vue = { "biome", "eslint_yarn_pnp", "eslint", "prettier_pnp", "prettier" },

      json = { "biome", "prettier_pnp", "prettier" },
      jsonc = { "biome", "prettier_pnp", "prettier" },
      yaml = { "biome", "prettier_pnp", "prettier" },
      markdown = { "prettier_pnp", "prettier" },
      html = { "prettier_pnp", "prettier" },
      css = { "biome", "prettier_pnp", "prettier" },
      scss = { "biome", "prettier_pnp", "prettier" },
      less = { "biome", "prettier_pnp", "prettier" },

      lua = { "stylua" },
      toml = { "taplo" },
      sh = { "shfmt" },
      sql = { "sql_formatter" },

      java = { "google-java-format" },
    },
  },
}
