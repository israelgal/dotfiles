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
s( {trig = 'tk', snippetType='autosnippet', dscr='A tikzpicture document'},
		fmta(
			[[
			\documentclass{article}
			\usepackage{tikz}
			\begin{document}
			\begin{tikzpicture}

			\draw[step = .5, gray!75] (-2,-2) grid (4,2.5);
			\draw (-2,-2) rectangle (4,2.5);
			<>

			\end{tikzpicture}
			\end{document}		
			]],
			{
				i(1),
			}
		),
		{condition = line_begin}
),
}
