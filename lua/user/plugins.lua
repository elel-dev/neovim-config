local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print "Error on require 'packer'"
  return
end

-- Have packer use a popup window
packer.init {
  --  display = {
  --    open_fn = function()
  --      return require("packer.util").float { border = "rounded" }
  --    end,
  --  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Useful to have
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- Colorscheme
  use { "ellisonleao/gruvbox.nvim" } --gruvbox theme
  use "lunarvim/darkplus.nvim" --darkplus theme

  -- Completition
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer cmp source
  use "hrsh7th/cmp-path" -- path cmp source
  use "hrsh7th/cmp-cmdline" -- cmdline cmp source
  use "saadparwaiz1/cmp_luasnip" -- snippet cmp source
  use "hrsh7th/cmp-nvim-lsp" -- lsp cmp source
  use "hrsh7th/cmp-nvim-lua" -- nvim lua api cmp source

  -- Snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters (NB: binaries required to be installed)

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate all" -- sometimes this fucks a little up, try to remove it if problems
  }

  -- Telescope
  use "nvim-telescope/telescope.nvim" -- telescope fuzzy finder
  use 'nvim-telescope/telescope-media-files.nvim' -- image preview in telescope

  -- Commenting
  use "numToStr/Comment.nvim" -- toggle comment on code blocks
  use "JoosepAlviste/nvim-ts-context-commentstring" -- requires treesitter

  -- Git
  use "lewis6991/gitsigns.nvim"
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  --NvimTree
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
