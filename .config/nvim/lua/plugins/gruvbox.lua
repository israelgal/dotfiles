return {
	"ellisonleao/gruvbox.nvim",
    name = 'gruvbox',
    lazy = false,
	enabled = false,
    priority = 1000,
    config = function()
	require('gruvbox').setup({
	trasnparent_mode = false,
	contrast = "hard",
	})
      vim.cmd([[colorscheme gruvbox]])
    end,
}




