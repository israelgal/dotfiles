return{
	'lervag/vimtex',
	name = 'vimtex',
	lazy = false,
	config = function()
		vim.cmd('filetype plugin on')
		vim.cmd('syntax enable')
		vim.g['vimtex_view_method'] = 'zathura'
		vim.g['vimtex_quickfix_ode'] = 0
		vim.o.conceallevel = 1

		-- Disable autoindentation for LaTeX files
		vim.cmd('autocmd FileType tex setlocal noautoindent')
	end,
}


