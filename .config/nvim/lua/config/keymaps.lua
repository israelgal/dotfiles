-- Definimos una variable local map
local map = vim.keymap.set
local opt = vim.opt

--Keymaps
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


opt.number = true
opt.mouse = 'a'
opt.numberwidth = 1
opt.clipboard = 'unnamed'
opt.encoding = 'utf-8'
opt.showmatch = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.relativenumber = true
opt.showmode = false


-- Cambia las opciones de write y cerrar
map("n", "<Leader>w", ':w<CR>')
map("n", "<Leader>q", ':q<CR>')

-- Cambia la navegación entre ventanas de nvim
map("n", "<Leader>h", "<C-w>h")
map("n", "<Leader>j", "<C-w>j")
map("n", "<Leader>k", "<C-w>k")
map("n", "<Leader>l", "<C-w>l")

-- yank to system clipboard
map({ "n", "v" }, "<Leader>y", [["+y]])
map("n", "<Leader>Y", [["+Y]])

map('i', 'jk', '<Esc>', {noremap = true, silent = true })
--map('i', 'jk', '<Nop>', {noremap = true, silent = true })

vim.cmd('filetype plugin on')

-- Para los documentos Latex 
map('n', '<Leader>lc', ':VimtexCompile<CR>')
map('n', '<Leader>ll', ':VimtexClean<CR>')

--Bufferline saltar entre buffer en orden 
map('n', '<Leader>bn', ':BufferLineCycleNext<CR>')
map('n', '<Leader>bp', ':BufferLineCyclePrev<CR>')

-- Oilnvim keymap
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Load Snippets settings 
map('n', '<Leader>L', '<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})<CR>')






