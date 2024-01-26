return {
	--catppuccin config 
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
	enabled = false,
    priority = 1000,
    config = function()
    require('catppuccin').setup {
	  --catppuccin config 
      flavour = 'mocha',
      transparent_background = true,
      term_colors = false,
     }

      -- load the colorscheme here
      vim.cmd([[colorscheme catppuccin-mocha]])
    end,
}




