
-- global color scheme rules
vim.api.nvim_exec(
    [[
    highlight clear CursorLine
    highlight clear CursorLineNr
    hi Keyword gui=bold
    hi Function gui=bold

    " apply changes if colorscheme is changed on the fly
    augroup MyColors
    autocmd!
    autocmd ColorScheme * highlight clear CursorLine
                      \ | highlight clear CursorLineNr
                      \ | hi Keyword gui=bold
                     " \ | hi Function gui=bold
    augroup END

]],
    false
)


return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight-moon]])
		end,
	},
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- require("nordic").load()
		end,
	},
}
