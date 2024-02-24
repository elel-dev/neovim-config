-- Safely import needed packages
local status_ok, telescope_builtin = pcall(require, "telescope.builtin")
if not status_ok then
  print("Require call for telescope.builtin failed in file keymaps.lua")
  return
end


-- Options
local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NORMAL --
-- Buffer management
keymap("n", "<leader>w", ":w<cr>", opts)
keymap("n", "<leader>Q", ":wq<cr>", opts)
keymap("n", "<leader>qq", ":q!<cr>", opts)
keymap("n", "<leader>c", ":q<cr>", opts)

-- Format
keymap("n", "<leader>p", ":lua vim.lsp.buf.format {async = true} <cr>", opts)

-- Git
keymap("n", "<leader>G", ":Neogit<cr>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<leader>h", "<C-w>h", opts)
keymap("n", "<leader>j", "<C-w>j", opts)
keymap("n", "<leader>k", "<C-w>k", opts)
keymap("n", "<leader>l", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- File Explorer
--keymap("n", "<leader>s", ":Lex 25<cr>", opts)
keymap("n", "<leader>s", ":Neotree reveal toggle<cr>", opts)

-- Telescope
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {})


-- VISUAL --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)
