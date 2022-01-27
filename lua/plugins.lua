vim.cmd [[packadd packer.nvim]]

vim.cmd [[augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end]]

return require("packer").startup(
  function(use)
    -- Packer
    use "wbthomason/packer.nvim"
    use {"nvim-lua/popup.nvim", opt = true}

    -- LSP
    use {"neovim/nvim-lspconfig", opt = false}
    use {
      "williamboman/nvim-lsp-installer",
      opt = false
    }
    use {"ray-x/lsp_signature.nvim", opt = false}
    use {"ahmedkhalf/lsp-rooter.nvim", opt = false}

    -- Telescope
    use {
      "nvim-telescope/telescope.nvim",
      requires = {"nvim-lua/plenary.nvim"},
      config = function()
        require("telescope").setup {
          defaults = {
            winblend = 0,
            layout_strategy = "flex",
            layout_config = {
              preview_cutoff = 10,
              prompt_position = "top"
            }
          },
          pickers = {
            find_files = {
              theme = "dropdown",
              previewer = false,
              layout_config = {
                height = 0.5
              }
            },
            live_grep = {
              theme = "ivy",
              layout_config = {
                height = 0.6,
                width = 0.95,
                preview_cutoff = 10,
                prompt_position = "bottom"
              }
            },
            lsp_document_symbols = {
              theme = "dropdown",
              previewer = false,
              layout_config = {
                height = 0.5,
                width = 60
              },
              symbol_width = 45,
              symbol_type_width = 100
            }
          }
        }
        vim.api.nvim_exec(
          [[
                  highlight TelescopeSelection      guibg=bg gui=bold
                  highlight TelescopeNormal         guibg=#00000
                  highlight TelescopeBorder         guifg=#00ff00
                  highlight TelescopePromptBorder   gui=bold
                  highlight TelescopeResultsBorder  gui=bold
                  highlight TelescopePreviewBorder  guifg=#ffffff
                  highlight TelescopeTitle          guifg=#ffffff

                  highlight link TelescopeResultsStruct structure
                  highlight link TelescopeResultsMethod string
                  highlight link TelescopePromptTitle string
                  ]],
          true
        )
      end
    }

    -- Color and visuals
    use {"embark-theme/vim", opt = true}
    use {
      "mcchrish/zenbones.nvim",
      requires = "rktjmp/lush.nvim"
    }
    use {
      "Shatur/neovim-ayu"
    }

    use {
      "kyazdani42/nvim-web-devicons",
      opt = false,
      config = function()
        require "nvim-web-devicons".setup {
          default = true
        }
      end
    }

    -- Keymappings
    use {"folke/which-key.nvim", opt = false}

    -- Buffers
    use {
      "akinsho/bufferline.nvim",
      requires = {"kyazdani42/nvim-web-devicons"},
      config = function()
        require("bufferline").setup {
          options = {
            show_close_icon = false,
            show_buffer_icons = false,
            max_name_length = 18,
            always_show_bufferline = false,
            close_icon = "",
            highlights = {
              buffer_selected = {
                guifg = "#282828",
                guibg = "#a89984",
                gui = "bold"
              }
            }
          }
        }
      end
    }

    -- Tree file explorer
    use {
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
      opt = false,
      config = function()
        require "nvim-tree".setup {
          auto_close = true,
          update_cwd = true,
          view = {
            auto_resize = true
          }
        }
      end
    }

    -- Note taking
    use {
      "vimwiki/vimwiki",
      opt = false,
      config = function()
        -- vim.cmd[[let g:vimwiki_key_mappings = { 'all_maps': 0, }]]
      end
    }

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require "nvim-treesitter.configs".setup {
          ensure_installed = {"go", "norg", "norg_meta", "norg_table"},
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false
          },
          indent = {
            enable = true
          }
        }
      end
    }

    -- Navigation
    use {
      "karb94/neoscroll.nvim",
      opt = false,
      config = function()
        require("neoscroll").setup({})
        local t = {}
        -- Syntax: t[keys] = {function, {function arguments}}
        t["<C-u>"] = {"scroll", {"-vim.wo.scroll", "true", "200"}}
        t["<C-d>"] = {"scroll", {"vim.wo.scroll", "true", "200"}}
        t["<C-b>"] = {"scroll", {"-vim.api.nvim_win_get_height(0)", "true", "450"}}
        t["<C-f>"] = {"scroll", {"vim.api.nvim_win_get_height(0)", "true", "450"}}
        t["<C-y>"] = {"scroll", {"-0.10", "false", "100"}}
        t["<C-e>"] = {"scroll", {"0.10", "false", "100"}}
        t["zt"] = {"zt", {"150"}}
        t["zz"] = {"zz", {"150"}}
        t["zb"] = {"zb", {"150"}}
        require("neoscroll.config").set_mappings(t)
      end
    }

    use {
      "phaazon/hop.nvim",
      opt = false,
      config = function()
        require "hop".setup()
        require "hop.highlight".insert_highlights()
      end
    }

    -- Snippets
    use {
      "L3MON4D3/LuaSnip",
      config = function()
        -- local luasnip = require('luasnip')
        -- luasnip.config.set_config({
        --     history = false,
        -- })

        require "luasnip/loaders/from_vscode".lazy_load({paths = {"~/.config/nvim/snippets"}})
      end
    }

    use "rafamadriz/friendly-snippets"

    -- Completion
    --
    use {
      "hrsh7th/nvim-cmp",
      -- commit = "ab7f3685475923385a22abc427fe3d2fbb9d0a97",

      requires = {
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-path"
      },
      opt = false,
      config = function()
        vim.api.nvim_exec([[set pumheight=10]], false)

        local cmp = require("cmp")

        cmp.setup(
          {
            preselect = cmp.PreselectMode.None,
            snippet = {
              expand = function(args)
                require "luasnip".lsp_expand(args.body)
              end
            },
            completion = {
              autocomplete = false,
              completion = {
                completeopt = "menu,menuone,noinsert"
              }
            },
            sorting = {
              comparators = {
                cmp.config.compare.order,
                cmp.config.compare.offset,
                cmp.config.compare.kind,
                cmp.config.compare.length,
                cmp.config.compare.exact
                -- cmp.config.compare.score,
                -- cmp.config.compare.length,
                -- cmp.config.compare.offset,
                -- cmp.config.compare.sort_text,
                -- cmp.config.compare.order,
              }
            },
            mapping = {
              ["<C-Space>"] = cmp.mapping.complete(),
              ["<C-u>"] = cmp.mapping.scroll_docs(-1),
              ["<C-d>"] = cmp.mapping.scroll_docs(1),
              ["<ESC>"] = cmp.mapping.abort(),
              ["<CR>"] = cmp.mapping.confirm({select = true, behavior = cmp.ConfirmBehavior.Insert}),
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
              end
            },
            -- sources = {
            -- { name = 'nvim_lsp' },
            -- { name = 'buffer' },
            -- }
            sources = cmp.config.sources(
              {
                {name = "nvim_lsp"},
                {name = "path"},
                {name = "neorg"},
                -- ?
                {name = "luasnip"},
                {name = "cmp-luasnip"},
                {name = "cmp-nvim-lua"}
                -- { name = 'emoji' },
                -- { name = 'vsnip' },
              },
              {
                {name = "buffer"}
              }
            ),
            experimental = {
              ghost_text = true
            }
          }
        )
      end
    }

    -- Git
    use {"tpope/vim-fugitive"}
    use {
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      },
      config = function()
        require("gitsigns").setup {
          signcolumn = false,
          numhl = false,
          linehl = false,
          word_diff = false
        }
      end
    }

    -- Code comments
    use {
      "terrortylor/nvim-comment",
      opt = false,
      config = function()
        require("nvim_comment").setup(
          {
            create_mappings = false,
            operator_mapping = "gc"
          }
        )
      end
    }

    --    use {
    --        "folke/todo-comments.nvim",
    --        requires = "nvim-lua/plenary.nvim",
    --        config = function()
    --            require("todo-comments").setup{}
    --        end
    --    }

    -- Status line
    use {
      "feline-nvim/feline.nvim", --tag = 'v0.3.3',
      opt = false
    }

    use {
      "rcarriga/vim-ultest",
      requires = {"vim-test/vim-test"},
      run = ":UpdateRemotePlugins",
      config = function()
        require("ultest").setup({})
        vim.api.nvim_exec(
          [[
                hi UltestPass ctermfg=Green guifg=#96F291
                hi UltestFail ctermfg=Red guifg=#F70067
                hi UltestRunning ctermfg=Yellow guifg=#FFEC63
                hi UltestBorder ctermfg=Red guifg=#F70067
                hi UltestSummaryInfo ctermfg=cyan guifg=#00F1F5 gui=bold cterm=bold
                hi link UltestSummaryFile UltestSummaryInfo
                hi link UltestSummaryNamespace UltestSummaryInfo
              ]],
          false
        )
      end
    }

    -- wildmenu
    use {
      "gelguy/wilder.nvim",
      run = ":UpdateRemotePlugins",
      requires = {"romgrk/fzy-lua-native"},
      config = function()
        -- call wilder#setup({'modes': [':', '/', '?']})
        vim.api.nvim_exec(
          [[

            call wilder#setup({
                \ 'modes': [':', '/', '?'],
                \ 'enable_cmdline_enter': 0,
                \ })

            call wilder#set_option('use_python_remote_plugin', 0)
            call wilder#set_option('noselect', 1)

            call wilder#set_option('pipeline', [
                  \   wilder#branch(
                  \     wilder#cmdline_pipeline({
                  \       'fuzzy': 1,
                  \       'fuzzy_filter': wilder#lua_fzy_filter(),
                  \     }),
                  \     wilder#vim_search_pipeline(),
                  \   ),
                  \ ])

            call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
                  \ 'border': 'rounded',
                  \   'highlighter': wilder#lua_fzy_highlighter(),
                  \   'highlights': {
                  \       'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
                  \   },
                  \ })))
        ]],
          false
        )
      end
    }

    -- dashboard
    use {
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
          "     ⠸⠿  ⠿  ⠸⠿  ⠿⠷⠶⠿⠃⠸⠿⠄⠙⠷⠤⠿⠉⠉⠿⠆         "
        }
        vim.g.dashboard_default_executive = "telescope"
        -- vim.g.dashboard_preview_command = 'cat'
        -- vim.g.dashboard_preview_pipeline = 'lolcat'
        vim.g.dashboard_custom_footer = {""}
        vim.g.dashboard_custom_section = {
          a = {
            description = {"    Find File          "},
            command = "lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 0, previewer=false, layout_config = { height= 100 } }))"
          },
          b = {description = {"    Recent Files       "}, command = "Telescope oldfiles"},
          c = {description = {"    Find Word          "}, command = "Telescope live_grep"},
          d = {description = {"  ✎  Nvim Config        "}, command = ":cd ~/.config/nvim | :e init.lua"},
          e = {description = {"  ✎  Plugin Config      "}, command = ":cd ~/.config/nvim | :e lua/plugins.lua"},
          f = {description = {"  ✎  Keymapping Config  "}, command = ":cd ~/.config/nvim | :e lua/keymappings.lua"}
        }
        vim.cmd [[autocmd FileType dashboard setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs=  | autocmd WinLeave <buffer> set showtabline=2 ]]

        vim.cmd [[hi! link dashboardHeader String]]
        vim.cmd [[hi! link dashboardCenter Type]]
      end
    }

    -- debugging
    use {
      "mfussenegger/nvim-dap",
      opt = false,
      config = function()
        -- setup highlights for debug symbols
        vim.cmd [[exec 'hi DebugBreakpoint guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('Error'),'fg')]]
        vim.cmd [[exec 'hi DebugStopped guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('WarningMsg'),'fg')]]
        vim.fn.sign_define("DapBreakpoint", {text = "⊚", texthl = "DebugBreakpoint", linehl = "", numhl = ""})
        vim.fn.sign_define("DapStopped", {text = "→", texthl = "DebugStopped", linehl = "Visual", numhl = ""})
      end
    }

    use {
      "leoluz/nvim-dap-go",
      opt = false,
      config = function()
        require("dap-go").setup()
      end
    }

    use {
      "rcarriga/nvim-dap-ui",
      opt = false,
      config = function()
        require("dapui").setup(
          {
            sidebar = {
              -- You can change the order of elements in the sidebar
              elements = {
                -- Provide as ID strings or tables with "id" and "size" keys
                {
                  id = "scopes",
                  size = 0.65 -- Can be float or integer > 1
                },
                {id = "breakpoints", size = 0.35}
              },
              size = 60,
              position = "left" -- Can be "left", "right", "top", "bottom"
            },
            windows = {indent = 1}
          }
        )
      end
    }

    use {
      "theHamsta/nvim-dap-virtual-text",
      opt = false
      -- config = function()
      --     vim.g.dap_virtual_text = true
      -- end
    }

    -- stabilize window
    use {
      "luukvbaal/stabilize.nvim",
      config = function()
        require("stabilize").setup()
      end
    }

    -- mini plugins
    --
    use {
      "echasnovski/mini.nvim",
      required = true,
      config = function()
        require("mini.bufremove").setup({})
      end
    }

    -- diagnostics (defer diagnostics when not in normal mode)
    use {
      "https://gitlab.com/yorickpeterse/nvim-dd",
      required = true,
      config = function()
        require("dd").setup({timeout = 250})
      end
    }

    -- plantuml
    use {"aklt/plantuml-syntax"}

    use {
      "folke/twilight.nvim",
      config = function()
        require("twilight").setup {
          context = 100
        }
      end
    }

    use {
      "folke/zen-mode.nvim",
      config = function()
        require("zen-mode").setup {
          window = {
            backdrop = 1,
            options = {
              signcolumn = "no",
              number = false,
              relativenumber = false
            }
          },
          plugins = {
            twilight = {enabled = false}
          }
        }
      end
    }

    use {
      "akinsho/toggleterm.nvim",
      opt = false,
      config = function()
        require("toggleterm").setup {
          open_mapping = [[<c-t>]],
          shading_factor = 1,
          close_on_exit = true,
          size = vim.o.lines * 0.4
        }

        function _G.set_terminal_keymaps()
          local opts = {noremap = true}
          vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
          -- vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
          vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
          vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
          vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
          vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
        end
        -- if you only want these mappings for toggle term use term://*toggleterm#* instead
        vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
      end
    }

    --    use {
    --        "ldelossa/calltree.nvim",
    --        opt = false,
    --        config = function()
    --            require('calltree').setup({
    --                layout = "bottom",
    --            })
    --        end
    --    }

    use {
      "VonHeikemen/fine-cmdline.nvim",
      requires = {
        {"MunifTanjim/nui.nvim"}
      },
      config = function()
        require("fine-cmdline").setup(
          {
            cmdline = {
              enable_keymaps = true,
              smart_history = true
            },
            popup = {
              relative = "editor",
              position = {
                row = "30%",
                col = "50%"
              },
              size = "40%",
              border = {
                style = "rounded",
                highlight = "String"
              }
            }
          }
        )
      end
    }

    use {
      "VonHeikemen/searchbox.nvim",
      requires = {
        {"MunifTanjim/nui.nvim"}
      },
      config = function()
        require("searchbox").setup(
          {
            popup = {
              relative = "editor",
              position = {
                row = "30%",
                col = "50%"
              },
              size = "40%",
              win_options = {
                winhighlight = "Normal:Normal"
              },
              border = {
                style = "rounded",
                highlight = "String"
              }
            }
          }
        )
      end
    }

    use {
      "nvim-neorg/neorg",
      tag = "latest",
      config = function()
        local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

        parser_configs.norg = {
          install_info = {
            url = "https://github.com/nvim-neorg/tree-sitter-norg",
            files = {"src/parser.c", "src/scanner.cc"},
            branch = "main"
          }
        }

        parser_configs.norg_meta = {
          install_info = {
            url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
            files = {"src/parser.c"},
            branch = "main"
          }
        }

        parser_configs.norg_table = {
          install_info = {
            url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
            files = {"src/parser.c"},
            branch = "main"
          }
        }

        require("neorg").setup {
          -- Tell Neorg what modules to load
          load = {
            ["core.defaults"] = {}, -- Load all the default modules
            ["core.norg.concealer"] = {
              config = {
                markup_preset = "brave"
              }
            }, -- Allows for use of icons
            ["core.norg.dirman"] = {
              -- Manage your directories with Neorg
              config = {
                workspaces = {
                  my_workspace = "~/neorg",
                  GTD = "~/norg/GTD"
                }
              }
            },
            ["core.norg.completion"] = {
              config = {
                engine = "nvim-cmp"
              }
            },
            ["core.keybinds"] = {
              -- Configure core.keybinds
              config = {
                default_keybinds = true, -- Generate the default keybinds
                neorg_leader = "<Leader>o" -- This is the default if unspecified
              }
            },
            ["core.integrations.telescope"] = {}, -- Enable the telescope module
            ["core.gtd.base"] = {
              config = {
                workspace = "GTD"
              }
            }
          }
        }
      end,
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-neorg/neorg-telescope"
      }
    }

    use {
      "petertriho/nvim-scrollbar",
      config = function()
        require("scrollbar").setup(
          {
            show = true,
            handle = {
              text = " ",
              color = "gray",
              hide_if_all_visible = true -- Hides handle if all lines are visible
            },
            handlers = {
              diagnostic = true,
              search = true -- Requires hlslens to be loaded
            }
          }
        )

        require("scrollbar.handlers.search").setup()
      end,
      requires = "kevinhwang91/nvim-hlslens"
    }

    use {
      "sidebar-nvim/sidebar.nvim",
      config = function()
        require("sidebar-nvim").setup(
          {
            open = false,
            side = "left",
            initial_width = 40,
            hide_statusline = false,
            update_interval = 1000,
            sections = {"git", "diagnostics", "symbols", "files"},
            section_separator = "-----",
            containers = {
              attach_shell = "/bin/sh",
              show_all = true,
              interval = 5000
            },
            datetime = {format = "%a %b %d, %H:%M", clocks = {{name = "local"}}},
            todos = {ignored_paths = {"~"}},
            disable_closing_prompt = false
          }
        )
      end
    }

    use {
      "mhartington/formatter.nvim",
      config = function()
        local prettier = function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.fn.shellescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
            stdin = true
          }
        end

        require("formatter").setup(
          {
            filetype = {
              css = {prettier},
              scss = {prettier},
              html = {prettier},
              javascript = {prettier},
              javascriptreact = {prettier},
              typescript = {prettier},
              typescriptreact = {prettier},
              markdown = {prettier},
              json = {prettier},
              jsonc = {prettier},
              yaml = {prettier},
              yml = {prettier},
              lua = {
                function()
                  return {
                    exe = "luafmt",
                    args = {"--indent-count", 2, "--stdin"},
                    stdin = true
                  }
                end
              },
              go = {
                -- goimport
                function()
                  return {
                    exe = "goimports",
                    args = {"-w", vim.api.nvim_buf_get_name(0)},
                    stdin = false
                  }
                end
              },
              python = {
                function()
                  return {
                    exe = "python3 -m autopep8",
                    args = {
                      "--in-place --aggressive --aggressive",
                      vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
                    },
                    stdin = false
                  }
                end
              }
            }
          }
        )

        vim.api.nvim_exec(
          [[
            augroup FormatAutogroup
              autocmd!
              autocmd BufWritePost *.go,*.lua,*.py FormatWrite
            augroup END
            ]],
          true
        )
      end
    }

    use {
      "j-hui/fidget.nvim",
      config = function()
        require "fidget".setup {}
      end
    }

    use(
      {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
          require("lsp_lines").register_lsp_virtual_lines()
          -- Disable virtual_text since it's redundant due to lsp_lines.
          vim.diagnostic.config(
            {
              virtual_text = false
            }
          )
        end
      }
    )
  end
)
