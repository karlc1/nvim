return {
	"mhartington/formatter.nvim",
	keys = {
		{ "<Leader> ", "<cmd>FormatWrite<cr>", mode = { "n" }, desc = "Format" },
	},

	lazy = false,

	config = function()
		require("formatter").setup({
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				terraform = {
					require("formatter.filetypes.terraform").terraformfmt,
				},
				yaml = {
					require("formatter.filetypes.yaml").prettier,
				},
				json = {
					require("formatter.filetypes.json").prettier,
				},
				sh = {
					require("formatter.filetypes.sh").shfmt,
				},
				zsh = {
					require("formatter.filetypes.sh").shfmt,
				},
                python = {
                    require("formatter.filetypes.python").black,
                },
			},
		})
	end,
}
