return {
	"kiyoon/jupynium.nvim",
    build = "pip3 install --user .",
    config = function()
	require("jupynium").setup({
	default_notebook_URL = "localhost:8888/nbclassic",
	jupyter_command = "jupyter",
		})
	vim.g.python3_host_prog = '~/data_science/.venv/bin/python3'
	end,
}
