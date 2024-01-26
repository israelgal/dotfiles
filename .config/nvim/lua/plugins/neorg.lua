
return {
	'nvim-neorg/neorg',
    name = 'neorg',
	build = ':Neorg sync-parsers',
	dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
	require('neorg').setup({
		load = {
			["core.defaults"] = {},
			["core.concealer"] = {},
			["core.dirman"] = {
				config = {
					workspaces = {
							notes = "~/notes",
					},
				},
			},
		},
	})
    end,
}
