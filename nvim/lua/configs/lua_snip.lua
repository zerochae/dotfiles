local present, luasnip = pcall(require, "luasnip")

if not present then
  return
end

-- some shorthands...
local snip = luasnip.snippet
local text = luasnip.text_node
local insert = luasnip.insert_node
local extras = require "luasnip.extras"
local rep = extras.rep
-- local node = ls.snippet_node
-- local func = ls.function_node
-- local choice = ls.choice_node
-- local dynamicn = ls.dynamic_node

luasnip.add_snippets(nil, {
  all = {
    snip({
      trig = "td",
      namr = "Todo",
      dscr = "Add Todo Comment",
    }, {
      text { "TODO:" },
    }),
  },
})

luasnip.add_snippets(nil, {
  vue = {
    snip({
      trig = "cl",
      namr = "Class",
      dscr = "Add Class Property",
    }, {
      text { "class" },
    }),
  },
})

luasnip.add_snippets("typescriptreact", {
  -- react use state
  snip("rus", {
    text "const [ ",
    insert(1),
    text "  , set",
    insert(2),
    text "",
    rep(1),
    text " ] = useState<",
    insert(3),
    text ">(",
    insert(4),
    text ")",
  }),
  -- react use effect
  snip("ruf", {
    text "useEffect(() => {",
    insert(1),
    text "}}),[",
    insert(2),
    text "])",
  }),

  -- react functional components
  snip("rfc", {
    text "const ",
    insert(1),
    text " = (",
    insert(2),
    text ") => {",
    insert(3),
    text "return()})export default ",
    rep(1),
  }),
})
