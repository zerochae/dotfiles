local present, luasnip = pcall(require, "luasnip")

if not present then
  return
end

-- some shorthands...
local snip = luasnip.snippet
-- local node = ls.snippet_node
local text = luasnip.text_node
-- local insert = ls.insert_node
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
