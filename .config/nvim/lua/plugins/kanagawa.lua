return {
	'shaunsingh/nord.nvim',
    name = 'nord',
    lazy = false,
	enabled = false,
    priority = 1000,
    config = function()
	  vim.g.nord_disable_background = true
      vim.cmd([[colorscheme nord]])
    end,
}




