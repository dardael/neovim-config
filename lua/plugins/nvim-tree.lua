local module = {};

function module.init(use)
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    require("nvim-tree").setup()
end
return module
