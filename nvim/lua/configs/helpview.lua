local present, helpview = pcall(require, "helpview")

if not present then
  return
end

helpview.setup {}
