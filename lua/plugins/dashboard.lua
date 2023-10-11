local module = {};

function module.init(use)
    use {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        requires = {'nvim-tree/nvim-web-devicons'},
        config = { function()
            require('dashboard').setup {}
        end}
    }

end
return module
