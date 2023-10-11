local module = {};

function module.init(use)
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = {
            {'nvim-lua/plenary.nvim'},
            { "nvim-telescope/telescope-live-grep-args.nvim" },
        },
        config = function()
            require("telescope").load_extension("live_grep_args")
        end
    }

    require('telescope').setup{
        defaults = {
            mappings = {
                i = {
                    ["<C-h>"] = "which_key"
                }
            }
        },
        pickers = {},
        extensions = {
            extensions = {
                advanced_git_search = {
                }
            }
        }
    }
end
return module
