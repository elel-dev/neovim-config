-- Quickly set the right variable name
-- local colorscheme = "gruvbox"
local colorscheme = "tokyonight"

-- Safely call colorscheme command from vim
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  print("colorscheme " .. colorscheme .. " not found!")
  print("going with default colorscheme")
  vim.cmd "colorscheme default"
  return
end

