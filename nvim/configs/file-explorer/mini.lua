local present_files, mini_files = pcall(require, "mini.files")

if not present_files then
  return
end

mini_files.setup()

local present_misc, mini_misc = pcall(require, "mini.misc")

if not present_misc then
  return
end

mini_misc.setup()
