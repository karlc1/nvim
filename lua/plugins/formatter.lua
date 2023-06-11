
-- formatters: https://github.com/mhartington/formatter.nvim/tree/master/lua/formatter/filetypes

return {
	"mhartington/formatter.nvim",
	keys = {
		{"<Leader>f", "<cmd>FormatWrite<cr>", mode = "n", desc = "Format buffer"},
	},
	cmd = {"Format", "FormatWrite"},
	config = function()
		local util = require("formatter.util")

		require("formatter").setup({
			logging = false,
			log_level = vim.log.levels.INFO,
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
