local mark_ok, mark = pcall(require, "harpoon.mark")
if not mark_ok then
  print("harpoon mark package is missing")
  return
end

local ui_ok, ui = pcall(require, "harpoon.ui")
if not ui_ok then
  print("harpooon ui package is missing")
  return
end

-- keyamps
vim.keymap.set("n", "<leader>a", mark.add_file, {})
vim.keymap.set("n", "<leader>aa", ui.toggle_quick_menu, {})

vim.keymap.set("n", "<leader>hh", function() ui.nav_file(1) end, {})
vim.keymap.set("n", "<leader>jj", function() ui.nav_file(2) end, {})
vim.keymap.set("n", "<leader>kk", function() ui.nav_file(3) end, {})
vim.keymap.set("n", "<leader>ll", function() ui.nav_file(4) end, {})
