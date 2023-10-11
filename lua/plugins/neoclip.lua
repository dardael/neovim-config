local module = {};

function module.init(use)
    use {
        "AckslD/nvim-neoclip.lua",
        requires = {
            {'nvim-telescope/telescope.nvim'}
        },
    }

    require('neoclip').setup()
    require('telescope').load_extension('neoclip')
end
return module
