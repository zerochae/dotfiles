local function find_up(names, start)
  return vim.fs.find(names, { upward = true, path = start })[1]
end

return {
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
      exit_codes = { 0, 1 },

      condition = function(ctx)
        return find_up({ ".pnp.cjs" }, ctx.dirname) ~= nil
      end,
    },

    prettier = {
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
        return find_up({ ".pnp.cjs" }, ctx.dirname) ~= nil
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
        local root = find_up({ "package.json", "yarn.lock", ".git" }, ctx.dirname)
        return root and vim.fs.dirname(root) or ctx.dirname
      end,
    },
  },

  -- 파일타입별 체인: eslint → prettier
  formatters_by_ft = {
    javascript = { "eslint_yarn_pnp", "prettier" },
    javascriptreact = { "eslint_yarn_pnp", "prettier" },
    typescript = { "eslint_yarn_pnp", "prettier" },
    typescriptreact = { "eslint_yarn_pnp", "prettier" },
    vue = { "eslint_yarn_pnp", "prettier" },

    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    less = { "prettier" },

    lua = { "stylua" },
    toml = { "taplo" },
    sh = { "shfmt" },
    sql = { "sql_formatter" },

    java = { "google-java-format" },
  },
}
