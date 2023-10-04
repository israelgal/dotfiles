-- Definimos una variable local map
local map = vim.keymap.set
local opt = vim.opt


--Keymaps 
vim.g.mapleader = ' '

opt.number = true 
opt.mouse = 'a'
opt.numberwidth = 1
opt.clipboard = 'unnamed'
opt.encoding = 'utf-8'
opt.showmatch = true 
opt.shiftwidth = 2
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

vim.cmd('filetype plugin on')

