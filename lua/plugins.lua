-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]


vim.cmd[[augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end]]

return require('packer').startup(
  function(use)

    -- Packer
    use 'wbthomason/packer.nvim'
    use {"nvim-lua/popup.nvim", opt = true}

    -- LSP
    use {"neovim/nvim-lspconfig", opt = false}
    use {
        "kabouzeid/nvim-lspinstall",
        opt = false,
    }
    use { "ray-x/lsp_signature.nvim" , opt = false }
    use {"ahmedkhalf/lsp-rooter.nvim", opt = false }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
	requires = { 'nvim-lua/plenary.nvim' },
	config = function()
		require('telescope').setup{
                    -- file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
                    defaults = {
                        layout_config = {
                            bottom_pane = {
                                height = 50,
                                prompt_position = "top"
                            },
                        },
                        -- winblend = 10
                    },
                    pickers = {
                        find_files = {
                            theme = "dropdown",

                        },
                        live_grep = {
                            theme = "ivy",
                        }
                    },
                }
                vim.api.nvim_exec(
                  [[
                  highlight TelescopeSelection      guibg=bg gui=bold
                  highlight TelescopeNormal         guibg=#00000
                  highlight TelescopeBorder         guifg=#00ff00
                  highlight TelescopePromptBorder   gui=bold
                  highlight TelescopeResultsBorder  gui=bold
                  highlight TelescopePreviewBorder  guifg=#ffffff
                  ]], false)
	end,
    }

    -- Color and visuals
    use {'embark-theme/vim', opt = true}
    use {"mcchrish/zenbones.nvim"}
    use {
            "Shatur/neovim-ayu"
    }

    use {
        'kyazdani42/nvim-web-devicons',
        opt = false,
        config = function()
            require'nvim-web-devicons'.setup{
                default = true
            }
        end
    }

    -- Keymappings
    use { "folke/which-key.nvim", opt = false}

    -- Buffers
    use {
	'akinsho/bufferline.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
	config = function()
		require('bufferline').setup {
		  options = {
			show_close_icon = false,
			show_buffer_icons = false,
			max_name_length = 18,
			always_show_bufferline = false,
			close_icon = '',
                        highlights = {
                        buffer_selected = {
                            guifg = "#282828",
                            guibg = "#a89984",
                            gui = "bold"
                        },
                    },
		  },
		}

	end,
    }

    -- Tree file explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        opt = false,
        config = function()
            require'nvim-tree'.setup {
                auto_close = true,
                update_cwd = true,
                view = {
                    auto_resize = true
                },
            }
        end
    }

    -- Note taking
    use {
            "vimwiki/vimwiki",
            opt = false,
            config = function()
                vim.cmd[[let g:vimwiki_key_mappings = { 'all_maps': 0, }]]
            end
        }

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = "maintained",
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true
                },
        }
        end
    }

    -- Navigation
    use {
        'karb94/neoscroll.nvim',
        opt = false,
        config = function()
            require('neoscroll').setup({
               -- easing_function = "circular",
            })
            local t = {}
            -- Syntax: t[keys] = {function, {function arguments}}
            t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '200'}}
            t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '200'}}
            t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '450'}}
            t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450'}}
            t['<C-y>'] = {'scroll', {'-0.10', 'false', '100'}}
            t['<C-e>'] = {'scroll', { '0.10', 'false', '100'}}
            t['zt']    = {'zt', {'150'}}
            t['zz']    = {'zz', {'150'}}
            t['zb']    = {'zb', {'150'}}
            require('neoscroll.config').set_mappings(t)

        end
    }

    use {
        "phaazon/hop.nvim",
        opt = false,
        config = function()
            require'hop.highlight'.insert_highlights()
        end
    }

    -- Snippets
    use { "L3MON4D3/LuaSnip" }

    -- Completion
        --
    use {
        'hrsh7th/nvim-cmp',
	requires = {
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-path'
        },
        opt = false,
        config = function()
            vim.api.nvim_exec([[set pumheight=10]], false)
            local cmp = require('cmp')
            cmp.setup({
                preselect = cmp.PreselectMode.None,

                snippet = {
                    expand = function(args)
                        require'luasnip'.lsp_expand(args.body)
                    end
                },

                completion = {
                    autocomplete = false,
                    completion = {
                        completeopt = 'menu,menuone,noinsert',
                    }

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
                    }
                },

                mapping = {
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-1),
                    ['<C-d>'] = cmp.mapping.scroll_docs(1),
                    ['<ESC>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
                    ['<TAB>'] = function(fallback)
                        local col = vim.fn.col('.') - 1
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                            fallback()
                        else
                            cmp.complete()
                        end
                    end,
                    ['<S-TAB>'] = function(fallback)
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
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'path' },
                    { name = 'cmp-nvim-lua' },
                    -- { name = 'emoji' },
                    -- { name = 'vsnip' },
                    }, {
                    { name = 'buffer' },
                    }),

                    experimental = {
                        ghost_text = true,
                    },
            })
        end
    }

    -- Git
    use { 'tpope/vim-fugitive'}
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('gitsigns').setup{
                signcolumn = false,
                numhl      = false,
                linehl     = false,
                word_diff  = false,

            }
        end
    }


    -- Code comments
    use {
        "terrortylor/nvim-comment",
        opt = false,
        config = function()
            require('nvim_comment').setup(
                    {
                        create_mappings = false,
                        operator_mapping = "gc",

                    }
            )
        end
    }

    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup{}
        end
    }

    -- Status line
    use {
        'famiu/feline.nvim',
        opt = false,
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
              ]], false)

        end
    }

    -- wildmenu
    use {
        "gelguy/wilder.nvim",
        run = ":UpdateRemotePlugins",
        requires = {'romgrk/fzy-lua-native'},
        config = function()
            -- call wilder#setup({'modes': [':', '/', '?']})
            vim.api.nvim_exec([[

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
        ]], false)
        end
    }


    -- dashboard
    use {
        "karlc1/dashboard-nvim",
        opt = false,
        config = function()
            vim.g.dashboard_custom_header = {
                '',
                '   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆               ',
                '    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦             ',
                '          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄           ',
                '           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄          ',
                '          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀         ',
                '   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄        ',
                '  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄         ',
                ' ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄        ',
                ' ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄       ',
                '      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆           ',
                '       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃           ',
                '     ⢰⣶  ⣶ ⢶⣆⢀⣶⠂⣶⡶⠶⣦⡄⢰⣶⠶⢶⣦  ⣴⣶           ',
                '     ⢸⣿⠶⠶⣿ ⠈⢻⣿⠁ ⣿⡇ ⢸⣿⢸⣿⢶⣾⠏ ⣸⣟⣹⣧          ',
                '     ⠸⠿  ⠿  ⠸⠿  ⠿⠷⠶⠿⠃⠸⠿⠄⠙⠷⠤⠿⠉⠉⠿⠆         ',
                }
            vim.g.dashboard_default_executive = 'telescope'
            -- vim.g.dashboard_preview_command = 'cat'
            -- vim.g.dashboard_preview_pipeline = 'lolcat'
            vim.g.dashboard_custom_footer = {''}
            vim.g.dashboard_custom_section = {

                a = {description = {'    Find File          '}, command = 'lua require\'telescope.builtin\'.find_files(require(\'telescope.themes\').get_dropdown({ winblend = 0, previewer=false, layout_config = { height= 100 } }))'},
                b = {description = {'    Recent Files       '}, command = 'Telescope oldfiles'},
                c = {description = {'    Find Word          '}, command = 'Telescope live_grep'},
                d = {description = {'  ✎  Nvim Config        '}, command = ':cd ~/.config/nvim | :e init.lua'},
                e = {description = {'  ✎  Plugin Config      '}, command = ':cd ~/.config/nvim | :e lua/plugins.lua'},
                f = {description = {'  ✎  Keymapping Config  '}, command = ':cd ~/.config/nvim | :e lua/keymappings.lua'},
            }
            vim.cmd[[autocmd FileType dashboard setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs=  | autocmd WinLeave <buffer> set showtabline=2 ]]

            vim.cmd[[hi! link dashboardHeader String]]
            vim.cmd[[hi! link dashboardCenter Type]]


        end
    }

    -- debugging
    use {
        'mfussenegger/nvim-dap',
        opt = false,
        config = function()
            -- setup highlights for debug symbols
            vim.cmd[[exec 'hi DebugBreakpoint guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('Error'),'fg')]]
            vim.cmd[[exec 'hi DebugStopped guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('WarningMsg'),'fg')]]
            vim.fn.sign_define('DapBreakpoint', {text='⊚', texthl='DebugBreakpoint', linehl='', numhl=''})
            vim.fn.sign_define('DapStopped', {text='→', texthl='DebugStopped', linehl='Visual', numhl=''})
        end
    }

    use {
        'leoluz/nvim-dap-go',
        opt = false,
        config = function()
            require('dap-go').setup()
        end
    }

    use {
        'rcarriga/nvim-dap-ui',
        opt = false,
        config = function()
            require("dapui").setup({
                sidebar = {
                    -- You can change the order of elements in the sidebar
                    elements = {
                      -- Provide as ID strings or tables with "id" and "size" keys
                        {
                            id = "scopes",
                            size = 0.65, -- Can be float or integer > 1
                        },
                        { id = "breakpoints", size = 0.35 },
                    },
                    size = 60,
                    position = "left", -- Can be "left", "right", "top", "bottom"
                },
                windows = { indent = 1 },
            })
        end
    }

    use {
        'theHamsta/nvim-dap-virtual-text',
        opt = false,
        -- config = function()
        --     vim.g.dap_virtual_text = true
        -- end
    }

    -- stabilize window
    use {
	'luukvbaal/stabilize.nvim',
	config = function() require("stabilize").setup() end
    }

    -- mini plugins
        --
    use {
        'echasnovski/mini.nvim',
        required = true,
        config = function()
            require('mini.bufremove').setup({})
        end
    }

    -- diagnostics (defer diagnostics when not in normal mode)
    use {
        'https://gitlab.com/yorickpeterse/nvim-dd',
        required = true,
        config = function()
            require('dd').setup({timeout = 250})
        end
    }

    -- plantuml
    use { 'aklt/plantuml-syntax' }

    use {
        "folke/twilight.nvim",
        config = function()
            require("twilight").setup {
                context = 100,
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
                    relativenumber = false,
                },
            },
            plugins = {
                twilight = { enabled = false }
            }
        }
    end
}



  end
)
