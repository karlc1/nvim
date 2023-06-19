vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = { highlight_whole_line = false },
})

-- override general config with lsp specific setup
local function config_overrides()
	require("lspconfig").lua_ls.setup({
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
		on_attach = function(client, bufnr) end,
	})
end

return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-buffer" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
			{ "nvim-telescope/telescope.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
				config = function()
					require("mason").setup()
				end,
			},
			{
				"dnlhc/glance.nvim",
				config = function()
					require("glance").setup({
						detached = true,
						border = {
							enable = true,
							top_char = "―",
							bottom_char = "―",
						},
					})
				end,
			},
			{
				"glepnir/lspsaga.nvim",
				event = "LspAttach",
				build = ":TSInstall markdown markdown_inline",
				config = function()
					require("lspsaga").setup({})
				end,
				dependencies = {
					{ "nvim-tree/nvim-web-devicons" },
					{ "nvim-treesitter/nvim-treesitter" },
				},
			},
			{
				"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
				config = function()
					require("lsp_lines").setup()
					-- disable on startup
					require("lsp_lines").toggle()
				end,
			},
		},
		config = function()
			local lsp = require("lsp-zero").preset({
				manage_nvim_cmp = {
					set_sources = "recommended",
					set_basic_mappings = false,
					set_extra_mappings = false,
					use_luasnip = true,
					set_format = false,
					documentation_window = false,
				},
			})
			lsp.on_attach(function(client, bufnr)
				-- any default config for all lsp's
				vim.keymap.set(
					"n",
					"gh",
					vim.lsp.buf.hover,
					{ silent = true, buffer = true, desc = "Hover symbol under cursor" }
				)
				vim.keymap.set(
					"n",
					"gd",
					vim.lsp.buf.definition,
					{ silent = true, buffer = true, desc = "Show definitions" }
				)
				vim.keymap.set(
					"n",
					"gi",
					"<cmd>Glance implementations<cr>",
					{ silent = true, buffer = true, desc = "Show implementations" }
				)
				vim.keymap.set(
					"n",
					"gr",
					"<cmd>Glance references<cr>",
					{ silent = true, buffer = true, desc = "Show references" }
				)
				vim.keymap.set(
					"n",
					"gR",
					"<cmd>Lspsaga rename<cr>",
					{ silent = true, buffer = true, desc = "Rename symbol" }
				)
				vim.keymap.set(
					"n",
					"<Leader>fo",
					"<cmd>Lspsaga outline<cr>",
					{ silent = true, buffer = true, desc = "Show symbol outline" }
				)
				vim.keymap.set(
					"n",
					"<Leader>td",
					require("lsp_lines").toggle,
					{ silent = true, buffer = true, desc = "Toggle lsp lines" }
				)
				vim.keymap.set(
					"n",
					"<leader>fs",
					require("telescope.builtin").lsp_document_symbols,
					{ silent = true, buffer = true, desc = "Document symbols" }
				)
				vim.keymap.set(
					"n",
					"<leader>fS",
					require("telescope.builtin").lsp_workspace_symbols,
					{ silent = true, buffer = true, desc = "Workspace symbols" }
				)
				vim.keymap.set(
					"n",
					"<leader>dn",
					"<cmd>Lspsaga diagnostic_jump_next<cr>",
					{ silent = true, buffer = true, desc = "Jump to next diagnostic" }
				)
				vim.keymap.set(
					"n",
					"<leader>dp",
					"<cmd>Lspsaga diagnostic_jump_prev<cr>",
					{ silent = true, buffer = true, desc = "Jump to previous diagnostic" }
				)
				vim.keymap.set(
					"n",
					"<leader>dp",
					"<cmd>Lspsaga diagnostic_jump_prev<cr>",
					{ silent = true, buffer = true, desc = "Jump to previous diagnostic" }
				)
				vim.keymap.set(
					"n",
					"<leader>fd",
					"<cmd>Lspsaga show_buf_diagnostics<cr>",
					{ silent = true, buffer = true, desc = "List buffer diagnostics" }
				)
				vim.keymap.set(
					"n",
					"<leader>fD",
					"<cmd>Lspsaga show_workspace_diagnostics<cr>",
					{ silent = true, buffer = true, desc = "List workspace diagnostics" }
				)
			end)

			lsp.set_sign_icons({
				error = "✘",
				warn = "▲",
				hint = "⚑",
				info = "»",
			})

			config_overrides()

			lsp.setup()

			local cmp = require("cmp")
			local cmp_action = require("lsp-zero").cmp_action()

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				sources = {
					{ name = "path" },
					{ name = "nvim_lsp" },
					{ name = "buffer", keyword_length = 3 },
					{ name = "luasnip", keyword_length = 2 },
				},
				mapping = {
					["<C-j>"] = cmp_action.luasnip_supertab(),
					["<C-k>"] = cmp_action.luasnip_shift_supertab(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<C-CR>"] = cmp.mapping.complete(),
				},
			})
		end,
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"VonHeikemen/lsp-zero.nvim",
		},
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.diagnostics.eslint,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.diagnostics.terraform_validate,
					null_ls.builtins.diagnostics.tfsec,
					null_ls.builtins.formatting.terraform_fmt,
					null_ls.builtins.diagnostics.cfn_lint,
					null_ls.builtins.diagnostics.actionlint,
				},
			})

			vim.api.nvim_exec(
				[[
            augroup FormatAutogroup
              autocmd!
            	autocmd BufWritePost * silent lua vim.lsp.buf.format()
            augroup END
            ]],
				true
			)
		end,
	},
}
