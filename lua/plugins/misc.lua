return {
	{
		"nmac427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	},
	{
		"terrortylor/nvim-comment",
		event = "VeryLazy",
		keys = {
			{ "<Leader>c", "<cmd>CommentToggle<cr>", mode = { "n" }, desc = "Toggle comment" },
			{ "<Leader>c", ":'<,'>CommentToggle<cr>", mode = { "v" }, desc = "Toggle comment" },
		},
		config = function()
			require("nvim_comment").setup({
				comment_empty = false,
				create_mappings = false,
			})
		end,
	},
	{
		"echasnovski/mini.pairs",
		version = "*",
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			local wk = require("which-key")

			wk.register({
				f = {
					name = "Find something",
				},
				f = {
					name = "Toggle something",
				},
			}, { prefix = "<leader>" })
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			mode = "exact",
		},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
			},
			{
				"S",
				mode = { "o", "x" },
				function()
					require("flash").treesitter()
				end,
			},
		},
	},
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				detection_methods = { "pattern", "lsp" },
				patterns = { ".git" },
			})
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		lazy = false,
		config = function()
			vim.api.nvim_set_keymap(
				"n",
				"<Leader>tt",
				":ToggleTermToggleAll<cr>",
				{ noremap = true, silent = true, desc = "Toggle all terminals" }
			)
			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
				vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
			end

			vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
			require("toggleterm").setup()

			vim.cmd([[
				autocmd TermEnter term://*toggleterm#*
					  \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
				nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
				inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
			]])
		end,
	},
	{
		"chomosuke/term-edit.nvim",
		ft = "toggleterm",
		version = "1.*",
		config = function()
			require("term-edit").setup({
				prompt_end = "%$ ",
			})
		end,
	},
}
