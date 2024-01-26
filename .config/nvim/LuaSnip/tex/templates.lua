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

-- Templates created for diferent types de documents 

return {
s( {trig = 'nd', snippetType='autosnippet', dscr='A new document template'},
		fmta(
			[[
				\documentclass{article}
				\usepackage[utf8]{inputenc}
				\usepackage{graphicx} % Required for inserting images
				\usepackage{physics}
				\usepackage{amsmath}
				%\usepackage{geometry}
				\usepackage{setspace}
				\usepackage{anysize} 
				\marginsize{3cm}{3cm}{2cm}{2cm}

				\title{<>}
				\author{<>}
				\date{\today}

				\begin{document}

				\maketitle

				\section{<>}
				<>



				\end{document}
			]],
			{
				i(1, "Title"),
				i(2, "Israel Galindo"),
				i(3, "Introduction"),
				i(4)
			}
		)

),

s( {trig = 'snd', snippetType='autosnippet', dscr='A new document template'},
		fmta(
			[[
				\documentclass{article}
				\usepackage[utf8]{inputenc}
				\usepackage[spanish]{babel}
				\usepackage{graphicx} % Required for inserting images
				\usepackage{physics}
				\usepackage{amsmath}
				\usepackage{subcaption}
				%\usepackage{geometry}
				\usepackage{setspace}
				\usepackage{anysize} 
				\marginsize{3cm}{3cm}{2cm}{2cm}

				\spanishdecimal{.}

				\title{<>}
				\author{<>}
				\date{\today}

				\begin{document}

				\maketitle

				\section{<>}
				<>



				\end{document}
			]],
			{
				i(1, "Title"),
				i(2, "Israel Galindo"),
				i(3, "Introduction"),
				i(4)
			}
		)

),
s( {trig = 'fg', snippetType='autosnippet', dscr='A figure snippet '},
		fmta(
			[[
			\begin{figure}[htb!]
			\centering
			\includegraphics[width = \linewidth]{<>}
			\caption{<>}
			\label{fig:<>}
			\end{figure}
			]],
			{
				i(1, "filename"),
				i(2, "caption"),
				i(3, "fig:enter-label"),
			}
		),
		{condition = line_begin}
),
}
