local present, neodev = pcall(require, "neodev")

if not present then
  return
end

neodev.setup {}
