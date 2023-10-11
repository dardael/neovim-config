local module = {};

function module.init(use)
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    require('lualine').setup()
end
return module
