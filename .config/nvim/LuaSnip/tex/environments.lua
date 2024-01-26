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
s({trig="eq", snippetType="autosnippet", dscr="A LaTeX equation environment"},
	fmta(
		[[
			\begin{equation}
				<>
			\end{equation}
			<>
		]],
		{ 
			i(1),
			i(0),
		}
		),
		{condition = line_begin}
),
s( {trig = '([^%a])mm', snippetType = "autosnippet", wordTrig = false, regTrig = true, dscr = 'inline math environment'},
	fmta(
		"<>$<>$", 
		{
			f( function(_, snip) return snip.captures[1] end ),
			d(1, get_visual),
		}
	),
	{ condition = in_text }
),
s({trig="hr", dscr="The hyperref package's href{}{} command (for url links)"},
  fmta(
    [[\href{<>}{<>}]],
    {
      i(1, "url"),
      i(2, "display name"),
    }
  )
),
s({trig="new", snippetType = 'autosnippet', dscr="A generic new environmennt"},
	fmta(
	[[
		\begin{<>}
			<>
		\end{<>}
    ]],
    {
		i(1),
		i(2),
		rep(1),
    }
	),
	{condition = line_begin}
),
s({trig="it", snippetType = 'autosnippet', dscr="Itemize environment"},
	fmta(
	[[
		\begin{itemize}
			\item <>
		\end{itemize}
    ]],
    {
		i(1),
    }
	),
	{condition = line_begin}
),
s({trig="lf(", snippetType = "autosnippet", dscr= ' () envinronment'},
	fmta(
	"\\left ( <> \\right )",
    {
		i(1),
    }
	),
		{condition = in_mathzone}
),
s({trig="sp", snippetType = "autosnippet", dscr='split environment'},
	fmta(
	[[
		\begin{split}
			<>
		\end{split}
    ]],
    {
		i(1),
    }
	),
		{condition = in_equation}
),
s({trig="ml", snippetType = "autosnippet", dscr='multiline environment'},
	fmta(
	[[
		\begin{multiline}
			<>
		\end{multiline}
    ]],
    {
		i(1),
    }
	),
		{condition = line_begin }
),
s({trig="lg", snippetType = "autosnippet", dscr='align environment'},
	fmta(
	[[
		\begin{align}
			<>
		\end{align}
    ]],
    {
		i(1),
    }
	),
		{condition = line_begin }
),
s({trig="gt", snippetType = "autosnippet", dscr='gather environment'},
	fmta(
	[[
		\begin{gather}
			<>
		\end{gather}
    ]],
    {
		i(1),
    }
	),
		{condition = line_begin }
),
}

