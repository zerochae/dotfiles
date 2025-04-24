local present, helpview = pcall(require, "helpview")

if not present then
  return
end

-- local colors = require "ui.assets.colors"

helpview.setup {}
