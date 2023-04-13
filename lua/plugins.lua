vim.cmd([[packadd packer.nvim]])

vim.cmd([[augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end]])

return require("packer").startup(function(use)


	-- Packer
	use("wbthomason/packer.nvim")

	use({
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup({})
		end
	})
	-- use({ "nvim-lua/popup.nvim", opt = true })

	-- LSP
	-- use({ "neovim/nvim-lspconfig", opt = false })
	-- use({
	-- 	"williamboman/nvim-lsp-installer",
	-- 	opt = false,
	-- })
	--
	--
	--

	-- use({
	-- 	"folke/noice.nvim",
	-- 	requires = {
	-- 		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	-- 		"MunifTanjim/nui.nvim",
	-- 		"rcarriga/nvim-notify",
	-- 	},
	-- 	event = "VimEnter",
	-- 	config = function()
	-- 		require("noice").setup({
	-- 			routes = {
	-- 				{
	-- 					filter = {
	-- 						event = "msg_show",
	-- 						kind = "",
	-- 						find = "written",
	-- 					},
	-- 					opts = { skip = true },
	-- 				},
	-- 				{
	-- 					filter = {
	-- 						event = "msg_show",
	-- 						kind = "",
	-- 						find = "[LSP] Format request failed",
	-- 					},
	-- 					opts = { skip = true },
	-- 				},
	-- 			},
	-- 			views = {
	-- 				cmdline_popup = {
	-- 					position = {
	-- 						row = 11,
	-- 						col = "50%",
	-- 					},
	-- 					size = {
	-- 						width = 60,
	-- 						height = "auto",
	-- 					},
	-- 				},
	-- 				popupmenu = {
	-- 					relative = "editor",
	-- 					position = {
	-- 						row = 14,
	-- 						col = "50%",
	-- 					},
	-- 					size = {
	-- 						width = 60,
	-- 						height = 10,
	-- 					},
	-- 					border = {
	-- 						style = "rounded",
	-- 						padding = { 0, 1 },
	-- 					},
	-- 					win_options = {
	-- 						winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
	-- 					},
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- })

	use({
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup({
				bind = true, -- This is mandatory, otherwise border config won't get registered.
				handler_opts = {
					border = "rounded",
				},
				hint_prefix = "H",
			})
		end,
	})

	use({ "ahmedkhalf/lsp-rooter.nvim", opt = false })

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").setup({
				defaults = {
					winblend = 0,
					layout_strategy = "flex",
					layout_config = {
						preview_cutoff = 10,
						prompt_position = "top",
					},
					file_ignore_patterns = {
						"vendor/.*",
					},
				},
				pickers = {
					find_files = {
						theme = "dropdown",
						previewer = false,
						layout_config = {
							height = 0.5,
						},
					},
					live_grep = {
						theme = "ivy",
						layout_config = {
							height = 0.6,
							width = 0.95,
							preview_cutoff = 10,
							prompt_position = "bottom",
						},
					},
					lsp_document_symbols = {
						theme = "dropdown",
						previewer = false,
						layout_config = {
							height = 0.5,
							width = 60,
						},
						symbol_width = 45,
						symbol_type_width = 100,
					},
					lsp_references = {
						theme = "ivy",
						-- previewer = true,
						layout_config = {
							height = 0.9,
							width = 0.9,
							preview_width = 0.7,
						},
						fname_width = 500,
					},
				},
			})
			vim.api.nvim_exec(
				[[
                  highlight TelescopeSelection      guibg=bg gui=bold
                  highlight TelescopeNormal         guibg=#00000
                  highlight TelescopeBorder         guifg=#00ff00
                  highlight TelescopePromptBorder   guifg=#A0A0A0 gui=bold
                  highlight TelescopeResultsBorder  guifg=#A0A0A0 gui=bold
                  highlight TelescopePreviewBorder  guifg=#A0A0A0
                  " highlight TelescopeTitle          guifg=#ffffff

                  highlight link TelescopeResultsStruct structure
                  highlight link TelescopeResultsMethod string
                  highlight link TelescopePromptTitle constant
                  ]],
				true
			)
		end,
	})

	-- Color and visuals
	use({ "embark-theme/vim", opt = true })
	use({
		"mcchrish/zenbones.nvim",
		requires = "rktjmp/lush.nvim",
	})
	use({
		"Shatur/neovim-ayu",
	})

	use({
		"kyazdani42/nvim-web-devicons",
		opt = false,
		config = function()
			require("nvim-web-devicons").setup({
				default = true,
			})
		end,
	})

	-- Keymappings
	use({ "folke/which-key.nvim", opt = false })

	-- Buffers
	use({
		"akinsho/bufferline.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("bufferline").setup({
				options = {
					show_close_icon = false,
					show_buffer_icons = false,
					buffer_close_icon = "",
					max_name_length = 18,
					always_show_bufferline = false,
					close_icon = "",
					highlights = {
						buffer_selected = {
							guifg = "#282828",
							guibg = "#a89984",
							gui = "bold",
						},
					},
					offsets = {
						{ filetype = "NvimTree", text = "File Explorer", text_align = "center" },
						{ filetype = "neo-tree" },
						{ filetype = "dapui_scopes" },
						{ filetype = "dapui_breakpoints" },
					},
				},
			})
		end,
	})

	-- Tree file explorer
	-- use({
	-- 	"kyazdani42/nvim-tree.lua",
	-- 	requires = "kyazdani42/nvim-web-devicons",
	-- 	opt = false,
	-- 	config = function()
	-- 		require("nvim-tree").setup({
	-- 			-- auto_close = true,
	-- 			update_cwd = true,
	-- 			view = {
	-- 				auto_resize = true,
	-- 			},
	-- 		})
	-- 	end,
	-- })

	-- Note taking
	-- use({
	-- 	"vimwiki/vimwiki",
	-- 	opt = false,
	-- 	config = function()
	-- 		-- vim.cmd[[let g:vimwiki_key_mappings = { 'all_maps': 0, }]]
	-- 	end,
	-- })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {
			"nvim-treesitter/playground",
		},
		run = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "go", "norg", "norg_table" },
				highlight = {
					enable = true,
					-- additional_vim_regex_highlighting = {"org"}
				},
				indent = {
					enable = false,
				},
				playground = {
					enable = true,
					disable = {},
					updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
					persist_queries = false, -- Whether the query persists across vim sessions
					keybindings = {
						toggle_query_editor = "o",
						toggle_hl_groups = "i",
						toggle_injected_languages = "t",
						toggle_anonymous_nodes = "a",
						toggle_language_display = "I",
						focus_language = "f",
						unfocus_language = "F",
						update = "R",
						goto_node = "<cr>",
						show_help = "?",
					},
				},
			})
		end,
	})

	-- Navigation
	use({
		"karb94/neoscroll.nvim",
		opt = false,
		config = function()
			require("neoscroll").setup({})
			local t = {}
			-- Syntax: t[keys] = {function, {function arguments}}
			t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "130" } }
			t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "130" } }
			t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "450" } }
			t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "450" } }
			t["<C-y>"] = { "scroll", { "-0.10", "false", "100" } }
			t["<C-e>"] = { "scroll", { "0.10", "false", "100" } }
			t["zt"] = { "zt", { "150" } }
			t["zz"] = { "zz", { "150" } }
			t["zb"] = { "zb", { "150" } }
			require("neoscroll.config").set_mappings(t)
		end,
	})

	use({
		"phaazon/hop.nvim",
		opt = false,
		config = function()
			require("hop").setup({
				-- require'hop'.setup { keys = 'etovxqpdygfblhckisuran' }
				require("hop").setup({ keys = "asdfghjkl" }),
			})
			require("hop.highlight").insert_highlights()
		end,
	})

	-- use({
	-- 	"ggandor/leap.nvim",
	-- 	config = function()
	-- 		require("leap").set_default_keymaps()
	-- 	end,
	-- })
	--
	-- Snippets
	use({
		"L3MON4D3/LuaSnip",
		-- config = function()
		-- 	local luasnip = require("luasnip")
		-- 	luasnip.config.set_config({
		-- 		history = true,
		-- 	})
		-- end,
	})

	-- use("rafamadriz/friendly-snippets")

	-- Completion
	--
	use({
		"hrsh7th/nvim-cmp",
		-- commit = "ab7f3685475923385a22abc427fe3d2fbb9d0a97",

		requires = {
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-path",
		},
		opt = false,
		config = function()
			vim.api.nvim_exec([[set pumheight=10]], false)

			local cmp = require("cmp")

			cmp.setup({
				preselect = cmp.PreselectMode.None,
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				completion = {
					autocomplete = false,
					completion = {
						completeopt = "menu,menuone,noinsert",
					},
				},
				sorting = {
					comparators = {
						cmp.config.compare.order,
						cmp.config.compare.offset,
						cmp.config.compare.kind,
						cmp.config.compare.length,
						cmp.config.compare.exact,
						-- cmp.config.compare.score,
						-- cmp.config.compare.length,
						-- cmp.config.compare.offset,
						-- cmp.config.compare.sort_text,
						-- cmp.config.compare.order,
					},
				},
				mapping = {
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-u>"] = cmp.mapping.scroll_docs(-1),
					["<C-d>"] = cmp.mapping.scroll_docs(1),
					["<ESC>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
					["<Tab>"] = function(fallback)
						local col = vim.fn.col(".") - 1

						if cmp.visible() then
							-- elseif luasnip and luasnip.expand_or_jumpable() then
							--     luasnip.expand_or_jump()
							cmp.select_next_item()
						elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
							fallback()
						else
							cmp.complete()
						end
					end,
					["<S-Tab>"] = function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end,
				},

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "path" },
					-- { name = "neorg" },
					{ name = "orgmode" },
					-- { name = "cmp-luasnip" },
					{ name = "cmp-nvim-lua" },
				}, {
					{ name = "luasnip" },
				}, {
					{
						name = 'buffer',
						option = {
							get_bufnrs = function()
								return vim.api.nvim_list_bufs()
							end
						}
					},
				}),
				experimental = {
					ghost_text = true,
				},
			})
		end,
	})

	-- Git
	use({ "tpope/vim-fugitive" })
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("gitsigns").setup({
				signcolumn = false,
				numhl = false,
				linehl = false,
				word_diff = false,
			})
		end,
	})

	-- Code comments
	use({
		"terrortylor/nvim-comment",
		opt = false,
		config = function()
			require("nvim_comment").setup({
				create_mappings = false,
				operator_mapping = "gc",
			})
		end,
	})

	--    use {
	--        "folke/todo-comments.nvim",
	--        requires = "nvim-lua/plenary.nvim",
	--        config = function()
	--            require("todo-comments").setup{}
	--        end
	--    }

	-- Status line
	use({
		"feline-nvim/feline.nvim", --tag = 'v0.3.3',
		opt = false,
	})

	-- use({
	-- 	"rcarriga/vim-ultest",
	-- 	requires = { "vim-test/vim-test" },
	-- 	run = ":UpdateRemotePlugins",
	-- 	config = function()
	-- 		require("ultest").setup({})
	-- 		vim.api.nvim_exec(
	-- 			[[
	--                 hi UltestPass ctermfg=Green guifg=#96F291
	--                 hi UltestFail ctermfg=Red guifg=#F70067
	--                 hi UltestRunning ctermfg=Yellow guifg=#FFEC63
	--                 hi UltestBorder ctermfg=Red guifg=#F70067
	--                 hi UltestSummaryInfo ctermfg=cyan guifg=#00F1F5 gui=bold cterm=bold
	--                 hi link UltestSummaryFile UltestSummaryInfo
	--                 hi link UltestSummaryNamespace UltestSummaryInfo
	--               ]],
	-- 			false
	-- 		)
	-- 	end,
	-- })

	-- wildmenu
	-- use({
	-- 	"gelguy/wilder.nvim",
	-- 	run = ":UpdateRemotePlugins",
	-- 	requires = { "romgrk/fzy-lua-native" },
	-- 	config = function()
	-- 		-- call wilder#setup({'modes': [':', '/', '?']})
	-- 		vim.api.nvim_exec(
	-- 			[[
	--
	--             call wilder#setup({
	--                 \ 'modes': [':', '/', '?'],
	--                 \ 'enable_cmdline_enter': 0,
	--                 \ })
	--
	--             call wilder#set_option('use_python_remote_plugin', 0)
	--             call wilder#set_option('noselect', 1)
	--
	--             call wilder#set_option('pipeline', [
	--                   \   wilder#branch(
	--                   \     wilder#cmdline_pipeline({
	--                   \       'fuzzy': 1,
	--                   \       'fuzzy_filter': wilder#lua_fzy_filter(),
	--                   \     }),
	--                   \     wilder#vim_search_pipeline(),
	--                   \   ),
	--                   \ ])
	--
	--             call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
	--                   \ 'border': 'rounded',
	--                   \   'highlighter': wilder#lua_fzy_highlighter(),
	--                   \   'highlights': {
	--                   \       'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
	--                   \   },
	--                   \ })))
	--         ]],
	-- 			false
	-- 		)
	-- 	end,
	-- })

	-- dashboard
	use({
		"karlc1/dashboard-nvim",
		opt = false,
		config = function()
			vim.g.dashboard_custom_header = {
				"",
				"   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆               ",
				"    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦             ",
				"          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄           ",
				"           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄          ",
				"          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀         ",
				"   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄        ",
				"  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄         ",
				" ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄        ",
				" ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄       ",
				"      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆           ",
				"       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃           ",
				"     ⢰⣶  ⣶ ⢶⣆⢀⣶⠂⣶⡶⠶⣦⡄⢰⣶⠶⢶⣦  ⣴⣶           ",
				"     ⢸⣿⠶⠶⣿ ⠈⢻⣿⠁ ⣿⡇ ⢸⣿⢸⣿⢶⣾⠏ ⣸⣟⣹⣧          ",
				"     ⠸⠿  ⠿  ⠸⠿  ⠿⠷⠶⠿⠃⠸⠿⠄⠙⠷⠤⠿⠉⠉⠿⠆         ",
			}

			vim.g.dashboard_custom_header = {
				"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
				"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
				"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
				"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
				"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
				"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
			}

			-- vim.g.dashboard_preview_file = "~/.config/nvim/splash.cat"
			-- vim.g.dashboard_preview_file_height = 15
			-- vim.g.dashboard_preview_file_width = 41

			-- vim.g.dashboard_preview_file = "~/.config/nvim/splash.cat"
			-- vim.g.dashboard_preview_file_height = 15
			-- vim.g.dashboard_preview_file_width = 41
			-- vim.g.dashboard_preview_command = "cat"
			-- vim.g.dashboard_preview_pipeline = "lolcat"

			vim.g.dashboard_default_executive = "telescope"
			vim.g.dashboard_custom_footer = { "" }
			vim.g.dashboard_custom_section = {
				a = {
					description = { "    Find File          " },
					command = "lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 0, previewer=false, layout_config = { height= 100 } }))",
				},
				b = { description = { "    Recent Files       " }, command = "Telescope oldfiles" },
				c = { description = { "    Find Word          " }, command = "Telescope live_grep" },
				d = { description = { "  ✎  Nvim Config        " }, command = ":cd ~/.config/nvim | :e init.lua" },
				e = {
					description = { "  ✎  Plugin Config      " },
					command = ":cd ~/.config/nvim | :e lua/plugins.lua",
				},
				f = {
					description = { "  ✎  Keymapping Config  " },
					command = ":cd ~/.config/nvim | :e lua/keymappings.lua",
				},
			}
			vim.cmd(
				[[autocmd FileType dashboard setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs=  | autocmd WinLeave <buffer> set showtabline=2 ]]
			)

			vim.cmd([[hi! link dashboardHeader String]])
			vim.cmd([[hi! link dashboardCenter Type]])
		end,
	})

	-- debugging
	use({
		"mfussenegger/nvim-dap",
		opt = false,
		config = function()
			-- setup highlights for debug symbols
			vim.cmd(
				[[exec 'hi DebugBreakpoint guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('Error'),'fg')]]
			)
			vim.cmd(
				[[exec 'hi DebugStopped guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('WarningMsg'),'fg')]]
			)
			vim.fn.sign_define("DapBreakpoint", { text = "⊚", texthl = "DebugBreakpoint", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "→", texthl = "DebugStopped", linehl = "Visual", numhl = "" })
		end,
	})

	use({
		"leoluz/nvim-dap-go",
		opt = false,
		config = function()
			require("dap-go").setup()
		end,
	})

	use({
		"rcarriga/nvim-dap-ui",
		opt = false,
		config = function()
			require("dapui").setup({

				-- layouts = {
				-- 	{
				-- 		elements = {
				-- 			"scopes",
				-- 		},
				-- 		size = 0.65,
				-- 		position = "left",
				-- 	},
				-- 	{
				-- 		elements = {
				-- 			"breakpoints",
				-- 		},
				-- 		size = 0.35,
				-- 		position = "left",
				-- 	},
				-- },
				--
				-- windows = { indent = 1 },
			})

			vim.cmd(
				[[exec 'hi DebugBreakpoint guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('Error'),'fg')]]
			)
			vim.cmd(
				[[exec 'hi DebugStopped guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('WarningMsg'),'fg')]]
			)
			vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DebugBreakpoint", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "→", texthl = "DebugStopped", linehl = "Visual", numhl = "" })
		end,
	})

	use({
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	})

	-- mini plugins
	--
	use({
		"echasnovski/mini.nvim",
		required = true,
		config = function()
			require("mini.bufremove").setup({})
			-- require("mini.cursorword").setup({
			-- 	delay = 1000,
			-- })
			-- require("mini.jump").setup({})
			-- require('mini.animate').setup()
		end,
	})

	-- diagnostics (defer diagnostics when not in normal mode)
	use({
		"https://gitlab.com/yorickpeterse/nvim-dd",
		required = true,
		config = function()
			require("dd").setup({ timeout = 250 })
		end,
	})

	-- plantuml
	use({ "aklt/plantuml-syntax" })

	use({
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup({
				context = 100,
			})
		end,
	})

	use({
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({
				window = {
					backdrop = 1,
					width = 0.7,
					height = 0.7,
					options = {
						signcolumn = "no",
						number = false,
						relativenumber = false,
					},
				},
				plugins = {
					twilight = { enabled = false },
				},
			})
		end,
	})

	-- use({
	-- 	"akinsho/toggleterm.nvim",
	-- 	opt = false,
	-- 	config = function()
	-- 		require("toggleterm").setup({
	-- 			-- open_mapping = [[<c-t>]],
	-- 			shading_factor = 1,
	-- 			close_on_exit = true,
	-- 			size = vim.o.lines * 0.4,
	-- 		})
	--
	-- 		function _G.set_terminal_keymaps()
	-- 			local opts = { noremap = true }
	-- 			vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	-- 			-- vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
	-- 			vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	-- 			vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	-- 			vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	-- 			vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
	-- 		end
	-- 		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
	-- 		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	-- 	end,
	-- })

	--    use {
	--        "ldelossa/calltree.nvim",
	--        opt = false,
	--        config = function()
	--            require('calltree').setup({
	--                layout = "bottom",
	--            })
	--        end
	--    }

	-- use({
	-- 	"VonHeikemen/fine-cmdline.nvim",
	-- 	requires = {
	-- 		{ "MunifTanjim/nui.nvim" },
	-- 	},
	-- 	config = function()
	-- 		require("fine-cmdline").setup({
	-- 			cmdline = {
	-- 				enable_keymaps = true,
	-- 				smart_history = true,
	-- 			},
	-- 			popup = {
	-- 				relative = "editor",
	-- 				position = {
	-- 					row = "30%",
	-- 					col = "50%",
	-- 				},
	-- 				size = "40%",
	-- 				border = {
	-- 					style = "rounded",
	-- 					highlight = "String",
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- })

	-- use({
	-- 	"VonHeikemen/searchbox.nvim",
	-- 	requires = {
	-- 		{ "MunifTanjim/nui.nvim" },
	-- 	},
	-- 	config = function()
	-- 		require("searchbox").setup({
	-- 			popup = {
	-- 				relative = "editor",
	-- 				position = {
	-- 					row = "30%",
	-- 					col = "50%",
	-- 				},
	-- 				size = "40%",
	-- 				win_options = {
	-- 					winhighlight = "Normal:Normal",
	-- 				},
	-- 				border = {
	-- 					style = "rounded",
	-- 					highlight = "String",
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- })

	-- use({
	-- 	"nvim-neorg/neorg",
	-- 	-- tag = "latest",
	-- 	config = function()
	-- 		vim.opt.conceallevel = 2
	-- 		vim.opt.concealcursor = "n"
	--
	-- 		local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
	--
	-- 		parser_configs.norg = {
	-- 			install_info = {
	-- 				url = "https://github.com/nvim-neorg/tree-sitter-norg",
	-- 				files = { "src/parser.c", "src/scanner.cc" },
	-- 				branch = "main",
	-- 			},
	-- 		}
	--
	-- 		parser_configs.norg_meta = {
	-- 			install_info = {
	-- 				url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
	-- 				files = { "src/parser.c" },
	-- 				branch = "main",
	-- 			},
	-- 		}
	--
	-- 		parser_configs.norg_table = {
	-- 			install_info = {
	-- 				url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
	-- 				files = { "src/parser.c" },
	-- 				branch = "main",
	-- 			},
	-- 		}
	--
	-- 		require("neorg").setup({
	-- 			-- Tell Neorg what modules to load
	-- 			load = {
	-- 				["core.defaults"] = {}, -- Load all the default modules
	-- 				["core.norg.concealer"] = {
	-- 					config = {
	-- 						markup_preset = "brave",
	-- 					},
	-- 				}, -- Allows for use of icons
	-- 				["core.norg.dirman"] = {
	-- 					-- Manage your directories with Neorg
	-- 					config = {
	-- 						workspaces = {
	-- 							home = "~/neorg",
	-- 						},
	-- 					},
	-- 				},
	-- 				["core.norg.completion"] = {
	-- 					config = {
	-- 						engine = "nvim-cmp",
	-- 					},
	-- 				},
	-- 				["core.keybinds"] = {
	-- 					-- Configure core.keybinds
	-- 					config = {
	-- 						default_keybinds = true, -- Generate the default keybinds
	-- 						neorg_leader = "<Leader>o", -- This is the default if unspecified
	-- 					},
	-- 				},
	-- 				["core.integrations.telescope"] = {}, -- Enable the telescope module
	-- 				["core.gtd.base"] = {
	-- 					config = {
	-- 						workspace = "home",
	-- 					},
	-- 				},
	-- 				["core.presenter"] = {
	-- 					config = {
	-- 						zen_mode = "zen-mode",
	-- 					},
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- 	requires = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-neorg/neorg-telescope",
	-- 	},
	-- })

	use({
		"petertriho/nvim-scrollbar",
		config = function()
			-- vim.cmd([[
			--
			--         noremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR>
			--             \<Cmd>lua require('hlslens').start()<CR>
			--         noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
			--                     \<Cmd>lua require('hlslens').start()<CR>
			--         noremap * *<Cmd>lua require('hlslens').start()<CR>``
			--         noremap # #<Cmd>lua require('hlslens').start()<CR>
			--         noremap g* g*<Cmd>lua require('hlslens').start()<CR>
			--         noremap g# g#<Cmd>lua require('hlslens').start()<CR>
			--
			--         ]])

			require("scrollbar").setup({
				show = false,
				handle = {
					text = " ",
					-- color = "gray",
					hide_if_all_visible = true,
					highlight = "Visual",
				},
				marks = {
					Search = {
						text = { "-", "=" },
						priority = 0,
						color = "yellow",
						cterm = nil,
						highlight = "IncSearch",
					},
				},
				handlers = {
					diagnostic = true,
					search = false, -- Requires hlslens to be loaded
				},
			})

			-- require("scrollbar.handlers.search").setup()
		end,
		-- requires = "kevinhwang91/nvim-hlslens",
	})

	-- use({
	-- 	"sidebar-nvim/sidebar.nvim",
	-- 	config = function()
	-- 		require("sidebar-nvim").setup({
	-- 			open = false,
	-- 			side = "left",
	-- 			initial_width = 40,
	-- 			hide_statusline = false,
	-- 			update_interval = 1000,
	-- 			sections = { "git", "diagnostics", "symbols", "files" },
	-- 			section_separator = "-----",
	-- 			containers = {
	-- 				attach_shell = "/bin/sh",
	-- 				show_all = true,
	-- 				interval = 5000,
	-- 			},
	-- 			datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
	-- 			todos = { ignored_paths = { "~" } },
	-- 			disable_closing_prompt = false,
	-- 		})
	-- 	end,
	-- })

	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("null-ls").setup({
				sources = {
					require("null-ls").builtins.formatting.stylua,
					require("null-ls").builtins.diagnostics.eslint,
					-- require("null-ls").builtins.completion.spell,
					require("null-ls").builtins.formatting.gofmt,
					-- require("null-ls").builtins.completion.luasnip,
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
	})

	use({
		"mhartington/formatter.nvim",
		config = function()
			local prettier = function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.fn.shellescape(vim.api.nvim_buf_get_name(0)), "--single-quote" },
					stdin = true,
				}
			end

			require("formatter").setup({
				filetype = {
					css = { prettier },
					scss = { prettier },
					html = { prettier },
					javascript = { prettier },
					javascriptreact = { prettier },
					typescript = { prettier },
					typescriptreact = { prettier },
					markdown = { prettier },
					json = { prettier },
					jsonc = { prettier },
					yaml = { prettier },
					yml = { prettier },
					lua = {
						function()
							return {
								exe = "luafmt",
								args = { "--indent-count", 2, "--stdin" },
								stdin = true,
							}
						end,
					},
					go = {
						-- goimport
						function()
							return {
								exe = "goimports",
								args = { "-w", vim.api.nvim_buf_get_name(0) },
								stdin = false,
							}
						end,
					},
					python = {
						function()
							return {
								exe = "python3 -m autopep8",
								args = {
									"--in-place --aggressive --aggressive",
									vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
								},
								stdin = false,
							}
						end,
					},
				},
			})

			-- vim.api.nvim_exec(
			--   [[
			--     augroup FormatAutogroup
			--       autocmd!
			--       " autocmd BufWritePost *.go,*.lua,*.py FormatWrite
			--       autocmd BufWritePost *.go,*.lua FormatWrite
			--     augroup END
			--     ]],
			--   true
			-- )
		end,
	})

	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	})

	-- use(
	--   {
	--     "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	--     config = function()
	--       require("lsp_lines").register_lsp_virtual_lines()
	--       -- Disable virtual_text since it's redundant due to lsp_lines.
	--       vim.diagnostic.config(
	--         {
	--           virtual_text = false
	--         }
	--       )
	--     end
	--   }
	-- )

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- using packer.nvim
	use({
		"nmac427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	})

	use({
		"mvpopuk/inspired-github.vim",
	})

	use({
		"EdenEast/nightfox.nvim",
	})

	use({
		"m-demare/hlargs.nvim",
		requires = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("hlargs").setup()
		end,
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			-- vim.opt.list = true
			-- vim.opt.listchars:append("eol:↴")
			-- vim.opt.listchars:append("space:⋅")
			vim.cmd([[hi IndentBlanklineChar guifg=#39383f]])
			vim.cmd([[hi IndentBlanklineContextChar guifg=#53525c]])
			vim.cmd([[highlight IndentBlanklineContextStart guisp=#53525c gui=underline]])

			require("indent_blankline").setup({
				space_char_blankline = " ",
				-- show_current_context = true,
				enabled = true,
				-- show_current_context_start = true,
				filetype_exclude = {
					"dashboard",
					"packer",
					"terminal",
					"help",
					"log",
					"markdown",
					"TelescopePrompt",
					"lsp-installer",
					"lspinfo",
					"toggleterm",
				},
			})
		end,
	})

	use({
		"nvim-telescope/telescope-dap.nvim",
		requires = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("telescope").load_extension("dap")
		end,
	})

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			-- Unless you are still migrating, remove the deprecated commands from v1.x
			vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

			-- If you want icons for diagnostic errors, you'll need to define them somewhere:
			vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
			vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
			-- NOTE: this is changed from v1.x, which used the old style of highlight groups
			-- in the form "LspDiagnosticsSignWarning"

			require("neo-tree").setup({
				close_if_last_window = true,
				popup_border_style = "rounded",
				enable_git_status = true,
				enable_diagnostics = false,
				default_component_configs = {
					indent = {
						indent_size = 2,
						padding = 1, -- extra padding on left hand side
						-- indent guides
						with_markers = true,
						indent_marker = "│",
						last_indent_marker = "└",
						highlight = "NeoTreeIndentMarker",
						-- expander config, needed for nesting files
						with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
						expander_collapsed = "",
						expander_expanded = "",
						expander_highlight = "NeoTreeExpander",
					},
					icon = {
						folder_closed = "",
						folder_open = "",
						folder_empty = "ﰊ",
						default = "*",
					},
					modified = {
						-- symbol = "[+]",
						highlight = "NeoTreeModified",
					},
					name = {
						trailing_slash = false,
						use_git_status_colors = true,
					},
					git_status = {
						symbols = {
							-- Change type
							-- added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
							-- modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
							deleted = "", -- this can only be used in the git_status source
							renamed = "", -- this can only be used in the git_status source
							-- Status type
							untracked = "",
							ignored = "",
							unstaged = "",
							staged = "",
							conflict = "",
						},
					},
				},
				window = {
					position = "left",
					width = 40,
					mappings = {
						["<space>"] = "toggle_node",
						["<2-LeftMouse>"] = "open",
						["<cr>"] = "open",
						["S"] = "open_split",
						["s"] = "open_vsplit",
						["t"] = "open_tabnew",
						["C"] = "close_node",
						["a"] = "add",
						["A"] = "add_directory",
						["d"] = "delete",
						["r"] = "rename",
						["y"] = "copy_to_clipboard",
						["x"] = "cut_to_clipboard",
						["p"] = "paste_from_clipboard",
						["c"] = "copy", -- takes text input for destination
						["m"] = "move", -- takes text input for destination
						["q"] = "close_window",
						["R"] = "refresh",
					},
				},
				nesting_rules = {},
				filesystem = {
					filtered_items = {
						visible = false, -- when true, they will just be displayed differently than normal items
						hide_dotfiles = false,
						hide_gitignored = true,
						hide_by_name = {
							".DS_Store",
							"thumbs.db",
							--"node_modules"
						},
						never_show = { -- remains hidden even if visible is toggled to true
							--".DS_Store",
							--"thumbs.db"
						},
					},
					follow_current_file = true, -- This will find and focus the file in the active buffer every
					-- time the current file is changed while the tree is open.
					hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
					-- in whatever position is specified in window.position
					-- "open_current",  -- netrw disabled, opening a directory opens within the
					-- window like netrw would, regardless of window.position
					-- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
					use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
					-- instead of relying on nvim autocmd events.
					window = {
						mappings = {
							["<bs>"] = "navigate_up",
							["."] = "set_root",
							["H"] = "toggle_hidden",
							["/"] = "fuzzy_finder",
							["f"] = "filter_on_submit",
							["<c-x>"] = "clear_filter",
						},
					},
				},
				buffers = {
					show_unloaded = true,
					window = {
						mappings = {
							["bd"] = "buffer_delete",
							["<bs>"] = "navigate_up",
							["."] = "set_root",
						},
					},
				},
				git_status = {
					window = {
						position = "float",
						mappings = {
							["A"] = "git_add_all",
							["gu"] = "git_unstage_file",
							["ga"] = "git_add_file",
							["gr"] = "git_revert_file",
							["gc"] = "git_commit",
							["gp"] = "git_push",
							["gg"] = "git_commit_and_push",
						},
					},
				},
			})

			vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter-context",
		requires = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("treesitter-context").setup({
				enable = true,
				max_lines = -1,
				patterns = {
					default = {
						"class",
						"function",
						"method",
						"for",
						"while",
						"if",
						"switch",
						"case",
						"return",
					},
				},
				zindex = 20,
			})
		end,
	})

	use({
		"rcarriga/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"akinsho/neotest-go",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-go"),
				},
			})
		end,
	})

	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			vim.g.catppuccin_flavour = "mocha"
			require("catppuccin").setup({
				dim_inactive = {
					enabled = false,
					shade = "dark",
					percentage = 0.15,
				},
			})
		end,
	})

	use({
		"gbprod/yanky.nvim",
		config = function()
			require("yanky").setup({
				preserve_cursor_position = {
					enabled = true,
				},
				highlight = {
					on_put = true,
					on_yank = true,
					timer = 150,
				},
			})

			require("telescope").load_extension("yank_history")
		end,
	})

	-- is set up in lsp.lua
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})

	use({
		"luisiacc/gruvbox-baby",
		config = function()
			vim.g.gruvbox_baby_background_color = "dark"
		end,
	})

	use({
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
			require("lsp_lines").toggle()
		end,
	})

	use({
		"Pocco81/true-zen.nvim",
		config = function()
			local open_callback = function()
				vim.cmd([[ScrollbarHide]])
			end
			require("true-zen").setup({
				modes = {
					narrow = {
						folds_style = "invisible",
						run_atarxis = true,
						open_callback = open_callback,
					},
					ataraxis = {
						quit_untoggles = true,
						open_callback = open_callback,
					},
				},
			})
		end,
	})

	use({
		"sindrets/diffview.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	use({
		"someone-stole-my-name/yaml-companion.nvim",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("telescope").load_extension("yaml_schema")
		end,
	})

	use({
		"https://github.com/rlane/pounce.nvim.git",
		config = function()
			require("pounce").setup({
				accept_keys = "JFKDLSAHGNUVRBYTMICEOXWPQZ",
				accept_best_key = "<enter>",
				multi_window = true,
				debug = false,
			})
		end,
	})


	use {
		'chomosuke/term-edit.nvim',
		tag = 'v1.*',
		config = function()
			require 'term-edit'.setup {
				prompt_end = '%$ ',
			}
		end,
	}

	use({
		'voldikss/vim-floaterm',
		config = function()

			vim.cmd [[let g:floaterm_wintype='split']]
			vim.cmd [[let g:floaterm_width=1.0]]
			vim.cmd [[let g:floaterm_height=0.35]]
			vim.cmd [[let g:floaterm_position='bottom']]

			vim.cmd [[let g:floaterm_autoinsert=v:true]]

			vim.cmd [[hi link Floaterm NvimTreeNormal]]
			vim.cmd [[hi link FloatermBorder NvimTreeNormal]]
			vim.cmd [[hi link FloatermNC NvimTreeNormalNC]]

			-- exit normal mode on esc in term
			vim.cmd [[:tnoremap <Esc> <C-\><C-n>]]

			-- navigate splits in term without
			-- going to normal mode
			vim.cmd [[tnoremap <C-h> <C-\><C-n><C-w>h]]
			vim.cmd [[tnoremap <C-j> <C-\><C-n><C-w>j]]
			vim.cmd [[tnoremap <C-k> <C-\><C-n><C-w>k]]
			vim.cmd [[tnoremap <C-l> <C-\><C-n><C-w>l]]


		end
	})

	use({
		"dnlhc/glance.nvim",
		config = function()
			require('glance').setup({
				-- your configuration
				detached = true,
				border = {
					enable = true,
					top_char = '―',
					bottom_char = '―',
				},
			})
		end,
	})

	use({
		'knubie/vim-kitty-navigator',
		run = 'cp ./*.py ~/.config/kitty/'
	})

	use {
		"nvim-neorg/neorg",
		run = ":Neorg sync-parsers", -- This is the important bit!
		config = function()
			vim.opt.conceallevel = 2
			require('neorg').setup {
				load = {
					["core.defaults"] = {},
					["core.norg.dirman"] = {
						config = {
							workspaces = {
								work = "~/neorg",
							},
							default_workspace = "work"
						}
					},
					["core.norg.concealer"] = {
						config = {
							markup_preset = "brave",
						},
					}, -- Allows for use of icons
				}
			}
		end,
	}
	use {
		'AlexvZyl/nordic.nvim',
		config = function()
			vim.cmd [[hi Search guibg=LightYellow guifg=Black]]
		end
	}


	use {
		'jdhao/better-escape.vim',
		-- event = 'InsertEnter',
		config = function()

			vim.cmd [[
				let g:better_escape_shortcut = ['jk', 'jj', 'kj', 'kk']
				let g:better_escape_interval = 200
			]]

		end,
	}
	use {
		"SmiteshP/nvim-navbuddy",
		requires = {
			"neovim/nvim-lspconfig",
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim"
		},
		config = function()
			local navbuddy = require("nvim-navbuddy")
			local actions = require("nvim-navbuddy.actions")
			navbuddy.setup {
				window = {
					-- border = "single", -- "rounded", "double", "solid", "none"
					border = "rounded",
					-- or an array with eight chars building up the border in a clockwise fashion
					-- starting with the top-left corner. eg: { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" }.
				},
				mappings = {
					["<esc>"] = actions.close, -- Close and cursor to original location
					["q"] = actions.close,

					["j"] = actions.next_sibling, -- down
					["k"] = actions.previous_sibling, -- up

					["h"] = actions.parent, -- Move to left panel
					["l"] = actions.children, -- Move to right panel

					["v"] = actions.visual_name, -- Visual selection of name
					["V"] = actions.visual_scope, -- Visual selection of scope

					["y"] = actions.yank_name, -- Yank the name to system clipboard "+
					["Y"] = actions.yank_scope, -- Yank the scope to system clipboard "+

					["i"] = actions.insert_name, -- Insert at start of name
					["I"] = actions.insert_scope, -- Insert at start of scope

					["a"] = actions.append_name, -- Insert at end of name
					["A"] = actions.append_scope, -- Insert at end of scope

					["r"] = actions.rename, -- Rename currently focused symbol

					["d"] = actions.delete, -- Delete scope

					["f"] = actions.fold_create, -- Create fold of current scope
					["F"] = actions.fold_delete, -- Delete fold of current scope

					["c"] = actions.comment, -- Comment out current scope

					["<enter>"] = actions.select, -- Goto selected symbol
					["o"] = actions.select,
				},
				lsp = {
					auto_attach = true, -- If set to true, you don't need to manually use attach function
					preference = nil -- list of lsp server names in order of preference
				}
			}

		end,
	}

end)
