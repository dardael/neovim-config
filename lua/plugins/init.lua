return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'
    use "sindrets/diffview.nvim"
    use "folke/tokyonight.nvim"
    use 'Mofiqul/vscode.nvim'
    use({
        "aaronhallaert/advanced-git-search.nvim",
        requires = {
            {'nvim-telescope/telescope.nvim'}
        }
    })
    require('plugins.telescope').init(use)
    require('plugins.lsp').init(use)
    require('plugins.gitsigns').init(use)
    require('plugins.neoclip').init(use)
    require('plugins.dashboard').init(use)
    require('plugins.lualine').init(use)
    require('plugins.nvim-tree').init(use)
    require('plugins.advanced-git-search').init(use)
    require("telescope").load_extension("advanced_git_search")
 end)

