vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.number = true
vim.o.background = 'dark'

require('plugins')
require('keymap')
vim.cmd[[colorscheme vscode]]
vim.opt.clipboard="unnamedplus"
require("CopilotChat").setup {
  debug = true, -- Enable debugging
  sticky = {
    '#files',
    '#buffers',
    '#buffers:2',
    '#git',

  }
  -- See Configuration section for rest
}
