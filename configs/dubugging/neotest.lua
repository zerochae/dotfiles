local present, neotest = pcall(require, "neotest")

if not present then
  return
end

local neotest_jest = require "neotest-jest"

-- neotest.setup {
--   adapters = {
--     neotest_jest {
--       jestCommand = "jest --watch",
--       jestConfigFile = "jest.config.js",
--       env = { CI = true },
--       cwd = function()
--         return vim.fn.getcwd()
--       end,
--     },
--   },
-- }

-- mono repo
neotest.setup {
  adapters = {
    neotest_jest {
      jestCommand = "jest --watch",
      jestConfigFile = function()
        local file = vim.fn.expand "%:p"
        if string.find(file, "/packages/") then
          return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
        end

        return vim.fn.getcwd() .. "/jest.config.js"
      end,
      env = { CI = true },
      cwd = function()
        local file = vim.fn.expand "%:p"
        if string.find(file, "/packages/") then
          return string.match(file, "(.-/[^/]+/)src")
        end
        return vim.fn.getcwd()
      end,
    },
  },
}
