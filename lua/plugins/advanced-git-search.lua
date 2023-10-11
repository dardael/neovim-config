local module = {};

function module.init(use)
    use({
        "aaronhallaert/advanced-git-search.nvim",
        requires = {
            {'nvim-telescope/telescope.nvim'}
        }
    })

    require("telescope").load_extension("advanced_git_search")
end
return module
