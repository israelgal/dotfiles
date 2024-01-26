---@diagnostic disable

-- get visual function 
local helpers = require('luasnip-helper-funcs')
local get_visual = helpers.get_visual

-- tex utilities 
local in_mathzone = helpers.in_mathzone
local in_text = helpers.in_text
local in_comment = helpers.in_comment
local in_equation = helpers.in_equation
local in_itemize = helpers.in_itemize
local in_tikz = helpers.in_tikz

-- line_begin condition 
local line_begin = require('luasnip.extras.expand_conditions').line_begin


return {
s({trig = 'ii', snippetType="autosnippet", dscr = 'Itemize command'},
  fmta(
    "\\item <>",
    {
	  i(1)
    }
  ),
   {condition = in_itemize}
),
s({trig = 'lb', snippetType="autosnippet", dscr = 'label command'},
  fmta(
    "\\label{<>}",
    {
	  i(1)
    }
  ),
   {condition = in_mathzone }
),
s({trig = 'rf', snippetType="autosnippet", dscr = 'ref command'},
  fmta(
    "(\\ref{<>})",
    {
	  i(1)
    }
  ),
   {condition = in_text }
),
}
