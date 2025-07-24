-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>t", ":Neotree toggle<CR>", { noremap = true, silent = true, desc = "Toggle Neo-tree" })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>aa", ":AvanteChat<CR>", { noremap = true, silent = true, desc = "Execute AvanteChat" })
vim.keymap.set("n", "<leader>g", ":Neogit<CR>", { noremap = true, silent = true, desc = "Execute Neogit" })
