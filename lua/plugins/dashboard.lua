local header = {
	"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
	"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
	"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
	"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
	"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
	"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
}

local function join_strings(string_list)
	local ret = ""
	for i, v in ipairs(string_list) do
		ret = ret .. "\n" .. v
	end
	return ret
end

return {
	"echasnovski/mini.starter",
	version = "*",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		-- disable a bunch of visual settings for starter buffer
		vim.cmd(
			[[ autocmd FileType starter setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell nolist nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs=  | autocmd WinLeave <buffer> set showtabline=2 ]]
		)

		local starter = require("mini.starter")
		starter.setup({
			evaluate_single = false,
			items = {
				{ name = "Find files", action = "Telescope find_files", section = "Actions" },
				{ name = "Live grep", action = "Telescope live_grep", section = "Actions" },
				{
					name = "Edit neovim config",
					action = ":cd ~/.config/nvim | :e init.lua | :Telescope find_files",
					section = "Actions",
				},
				starter.sections.recent_files(8, true),
				starter.sections.recent_files(8, false),
			},
			-- header = join_strings(header),
			header = function()
				local logo = join_strings(header)
				logo = logo .. "\n\n" .. vim.fn.getcwd()
				return logo
			end,
			footer = "",
		})
	end,
}
