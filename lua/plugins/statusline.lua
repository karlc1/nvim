local ExtractHl = function(hl)
	local nice = vim.api.nvim_get_hl_by_name(hl, true)
	return ("#%06x"):format(nice.foreground or 0)
end

return {
	"tamton-aquib/staline.nvim",
	event = "VeryLazy",
	config = function()
		-- vim.cmd([[
		-- 	    set laststatus=0
		-- hi! link StatusLine Normal
		-- hi! link StatusLineNC Normal
		-- set statusline=%{repeat('─',winwidth('.'))}
		-- ]])
		require("staline").setup({

			sections = {
				left = {
					" ",
					"right_sep_double",
					"-mode",
					"left_sep_double",
					" ",
					"right_sep",
					"-file_name",
					"left_sep",
					" ",
					"right_sep_double",
					"-branch",
					"left_sep_double",
					" ",
				},
				mid = { "lsp" },
				right = {
					"right_sep",
					"-cool_symbol",
					"left_sep",
					" ",
					"right_sep",
					"-cwd",
					"left_sep",
					" ",
					"right_sep",
					"- ",
					"-lsp_name",
					"- ",
					"left_sep",
					"right_sep_double",
					"-line_column",
					"left_sep_double",
					" ",
				},
			},

			defaults = {
				-- fg = "#986fec",
				fg = "#222436",
				cool_symbol = "  ",
				left_separator = "",
				right_separator = "",
				-- line_column = "%l:%c [%L]",
				true_colors = true,
				line_column = "[%l:%c] %p%% ",
				-- font_active = "bold"
			},
			mode_icons = {
				n = "󰋜 ",
				i = " ",
				c = " ",
				v = "◉ ", -- etc..
			},
			-- mode_colors = {
			-- 	n = "#2bbb4f",
			-- 	i = "#181a23",
			-- 	ic = "#181a23",
			-- 	c = "#181a23",
			-- 	v = "#181a23", -- etc
			-- },

			-- mode_colors = {
			-- 	n = ExtractHl("Normal"),
			-- 	i = ExtractHl("Blue"),
			-- 	ic = ExtractHl("Green"),
			-- 	c = ExtractHl("Purple"),
			-- 	v = ExtractHl("Yellow"),
			-- 	["�"] = ExtractHl("Yellow"),
			-- 	V = ExtractHl("Orange"),
			-- 	t = ExtractHl("Red"),
			-- },
		})
	end,
}
