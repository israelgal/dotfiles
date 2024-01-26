return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'VeryLazy',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed  = {
	'lua',
	'luadoc',
	'python',
	'vim',
	'bash',
	'bibtex',
	'vimdoc',
	'yaml',
      },
      highlight = {
	enable = true,
	disable = {},
      },
      indent = {
	enable = true,
      },
    },
}
