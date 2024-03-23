local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local term = require("harpoon.term")


vim.keymap.set("n", "<leader>ha", mark.add_file, {desc = "Harpoon: Add file"})
vim.keymap.set("n", "<leader>ht", ui.toggle_quick_menu, {desc = "Harpoon: Toggle Menu"})
vim.keymap.set("n", "<leader>h1", function() ui.nav_file(1) end, {desc = "Harpoon: Navigate to 1st marked file"})
vim.keymap.set("n", "<leader>h2", function() ui.nav_file(2) end, {desc = "Harpoon: Navigate to 2nd marked file"})
vim.keymap.set("n", "<leader>h3", function() ui.nav_file(3) end, {desc = "Harpoon: Navigate to 3rd marked file"})
vim.keymap.set("n", "<leader>h4", function() ui.nav_file(4) end, {desc = "Harpoon: Navigate to 4th marked file"})
