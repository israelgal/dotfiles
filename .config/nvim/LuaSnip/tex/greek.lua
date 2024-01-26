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
s(
	{trig = "al", snippetType="autosnippet", dscr = 'alpha'},
	{
		t("\\alpha"),
	},
	{ condition = in_mathzone}
),
s(
	{trig = "be", snippetType="autosnippet", dscr = 'beta'},
	{
		t("\\beta"),
	},
	{ condition = in_mathzone}
),
s(
	{trig = "ga", snippetType="autosnippet", dscr = 'gamma'},
	{
		t("\\gamma"),
	},
	{ condition = in_mathzone}
),
s(
	{trig = "om", snippetType="autosnippet", dscr = 'omega'},
	{
		t("\\omega"),
	},
	{ condition = in_mathzone}
),
s({trig = 'mu', snippetType="autosnippet", dscr = 'mu'},
	{ t("\\mu")   },
	{condition = in_mathzone}
),
s({trig = 'ep', snippetType="autosnippet", dscr = 'epsilon'},
	{ t("\\epsilon")   },
	{condition = in_mathzone}
),
s({trig = 'kp', snippetType="autosnippet", dscr = 'kappa'},
	{ t("\\kappa")   },
	{condition = in_mathzone}
),
s({trig = 'ps', snippetType="autosnippet", dscr = 'psi'},
	{ t("\\psi")   },
	{condition = in_mathzone}
),
s({trig = 'ph', snippetType="autosnippet", dscr = 'phi'},
	{ t("\\phi")   },
	{condition = in_mathzone}
),
s({trig = 'lm', snippetType="autosnippet", dscr = 'lambda'},
	{ t("\\lambda")   },
	{condition = in_mathzone}
),
s({trig = 'rh', snippetType="autosnippet", dscr = 'rho'},
	{ t("\\rho")   },
	{condition = in_mathzone}
),
s({trig = 'sg', snippetType="autosnippet", dscr = 'sigma'},
	{ t("\\sigma")   },
	{condition = in_mathzone}
),
s({trig = 'pi', snippetType="autosnippet", dscr = 'pi'},
	{ t("\\pi")   },
	{condition = in_mathzone}
),
s({trig = 'te', snippetType="autosnippet", dscr = 'theta'},
	{ t("\\theta")   },
	{condition = in_mathzone}
),
}

