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
s({trig = 'ef', snippetType="autosnippet", dscr = 'Electric field vector'},
	{ t("\\vec{E}")   },
	{condition = in_mathzone}
),
s({trig = 'mf', snippetType="autosnippet", dscr = 'Magnetic field vector'},
	{ t("\\vec{H}")   },
	{condition = in_mathzone}
),
s({trig = 'un', snippetType="autosnippet", dscr = 'Unitary vector'},
	fmta("\\hat{<>}",
		{ i(1) }
		),
	{condition = in_mathzone}
),
s({trig = 'hb', snippetType="autosnippet", dscr = 'hbar'},
	{ t("\\hbar")   },
	{condition = in_mathzone}
),
s({trig = 'ell', snippetType="autosnippet", dscr = 'ell command'},
	{ t("\\ell")   },
	{condition = in_mathzone}
),
}
