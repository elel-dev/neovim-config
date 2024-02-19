-- Safely call require treesitter configs 
local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  print("treesitter require call failed inside treesitter.lua")
  return
end

configs.setup({
    --ensure_installed = { "typescript", "javascript", "python", "json", "css", "go", "html", "rust", "r" }, -- on low end computer, you need to install manullay
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },  
})
