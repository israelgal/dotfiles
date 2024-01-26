-- ~/.config/nvim/lua/config/plugins/luasnip-helper-funcs.lua
local M = {}

-- LuaSnip node abbreviations 
local ls = require('luasnip')
local sn = ls.snippet_node
local i = ls.insert_node

function M.get_visual(args, parent)
	if (#parent.snippet.env.LS_SELECT_RAW >0) then
		return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
	else
		return sn(nil, i(1, ''))
	end
end

-- Add tex_utils functions

local tex_utils = {}

function M.in_mathzone()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

function M.in_text()
	return not M.in_mathzone()
end

function M.in_comment()
	return vim.fn['vimtex#syntax#in_comment']() == 1
end

function M.in_env(name)
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end

function M.in_equation()
	return M.in_env('equation')
end

function M.in_itemize()
	return M.in_env('itemize')
end

function M.in_tikz()
	return M.in_env('tikzpicture')
end

return M
