local old = {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
			{ "L3MON4D3/LuaSnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-buffer" },
			{ "saadparwaiz1/cmp_luasnip" },
		},
		config = function()
			require("lsp-zero.cmp").extend()

			local cmp = require("cmp")
			local cmp_action = require("lsp-zero").cmp_action()

			cmp.setup({
				sources = {
					{ name = "path" },
					{ name = "nvim_lsp" },
					{ name = "buffer", keyword_length = 3 },
					{ name = "luasnip", keyword_length = 2 },
				},
				mapping = {
					["<Tab>"] = cmp_action.luasnip_supertab(),
					["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<C-CR>"] = cmp.mapping.complete(),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
				},
			})
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		event = { "BufReadPre", "BufNewFile", "InsertEnter" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		lazy = true,
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

			lsp.set_sign_icons({
				error = "✘",
				warn = "▲",
				hint = "⚑",
				info = "»",
			})

			lsp.setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		cmd = "LspInfo",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason-lspconfig.nvim" },
			{
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
		},
		config = function()
			local lsp = require("lsp-zero")

			require("lspconfig").lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			-- require("lspconfig").pyright.setup({
			-- 	settings = {
			-- 		python = {
			-- 			analysis = {
			-- 				typeCheckingMode = "basic",
			-- 			},
			-- 		},
			-- 	},
			-- })
			require("lspconfig").pyright.setup({
				python = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "workspace",
						useLibraryCodeForTypes = true,
						typeCheckingMode = "basic",
						reportGeneralTypeIssues = "none",
					},
				},
			})

			-- require("lspconfig").pyre.setup({})

			-- require("lspconfig").pylsp.setup({
			-- 	settings = {
			-- 		pylsp = {
			-- 			plugins = {
			-- 				pycodestyle = {
			-- 					enabled = false,
			-- 					ignore = { "E501", "E231" },
			-- 					maxLineLength = 88,
			-- 				},
			-- 			},
			-- 		},
			-- 	},
			-- })

			lsp.on_attach(function(client, bufnr)
				if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
					vim.diagnostic.disable(bufnr)
					vim.defer_fn(function()
						vim.diagnostic.reset(nil, bufnr)
					end, 1000)
				end

				vim.keymap.set(
					"n",
					"gh",
					vim.lsp.buf.hover,
					{ silent = true, buffer = true, desc = "Hover symbol under cursor" }
				)
				vim.keymap.set(
					"n",
					"gd",
					"<cmd>Glance definitions<cr>",
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
					"<leader>dl",
					"<cmd>Telescope diagnostics<cr>",
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
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"VonHeikemen/lsp-zero.nvim",
		},
		event = { "BufReadPre", "BufNewFile", "InsertEnter" },
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
					-- null_ls.builtins.diagnostics.pylint,
				},
			})

			-- vim.api.nvim_exec(
			-- 	[[
			--             augroup FormatAutogroup
			--               autocmd!
			--             	autocmd BufWritePre * silent lua vim.lsp.buf.format()
			--             augroup END
			--             ]],
			-- 	true
			-- )
		end,
	},
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		event = "LspAttach",
		init = function()
			vim.diagnostic.config({
				virtual_text = false,
				virtual_lines = { highlight_whole_line = false },
			})
		end,
		config = function()
			print("LSP LINES ATTACH")
			require("lsp_lines").setup()
			-- disable on startup
			require("lsp_lines").toggle()
			vim.keymap.set(
				"n",
				"<Leader>td",
				require("lsp_lines").toggle,
				{ silent = true, buffer = true, desc = "Toggle lsp lines" }
			)
		end,
	},

	{
		"williamboman/mason.nvim",
		build = function()
			pcall(vim.cmd, "MasonUpdate")
		end,
		config = function()
			require("mason").setup()
		end,
		cmd = { "Mason", "MasonInstall", "MasonLog", "MasonUninstall", "MasonUninstallAll", "MasonUpdate" },
	},
	{
		"glepnir/lspsaga.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		build = ":TSInstall markdown markdown_inline",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({
				lightbulb = {
					enable = false,
				},
			})
		end,
	},
	{
		"dnlhc/glance.nvim",
		event = "LspAttach",
		config = function()
			require("glance").setup({
				hooks = {
					before_open = function(results, open, jump, method)
						if #results == 1 and method == "definitions" then
							jump(results[1]) -- argument is optional
						else
							open(results) -- argument is optional
						end
					end,
				},
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
		"j-hui/fidget.nvim",
		event = "LspAttach",
		config = function()
			require("fidget").setup({
				timer = {
					spinner_rate = 125, -- frame rate of spinner animation, in ms
					fidget_decay = 2500, -- how long to keep around empty fidget, in ms
					task_decay = 2000, -- how long to keep around completed task, in ms
				},
			})
		end,
	},
}

local function on_attach(client, bufnr)
	if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
		vim.diagnostic.disable(bufnr)
		vim.defer_fn(function()
			vim.diagnostic.reset(nil, bufnr)
		end, 1000)
	end

	vim.keymap.set("n", "gh", vim.lsp.buf.hover, { silent = true, buffer = bufnr, desc = "Hover symbol under cursor" })
	vim.keymap.set(
		"n",
		"gd",
		"<cmd>Glance definitions<cr>",
		{ silent = true, buffer = bufnr, desc = "Show definitions" }
	)
	vim.keymap.set(
		"n",
		"gi",
		"<cmd>Glance implementations<cr>",
		{ silent = true, buffer = bufnr, desc = "Show implementations" }
	)
	vim.keymap.set("n", "gr", "<cmd>Glance references<cr>", { silent = true, buffer = bufnr, desc = "Show references" })
	vim.keymap.set("n", "gR", "<cmd>Lspsaga rename<cr>", { silent = true, buffer = bufnr, desc = "Rename symbol" })
	vim.keymap.set(
		"n",
		"<Leader>fo",
		"<cmd>Lspsaga outline<cr>",
		{ silent = true, buffer = bufnr, desc = "Show symbol outline" }
	)
	vim.keymap.set(
		"n",
		"<leader>fs",
		require("telescope.builtin").lsp_document_symbols,
		{ silent = true, buffer = bufnr, desc = "Document symbols" }
	)
	vim.keymap.set(
		"n",
		"<leader>fS",
		require("telescope.builtin").lsp_workspace_symbols,
		{ silent = true, buffer = bufnr, desc = "Workspace symbols" }
	)
	vim.keymap.set(
		"n",
		"<leader>dn",
		"<cmd>Lspsaga diagnostic_jump_next<cr>",
		{ silent = true, buffer = bufnr, desc = "Jump to next diagnostic" }
	)
	vim.keymap.set(
		"n",
		"<leader>dp",
		"<cmd>Lspsaga diagnostic_jump_prev<cr>",
		{ silent = true, buffer = bufnr, desc = "Jump to previous diagnostic" }
	)
	vim.keymap.set(
		"n",
		"<leader>dl",
		"<cmd>Telescope diagnostics<cr>",
		{ silent = true, buffer = bufnr, desc = "Jump to previous diagnostic" }
	)
	vim.keymap.set(
		"n",
		"<leader>fd",
		"<cmd>Lspsaga show_buf_diagnostics<cr>",
		{ silent = true, buffer = bufnr, desc = "List buffer diagnostics" }
	)
	vim.keymap.set(
		"n",
		"<leader>fD",
		"<cmd>Lspsaga show_workspace_diagnostics<cr>",
		{ silent = true, buffer = bufnr, desc = "List workspace diagnostics" }
	)
end

return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "glepnir/lspsaga.nvim" },
			{ "hrsh7th/cmp-nvim-lsp" },
		},
		config = function()
			require("mason-lspconfig").setup()

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			require("mason-lspconfig").setup_handlers({
				-- default handler (optional)
				function(server_name)
					require("lspconfig")[server_name].setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,

				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						on_attach = on_attach,
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = {
									version = "LuaJIT",
								},
								diagnostics = {
									globals = { "vim" },
								},
								workspace = {
									-- Make the server aware of Neovim runtime files
									library = vim.api.nvim_get_runtime_file("", true),
									checkThirdParty = false,
								},
								-- Do not send telemetry data containing a randomized but unique identifier
								telemetry = {
									enable = false,
								},
							},
						},
					})
				end,

				["pylyzer"] = function()
					--require("lspconfig").pylyzer.setup({})
				end,

				["pyright"] = function()
					require("lspconfig").pyright.setup({
						on_attach = on_attach,
						capabilities = capabilities,
						settings = {
							pyright = {
								autoImportCompletion = true,
							},
							python = {
								analysis = {
									autoSearchPaths = true,
									diagnosticMode = "openFilesOnly",
									useLibraryCodeForTypes = true,
									typeCheckingMode = "off",
								},
							},
						},
					})
				end,

				["yamlls"] = function()
					require("lspconfig").yamlls.setup({
						on_attach = on_attach,
						capabilities = capabilities,
						settings = {
							yaml = {
								hover = true,
								completion = true,
								redhat = { telemetry = { enabled = false } },
								validate = true,
								format = { enable = true },
								customTags = {
									"!fn",
									"!And",
									"!If",
									"!Not",
									"!Equals",
									"!Or",
									"!FindInMap",
									"!FindInMap sequence",
									"!FindInMap scalar",
									"!Base64",
									"!Cidr",
									"!Ref",
									"!Ref",
									"!Ref scalar",
									"!Ref sequence",
									"!Sub",
									"!GetAtt",
									"!GetAZs",
									"!ImportValue",
									"!Select",
									"!Select sequence",
									"!Split",
									"!Join sequence",
								},
							},
						},
					})
				end,
			})
		end,
	},
	{
		"dnlhc/glance.nvim",
		event = "LspAttach",
		config = function()
			require("glance").setup({
				hooks = {
					before_open = function(results, open, jump, method)
						if #results == 1 and method == "definitions" then
							jump(results[1]) -- argument is optional
						else
							open(results) -- argument is optional
						end
					end,
				},
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
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		build = ":TSInstall markdown markdown_inline",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({
				lightbulb = {
					enable = false,
				},
			})
		end,
	},
}
