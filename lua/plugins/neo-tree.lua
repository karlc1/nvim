return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- "nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			{
				"s1n7ax/nvim-window-picker",
				version = "2.*",
				config = function()
					require("window-picker").setup({
						hint = "floating-big-letter",
						autoselect_one = true,
						include_current = true,
						show_prompt = false,
						filter_rules = {
							bo = {
								filetype = { "neo-tree", "neo-tree-popup", "notify", "fidget"},
								buftype = { "terminal", "quickfix" },
							},
						},
					})
				end,
			},
		},
		branch = "v2.x",
		keys = {
			{ "<leader>E", "<cmd>Neotree toggle<cr>", desc = "Toggle tree view" },
			{ "<leader>e", "<cmd>Neotree reveal<cr>", desc = "Reveal tree view" },
		},
		cmd = "Neotree",
		config = function()
			vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
			require("neo-tree").setup({
				sync_root_with_cwd = true,
				-- respect_buf_cwd = true,
				update_focused_file = {
					enable = true,
					update_root = true,
				},
				close_if_last_window = true,

				window = {
					mappings = {
						["<cr>"] = "open_with_window_picker",
					},
				},

				hijack_netrw_behavior = "open_default",

				filesystem = {
					filtered_items = {
						visible = true,
						hide_dotfiles = false,
						hide_gitignored = false,
					},
				},
				default_component_configs = {
					git_status = {
						symbols = {
							deleted = "",
							renamed = "",
							untracked = "",
							ignored = "",
							unstaged = "",
							staged = "",
							conflict = "",
						},
					},
				},
			})
		end,
	},
}
