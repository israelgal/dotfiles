return {
    'nvim-lualine/lualine.nvim',
    dependencies = {'kyazdani42/nvim-web-devicons'},
    config = function ()
    require('lualine').setup {
      options = {
	icons_enabled = true,
	theme = 'rose-pine',
	globalstatus = true,
      },
      sections = {
	lualine_a = { {'filename', path = 1, symbols = { modified = '*'} } },
	lualine_b = {},
	--lualine_b = {{'buffers', icons_enabled = false, show_filename_only = true, hide_filename_extension = true, mode = 2}},
	lualine_c = {},
	lualine_x = {'encoding', {'filetype', icon_only = true}},
	lualine_y = {},
	lualine_z = {'location'}
      },
	inactive_winbar = {
		lualine_c = {'filename'},
			},
    }
    end,
}

