-- Install lazy if not found
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

-- Default configuration and table of plugins
require("lazy").setup({
  -- Telescope
  { "nvim-telescope/telescope.nvim", tag = "0.1.5", dependencies = { "nvim-lua/plenary.nvim" } },
  
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
    },
  },

  -- CMP
  {
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
      'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
      'L3MON4D3/LuaSnip', -- Snippets plugin
    },
  },
  
  -- GIT
  -- Neogit
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true
  },
  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim"
  },
  
  -- Neotree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },

  },
  
  -- MISC
  -- Comment
  {
      'numToStr/Comment.nvim',
      lazy = false,
  },
  -- Tailwind class sorter
  {
      'laytan/tailwind-sorter.nvim',
      dependencies = {'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim'},
      build = 'cd formatter && npm i && npm run build',
  },
  -- Harpoon
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2", -- TODO: monitor this
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" }
  },
  -- Trouble
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
  }
})
