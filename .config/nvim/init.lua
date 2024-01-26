require("config")
require('luasnip.loaders.from_lua').load({paths = '~/.config/nvim/LuaSnip/'})

vim.api.nvim_command('command! IsMathZone lua print(vim.fn["vimtex#syntax#in_mathzone"]())')


vim.api.nvim_create_user_command("Ft", function ()
	print(vim.fn.expand('%:e'))
end, {})
