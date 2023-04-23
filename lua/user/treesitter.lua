local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  print("nvim-treesitter or ts_context_commentstring packages are missing")
  return
end

local ft_to_parser = vim.treesitter.language.register("html","ejs")

configs.setup {
  ensure_installed = { "typescript", "javascript", "python", "json", "css", "go", "html", "rust", "r" }, -- on low end computer, you need to install manullay
  sync_install = false,
  ignore_install = { "all" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  -- requires ts_context_commentstring
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  indent = { enable = true, disable = { "yaml" } },
}
