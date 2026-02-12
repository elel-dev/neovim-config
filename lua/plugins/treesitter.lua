return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", "css", "typescript" },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    },
  },
}
