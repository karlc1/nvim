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
			vim.cmd([[autocmd FileType terraform setlocal commentstring=#%s]])
			vim.cmd([[autocmd FileType hcl setlocal commentstring=#%s]])

			require("nvim_comment").setup({
				comment_empty = false,
				create_mappings = false,
			})
		end,
	},
	-- {
	-- 	"echasnovski/mini.pairs",
	-- 	version = "*",
	-- 	config = function()
	-- 		require("mini.pairs").setup()
	-- 	end,
	-- },
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})
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
				t = {
					name = "Toggle something",
				},
			}, { prefix = "<leader>" })
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
		   search = {
  				mode = "exact",
			},
      		modes = {
        		search = {
          			enabled = false, -- if / and ? should be taken over by flash
				},
			},
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
	-- {
	-- 	"ahmedkhalf/project.nvim",
	-- 	config = function()
	-- 		require("project_nvim").setup({
	-- 			-- detection_methods = { "pattern", "lsp" },
	-- 			detection_methods = { "lsp", "pattern"},
	-- 			-- patterns = { ".git", ".terraform" },
	-- 			patterns = { ".git" },
	-- 		})
	-- 	end,
	-- },
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		lazy = false,
		config = function()
			local opts = { buffer = 0 }
			vim.keymap.set("n", "<Leader-a>", function()
				print("apa")
			end, opts)

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
				nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm dir=%:p:h"<CR>
				inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm dir=%:p:h"<CR>
				autocmd TermEnter term://*toggleterm#*
					  \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
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
	{
		"gbprod/yanky.nvim",
		config = function()
			require("yanky").setup({
				highlight = {
					on_put = true,
					on_yank = true,
					timer = 150,
				},
				preserve_cursor_position = {
					enabled = true,
				},
			})
			vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
			vim.keymap.set({ "n" }, "<c-n>", "<Plug>(YankyCycleForward)")
			vim.keymap.set({ "n" }, "<c-p>", "<Plug>(YankyCycleBackward)")
			vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutIndentAfter)")
			vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutIndentBefore)")
			vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutIndentAfter)")
			vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutIndentBefore)")

			require("telescope").load_extension("yank_history")
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({ default = true })
		end,
	},
	{
		"someone-stole-my-name/yaml-companion.nvim",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("telescope").load_extension("yaml_schema")
		end,
	},
	{
		"sustech-data/wildfire.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("wildfire").setup()
		end,
	},
	{
		"rcarriga/nvim-notify",
	},
	{
		"xiyaowong/transparent.nvim",
		config = function()
            vim.cmd[[hi DiagnosticUnnecessary guifg=#FFFFFF]]
			require("transparent").setup({
				groups = { -- table: default groups
					"Normal",
					"NormalNC",
					"Comment",
					"Constant",
					"Special",
					"Identifier",
					"Statement",
					"PreProc",
					"Type",
					"Underlined",
					"Todo",
					"String",
					"Function",
					"Conditional",
					"Repeat",
					"Operator",
					"Structure",
					"LineNr",
					"NonText",
					"SignColumn",
					"CursorLineNr",
					"EndOfBuffer",
				},
				extra_groups = {
					"TelescopeNormal",
					"TelescopeBorder",
					"NeoTreeNormal",
					"NeoTreeNormalNC",
					"MiniStarterItem",
				}, -- table: additional groups that should be cleared
				exclude_groups = {}, -- table: groups you don't want to clear
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
	{
		"towolf/vim-helm",
	},
}
