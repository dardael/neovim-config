-- his file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use "williamboman/mason.nvim"
    use "sindrets/diffview.nvim"
    use 'wbthomason/packer.nvim'
    use "folke/tokyonight.nvim"
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
          'nvim-tree/nvim-web-devicons', -- optional
        },
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'}, { "nvim-telescope/telescope-live-grep-args.nvim" }, },
        config = function()
            require("telescope").load_extension("live_grep_args")
        end
    }
    use {
      'glepnir/dashboard-nvim',
      event = 'VimEnter',
      config = function()
        require('dashboard').setup {
          -- config
        }
      end,
      requires = {'nvim-tree/nvim-web-devicons'}
    }
    use {'lewis6991/gitsigns.nvim'}
    use {
      "AckslD/nvim-neoclip.lua",
      requires = {
        -- you'll need at least one of these
         {'nvim-telescope/telescope.nvim'}
        -- {'ibhagwan/fzf-lua'},
      },
      config = function()
          require('neoclip').setup()
      end
    }
     use({
        "aaronhallaert/advanced-git-search.nvim",
        requires = {
        -- you'll need at least one of these
         {'nvim-telescope/telescope.nvim'}
        -- {'ibhagwan/fzf-lua'},
      }
    })
    require('gitsigns').setup{
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
              opts = opts or {}
              opts.buffer = bufnr
              vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map('n', ']c', function()
              if vim.wo.diff then return ']c' end
              vim.schedule(function() gs.next_hunk() end)
              return '<Ignore>'
            end, {expr=true})

            map('n', '[c', function()
              if vim.wo.diff then return '[c' end
              vim.schedule(function() gs.prev_hunk() end)
              return '<Ignore>'
            end, {expr=true})

            -- Actions
            map('n', '<leader>gs', gs.stage_hunk)
            map('n', '<leader>gr', gs.reset_hunk)
            map('v', '<leader>gs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
            map('v', '<leader>gr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
            map('n', '<leader>gS', gs.stage_buffer)
            map('n', '<leader>gu', gs.undo_stage_hunk)
            map('n', '<leader>gR', gs.reset_buffer)
            map('n', '<leader>gp', gs.preview_hunk)
            map('n', '<leader>gb', function() gs.blame_line{full=true} end)
            map('n', '<leader>gtb', gs.toggle_current_line_blame)
            map('n', '<leader>gd', gs.diffthis)
            map('n', '<leader>gD', function() gs.diffthis('~') end)
            map('n', '<leader>gtd', gs.toggle_deleted)

            -- Text object
            map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
    }
    -- require('nvim-web-devicons').setup()
    require("nvim-tree").setup()
    require("mason").setup()
    require('telescope').setup{
        defaults = {
            -- Default configuration for telescope goes here:
            -- config_key = value,
            mappings = {
                i = {
                    -- map actions.which_key to <C-h> (default: <C-/>)
                    -- actions.which_key shows the mappings for your picker,
                    -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                        ["<C-h>"] = "which_key"
                    }
                }
            },
            pickers = {
            -- Default configuration for builtin pickers goes here:
            -- picker_name = {
            --   picker_config_key = value,
            --   ...
            -- }
            -- Now the picker_config_key will be applied every time you call this
            -- builtin picker
            },
            extensions = {
            -- Your extension configuration goes here:
                    extensions = {
                        advanced_git_search = {
                        -- Insert Config here
                    }
                }
            -- please take a look at the readme of the extension you want to configure
            }
    }
    require('telescope').load_extension('neoclip')
    require("telescope").load_extension("advanced_git_search")
    require('neoclip').setup()
 end)
