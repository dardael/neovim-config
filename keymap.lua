require('telescope').load_extension('neoclip')
require("telescope").load_extension("advanced_git_search")
require('neoclip').setup()

vim.g.mapleader = ","
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local builtin = require('telescope.builtin')

keymap('n', '<leader>ff', builtin.find_files, opts)
keymap('n', '<leader>fg', builtin.live_grep, opts)
keymap('n', '<leader>fb', builtin.buffers, opts)
keymap('n', '<leader>fh', builtin.help_tags, opts)

function vim.getVisualSelection()
    vim.cmd('noau normal! "vy"')
    local text = vim.fn.getreg('v')
    vim.fn.setreg('v', {})

    text = string.gsub(text, "\n", "")
    if #text > 0 then
        return text
    else
        return ''
    end
end


keymap('v', '<leader>ff', function()
    local text = vim.getVisualSelection()
    builtin.find_files({ default_text = text })
end, opts)

keymap('v', '<leader>fg', function()
    local text = vim.getVisualSelection()
    builtin.live_grep({ default_text = text })
end, opts)

keymap('n', '<leader>fs', require("telescope").extensions.live_grep_args.live_grep_args, opts)

keymap('n', '<leader>pp', require("telescope").extensions.neoclip.neoclip, opts)

keymap('n', '<leader>gh', '<cmd>AdvancedGitSearch<CR>', opts)

keymap("v", "<C-j>", ":move '>+1<CR>gv=gv", opts)
keymap("v", "<C-k>", ":move '<-2<CR>gv=gv", opts)
keymap("n", "<C-j>", ":move .+1<CR>==", opts)
keymap("n", "<C-k>", ":move .-2<CR>==", opts)
