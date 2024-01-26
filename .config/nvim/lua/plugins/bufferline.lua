return {
	-- bufferlien config
	'akinsho/bufferline.nvim',
	name = 'bufferline',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
	require('bufferline').setup{
	}
	vim.opt.termguicolors = true
	end,
}






