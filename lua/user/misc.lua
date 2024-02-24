-- Safely call neo tree command from vim
local status_ok_t, tailwindsorter = pcall(require, "tailwind-sorter")
if not status_ok_t then
  print("tailwind-sorter require call failed inside misc.lua")
  return
end

tailwindsorter.setup({
  on_save_enabled = true, -- If `true`, automatically enables on save sorting.
  on_save_pattern = { '*.html', '*.js', '*.jsx', '*.tsx' }, -- The file patterns to watch and sort.
  node_path = 'node',
})
