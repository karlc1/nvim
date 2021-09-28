
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


    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
	requires = { 'nvim-lua/plenary.nvim' },
	config = function()
		require('telescope').setup{
                    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
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
    use {"kyazdani42/nvim-web-devicons", opt = true}

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
                view = {
                    auto_resize = true
                },
            }
        end
    }

    -- Note taking
    use {"vimwiki/vimwiki", opt = false}

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
        }
        end
    }

    -- Navigation
    use {
        'karb94/neoscroll.nvim',
        opt = false,
        config = function()
            require('neoscroll').setup()
            local t = {}
            -- Syntax: t[keys] = {function, {function arguments}}
            t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '250'}}
            t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '250'}}
            t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '450'}}
            t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450'}}
            t['<C-y>'] = {'scroll', {'-0.10', 'false', '100'}}
            t['<C-e>'] = {'scroll', { '0.10', 'false', '100'}}
            t['zt']    = {'zt', {'250'}}
            t['zz']    = {'zz', {'250'}}
            t['zb']    = {'zb', {'250'}}
            require('neoscroll.config').set_mappings(t)

        end
    }

    -- Completion
    use {
        'hrsh7th/nvim-cmp',
	requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
        },
        opt = false,
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                preselect = cmp.PreselectMode.None,
                completion = {
                    autocomplete = false,
                    completion = {
                        completeopt = 'menu,menuone,noinsert',
                    }

                },
                sorting = {
                    comparators = {
                        cmp.config.compare.exact,
                        cmp.config.compare.score,
                        cmp.config.compare.length,
                        cmp.config.compare.offset,
                        cmp.config.compare.kind,
                        -- cmp.config.compare.sort_text,
                        cmp.config.compare.order,
                    }
                },
                mapping = {
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
                    ['<TAB>'] = function(fallback)
                        local col = vim.fn.col('.') - 1
                        if vim.fn.pumvisible() == 1 then
                            cmp.select_next_item()
                        elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                            fallback()
                        else
                            cmp.complete()
                        end
                    end,
                    ['<S-TAB>'] = function(fallback)
                        if vim.fn.pumvisible() == 1 then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end
                },
                sources = {
                    { name = 'nvim_lsp' },
                 -- { name = 'buffer' },
                }
            })
        end
    }

  end
)
