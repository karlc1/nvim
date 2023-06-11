return {
	{
		"nmac427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	},
	{
		"terrortylor/nvim-comment",
		keys = {
			{"<Leader>c", "<cmd>CommentToggle<cr>", mode = {"n"}, desc = "Toggle comment"},
			{"<Leader>c", ":'<,'>CommentToggle<cr>", mode = {"v"}, desc = "Toggle comment"},
		},
		config = function()
			require("nvim_comment").setup({
				comment_empty = false,
				create_mappings = false,
			})
		end,
	},
}
