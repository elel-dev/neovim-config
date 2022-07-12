local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  print("nvim-treesitter or ts_context_commentstring packages are missing")
  return
end

configs.setup {
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
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
