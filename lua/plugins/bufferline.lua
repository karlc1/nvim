return {
	"akinsho/bufferline.nvim",
	version = "*",
	-- lazy = false,
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{
			"echasnovski/mini.bufremove",
			version = "*",
			config = function()
				require("mini.bufremove").setup({ silent = true })
			end,
		},
	},
	keys = {
		{ "L", "<cmd>BufferLineCycleNext<cr>", mode = { "n" }, desc = "Next buffer" },
		{ "H", "<cmd>BufferLineCyclePrev<cr>", mode = { "n" }, desc = "Previous buffer" },
		{ "Q", "<cmd>lua MiniBufremove.delete()<cr>", mode = { "n" }, desc = "Delete buffer" },
	},
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				separator_style = "slope",

				always_show_bufferline = false,
				buffer_close_icon = "",
				close_icon = " ",
				style_preset = bufferline.style_preset.no_italic,
				offsets = { { filetype = "neo-tree", text = "", text_align = "center" } },
			},
		})
	end,
}
