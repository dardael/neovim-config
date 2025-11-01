-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
map("n", "<leader>t", ":Neotree toggle<CR>", { noremap = true, silent = true, desc = "Toggle Neo-tree" })
map("n", "<leader>fg", function() require("telescope.builtin").live_grep({ hidden = true }) end, { noremap = true, silent = true })
map("n", "<leader>ff", require("telescope.builtin").find_files, { noremap = true, silent = true })
map("n", "<leader>f.", function() require("telescope.builtin").find_files({ hidden = true }) end, { desc = "Find files including dotfiles", silent = true })
map("n", "<leader>aa", ":AvanteChat<CR>", { noremap = true, silent = true, desc = "Execute AvanteChat" })
map("n", "<leader>g", ":Neogit<CR>", { noremap = true, silent = true, desc = "Execute Neogit" })

local function live_grep_visual()
  vim.cmd([[normal! "zy]])
  local text = vim.fn.getreg("z")
  require("telescope.builtin").live_grep({ default_text = text, hidden = true })
end
map("v", "<leader>fg", live_grep_visual, { desc = "Telescope live_grep sur sélection", silent = true })

