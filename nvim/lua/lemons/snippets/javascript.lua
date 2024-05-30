require("luasnip.session.snippet_collection").clear_snippets("javascript")

local ls = require "luasnip"
local s = ls.s
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("cl", fmt("console.log({});", { i(1) }))
}