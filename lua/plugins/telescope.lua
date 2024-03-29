return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.1",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>ff", require("telescope.builtin").find_files, desc = "Find files" },
		{ "<leader>fg", require("telescope.builtin").live_grep, desc = "Live grep" },
		{ "<leader>fw", require("telescope.builtin").grep_string, desc = "Grep word under cursor" },
		{ "<leader>fr", require("telescope.builtin").resume, desc = "Resume previous search" },
	},
	config = function()
		require("telescope").setup({

			color_devicons = true,
			pickers = {
				find_files = {
					theme = "dropdown",
					previewer = false,
					layout_config = {
						height = 0.5,
					},
				},
				lsp_document_symbols = {
					theme = "dropdown",
					previewer = false,
					layout_config = {
						height = 0.5,
						width = 60,
					},
					symbol_width = 45,
					symbol_type_width = 100,
				},
			},
		})
		vim.cmd([[
			" "highlight TelescopeSelection      guibg=bg gui=bold
        	highlight! link TelescopeResultsStruct structure
            highlight! link TelescopeResultsMethod string
		]])
	end,
}
