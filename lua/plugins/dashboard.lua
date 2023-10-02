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

		-- vim.cmd("autocmd User MiniStarterOpened setlocal laststatus=0")

		vim.cmd([[
		  augroup MiniStarterJK
			au!
			au User MiniStarterOpened nmap <buffer> <C-j> <Cmd>lua MiniStarter.update_current_item('next')<CR>
			au User MiniStarterOpened nmap <buffer> <C-k> <Cmd>lua MiniStarter.update_current_item('prev')<CR>
		  augroup END
		]])

		local starter = require("mini.starter")
		starter.setup({
			evaluate_single = false,
			items = {
				{ name = "Find files", action = "Telescope find_files", section = "Actions" },
				{ name = "Live grep", action = "Telescope live_grep", section = "Actions" },
				{
					name = "Neovim config",
					action = ":cd ~/.config/nvim | :e init.lua | :Telescope find_files",
					section = "Actions",
				},
				{
					name = "Kitty config",
					action = ":cd ~/.config/kitty | :e kitty.conf",
					section = "Actions",
				},
				{
					name = "Zsh config",
					action = ":e ~/.zshrc",
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
