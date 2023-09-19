local file = {
  ts = {
    icon = "󰛦",
    name = "Typescript",
    color = "#0088d1",
  },
  js = {
    icon = "",
    name = "Javascript",
    color = "#ffca27",
  },
  cjs = {
    icon = "",
    name = "Javascript",
    color = "#ffca27",
  },
  mjs = {
    icon = "",
    name = "Javascript",
    color = "#ffca27",
  },
  sh = {
    icon = "",
    name = "Sh",
    color = "#ff7043",
  },
  zsh = {
    icon = "",
    name = "Zsh",
    color = "#89e051",
  },
  bash = {
    icon = "",
    name = "Bash",
    color = "#768495",
  },
  fish = {
    icon = "",
    name = "Fish",
    color = "#40a0d5",
  },
  rs = {
    icon = "",
    name = "Rust",
    color = "#FA6F42",
  },
  toml = {
    icon = "",
    name = "Toml",
    color = "#42a5f5",
  },
  yml = {
    icon = "󰈚",
    name = "yaml",
    color = "#FA6F42",
  },
  [".gitignore"] = {
    icon = "",
    name = "Gitignore",
    color = "#e64a19",
  },
  [".yarnrc.yml"] = {
    icon = "",
    name = "DotYarnrc",
    color = "#0088d1",
  },
  ["yarn.lock"] = {
    icon = "",
    name = "Yarnlock",
    color = "#2c8ebb",
  },
  [".dockerignore"] = {
    icon = "",
    name = "Dockerignore",
    color = "#2496ed",
  },
  dockerfile = {
    icon = "",
    name = "DockerfileScript",
    color = "#2496ed",
  },
  [".eslintcache"] = {
    icon = "󰱺",
    name = "Eslintcache",
    color = "#4050b5",
  },
  [".eslintrc.json"] = {
    icon = "󰱺",
    name = "Eslintcache",
    color = "#4050b5",
  },
  [".prettierrc"] = {
    icon = "",
    name = "Prettierrc",
    color = "#56b3b4",
  },
  [".prettierignore"] = {
    icon = "",
    name = "Prettierignore",
    color = "#56b3b4",
  },
  ["package.json"] = {
    icon = "",
    name = "PackageJson",
    color = "#8bc34b",
  },
  ["package-lock.json"] = {
    icon = "",
    name = "PackageLockJson",
    color = "#8bc34b",
  },
  [".luarc.json"] = {
    icon = "",
    name = "Luarc",
    color = "#4e4eeb",
  },
  ["lazy-lock.json"] = {
    icon = "󰒲",
    name = "Lazylock",
    color = "#82aaff",
  },
  license = {
    icon = "󰿃",
    name = "License",
    color = "#ff5722",
  },
  ["README.md"] = {
    icon = "",
    name = "Readmedotmd",
    color = "#42a5f5",
  },
  ["nuxt.config.js"] = {
    icon = "",
    name = "NuxtConfig",
    color = "#41b883",
  },
  Gemfile = {
    icon = "",
    name = "Gemfile",
    color = "#CC342D",
  },
}
local folder = {
  e2e = {
    icon = "󱥾",
    name = "EndToEndTestFolder",
    color = "#27a69a",
  },
  git = {
    icon = "",
    name = "gitFolder",
    color = "#546e7a",
  },
  [".git"] = {
    icon = "",
    name = "DotgitFolder",
    color = "#546e7a",
  },
  [".github"] = {
    icon = "",
    name = "DotgithubFolder",
    color = "#546e7a",
  },
  [".yarn"] = {
    icon = "",
    name = "YarnFolder",
    color = "#2c8ebb",
  },
  [".vscode"] = {
    icon = "",
    name = "DotvscodeFolder",
    color = "#42a5f5",
  },
  [".husky"] = {
    icon = "󰩃",
    name = "DotHuskyFolder",
    color = "#607d8b",
  },
  ["node_modules"] = {
    icon = "",
    name = "NodeModules",
    color = "#8bc34b",
  },
  db = {
    icon = "",
    name = "Db",
    color = "#61afee",
  },
}

local M = {}

for key, value in pairs(folder) do
  M[key] = value
end

for key, value in pairs(file) do
  M[key] = value
end

return M
