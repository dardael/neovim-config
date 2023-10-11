local module = {};

function module.init(use)
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
        
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }
    local lsp_zero = require('lsp-zero')

    lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
    end)

    require('mason').setup({})
    require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
            lsp_zero.default_setup,
        },
    })
    local cmp = require('cmp')
    local cmp_action = lsp_zero.cmp_action()
    cmp.setup({
        mapping = cmp.mapping.preset.insert({
            ['<CR>'] = cmp.mapping.confirm({select = false}),
            ['<Tab>'] = cmp_action.tab_complete(),
            ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),  
            ['<C-Space>'] = cmp.mapping.complete(),
        }),
        preselect = 'item',
        completion = {
            completeopt = 'menu,menuone,noinsert',
        },
    })
 
end
return module
