local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {

  -- rebelot/kanagawa 
  'rebelot/kanagawa.nvim',

  -- catppuccin theme 
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- nvim-tree
  'nvim-tree/nvim-tree.lua',

  -- web icons 
  'nvim-tree/nvim-web-devicons',

  -- nvim-lualine 
  'nvim-lualine/lualine.nvim',

  -- nvim-treesitter 
  'nvim-treesitter/nvim-treesitter', 

  -- vimtex 
  'lervag/vimtex',

  -- hop nvim 
  'phaazon/hop.nvim',

  -- Vimwiki
  'vimwiki/vimwiki',

}

local opts = {}

require("lazy").setup(plugins, opts)
