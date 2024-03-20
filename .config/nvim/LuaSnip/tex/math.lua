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
s({trig = '([^%a])ee', snippetType="autosnippet", regTrig = true, wordTrig = false, dscr = 'Eulers number raised to a power'},
  fmta(
    "<>e^{<>}",
    {
      f( function(_, snip) return snip.captures[1] end ),
      d(1, get_visual)
    }
  ),
   {condition = in_mathzone}
),
s( { trig = '([%a%)%]%}])oo', regTrig = true, wordTrig = false, snippetType = 'autosnippet'},
	fmta(
		"<>_{<>}",
		{
			f( function(_, snip) return snip.captures[1] end ),
			i(1)
		}
	),
	{condition = in_mathzone}
),
s( { trig = '([%a%)%]%}])oi', regTrig = true, wordTrig = false, snippetType = 'autosnippet'},
	fmta(
		"<>^{<>}",
		{
			f( function(_, snip) return snip.captures[1] end ),
			i(1)
		}
	),
	{condition = in_mathzone}
),
s({trig = "df", snippetType = "autosnippet", dscr = 'differential operator'},
  { t("\\diff") },
  { condition = in_mathzone}
),
s(
	{trig = "im", snippetType="autosnippet", dscr = 'imaginary unit'},
	{
		t("\\mathbf{i}"),
	},
	{ condition = in_mathzone}
),
s({trig = 'eq', snippetType="autosnippet", dscr = 'Equal symbol ='},
	{ t(" = ")   },
	{condition = in_mathzone}
),
s({trig = 'cr', snippetType="autosnippet", dscr = 'Curl operation '},
	{ t("\\nabla \\times ")   },
	{condition = in_mathzone}
),
s({trig = 'div', snippetType="autosnippet", dscr = 'Divergency operation'},
	{ t("\\nabla \\cdot ")   },
	{condition = in_mathzone}
),
s({trig = 'na', snippetType="autosnippet", dscr = 'Nabla'},
	{ t("\\nabla")   },
	{condition = in_mathzone}
),
s({trig = 'vc', snippetType="autosnippet", dscr = 'Mathemathic vector'},
	fmta("\\vec{<>}",
		{ i(1) }
		),
	{condition = in_mathzone}
),
s({trig = 'mvc', snippetType="autosnippet", dscr = 'Mathemathic vector'},
	fmta("\\mathbf{<>}",
		{ i(1) }
		),
	{condition = in_mathzone}
),
s({trig = "ff", snippetType = "autosnippet", dscr = 'fraction environment'},
  fmta(
    "\\frac{<>}{<>}",
    {
      i(1),
      i(2),
    }
  ),
  {condition = in_mathzone}  
),
s({trig = "cs", snippetType = "autosnippet", dscr = 'cos function'},
  { t("\\cos")   },
  {condition = in_mathzone}  
),
s({trig = "sn", snippetType = "autosnippet", dscr = 'sin function'},
  { t("\\sin")   },
  {condition = in_mathzone}  
),
s({trig = "tn", snippetType = "autosnippet", dscr = 'tan function'},
  { t("\\tan")   },
  {condition = in_mathzone}  
),
s({trig = "ch", snippetType = "autosnippet", dscr = 'cosh function'},
  { t("\\cosh")   },
  {condition = in_mathzone}  
),
s({trig = "sh", snippetType = "autosnippet", dscr = 'sinh function'},
  { t("\\sinh")   },
  {condition = in_mathzone}  
),
s({trig = "ht", snippetType = "autosnippet", dscr = 'tanh function'},
  { t("\\tanh")   },
  {condition = in_mathzone}  
),
s({trig = "sq", snippetType = "autosnippet", dscr = 'squareroot environment'},
  fmta(
    "\\sqrt{<>}",
    {
      i(1),
    }
  ),
  {condition = in_mathzone}  
),
s({trig = "tm", snippetType = "autosnippet", dscr = 'x symbol'},
  { t("\\times")   },
  {condition = in_mathzone}  
),
s({trig = "cd", snippetType = "autosnippet", dscr = '. cdot'},
  { t("\\cdot")   },
  {condition = in_mathzone}  
),
s({trig = "ev", snippetType = "autosnippet", dscr = 'equiv symbol'},
  { t("\\equiv")   },
  {condition = in_mathzone}  
),
s({trig = "pr", snippetType = "autosnippet", dscr = 'partial symbol'},
  { t("\\partial")   },
  {condition = in_mathzone}  
),
s({trig = "ex", snippetType = "autosnippet", dscr = 'exp form'},
  fmta(
    "\\text{exp} ( <> )", 
    {
      i(1),
    }
  ),
  {condition = in_mathzone}  
),
s({trig = "pl", snippetType = "autosnippet", dscr = '+ symbol'},
  { t("+")   },
  {condition = in_mathzone}  
),
s({trig = "din", snippetType = "autosnippet", dscr = 'Definite int'},
  fmta(
			"\\int_{ <> }^{ <> } <> ", 
    {
      i(1, "a"),
	  i(2, "b"),
	  i(3),
    }
  ),
  {condition = in_mathzone}  
),
s({trig = "lg", snippetType = "autosnippet", dscr = 'log symbol'},
  { t("\\text{log}") },
  {condition = in_mathzone}  
),
s({trig = "int", snippetType = "autosnippet", dscr = 'indefinite integral'},
  { t("\\int") },
  {condition = in_mathzone}  
),
s({trig = "infty", snippetType = "autosnippet", dscr = 'Infinity symbol'},
  { t("\\infty") },
  {condition = in_mathzone}  
),
}
