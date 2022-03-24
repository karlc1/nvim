vim.o.termguicolors = true

require("plugins")
require("keymappings")
require("lsp")
require("statusline")
require("snippets")
-- LSP
-- require('lsp.go')
--

vim.cmd("colorscheme embark")

-- vim.o.splitbelow = true
-- vim.o.splitright = true

vim.opt.splitbelow = true
vim.opt.splitright = true

-- vim.bo.smartindent = false
-- vim.o.smartindent = false
-- vim.bo.autoindent = false
-- vim.o.autoindent = false
--
-- vim.o.smarttab = true
-- vim.wo.signcolumn = "yes"

vim.opt.smarttab = true
vim.opt.signcolumn = "yes"

vim.cmd("set ignorecase")
vim.cmd("set smartcase")
-- vim.wo.number = true
vim.cmd("set noswapfile")
vim.cmd("set cmdheight=1")

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	update_in_insert = false,
	severity_sort = false,
})

-- Set space as leader
vim.g.mapleader = " "

print(vim.bo.filetype)

-- Wrap long lines, but don't break in middle of words
vim.cmd("set wrap linebreak nolist")
vim.cmd("set breakindent")

-- Equalize splits on resize
vim.cmd("autocmd VimResized * wincmd =")

-- automatically reload on file change
vim.cmd([[
set autoread
au CursorHold * checktime
]])

-- Highlight current line, but only in the line number
vim.api.nvim_exec(
	[[
    set cursorline
    highlight clear CursorLine
    highlight clear CursorLineNr

    hi Keyword gui=bold
    " hi Function gui=bold


    " apply changes if colorscheme is changed on the fly
    augroup MyColors
    autocmd!
    autocmd ColorScheme * highlight clear CursorLine
                      \ | highlight clear CursorLineNr
                      \ | hi Keyword gui=bold
                     " \ | hi Function gui=bold
    augroup END

]],
	false
)

-- Indent to correct position when entering insert mode
vim.cmd([[function! IndentWithI()
    if len(getline('.')) == 0
        return "\"_cc"
    else
        return "i"
    endif
endfunction
nnoremap <expr> i IndentWithI()]])

-- Switch to US keyboard layout when typing swedish
-- chars in normal mode that doesn't make sense
vim.cmd('nmap Ö :silent exec "! setxkbmap us &" <CR>:')
vim.cmd('nmap - :silent exec "! setxkbmap us &" <CR>/')
vim.cmd('nmap ¤ :silent exec "! setxkbmap us &" <CR>$')

-- Set indentation levels
-- vim.cmd([[autocmd FileType * setlocal shiftwidth=4 softtabstop=4 expandtab]])
-- vim.cmd([[autocmd FileType go setlocal shiftwidth=8 softtabstop=8 expandtab]])
vim.cmd([[autocmd Filetype * setlocal tabstop=4 shiftwidth=4 expandtab]])
vim.cmd([[autocmd Filetype go setlocal tabstop=4 shiftwidth=4 expandtab]])

-- Make indentation repeatable
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- Highlight yanked text
local highlight_yank = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	command = 'silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=150}',
	group = highlight_yank,
})

-- Hide tilde characters on empty lines
vim.api.nvim_exec(":hi NonText guifg=bg", false)

-- Yank to system clipboard
vim.cmd("set clipboard=unnamedplus")

-- No not copy text when deleting with 'x' or 'c'
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "x", '"_x', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('x', 'x', '"_x', {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "c", '"_c', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "c", '"_c', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('x', 'c', '"_c', {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "C", '"_C', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "C", '"_C', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('x', 'C', '"_C', {noremap = true, silent = true})

-- Workarund for snippet jumping/select
vim.api.nvim_set_keymap("s", "C", "C", { noremap = false, silent = true })
vim.api.nvim_set_keymap("s", "c", "c", { noremap = false, silent = true })
vim.api.nvim_set_keymap("s", "X", "X", { noremap = false, silent = true })
vim.api.nvim_set_keymap("s", "x", "x", { noremap = false, silent = true })

-- Fix pum dropdown
-- vim.api.nvim_exec([[
--    set completeopt=menu,menuone,noselect
-- ]], false)

-- Do not jump when highlighting with '*'
vim.cmd("nnoremap <silent> * :let @/ = '<c-r><c-w>' \\| set hlsearch<cr>")

-- source colors (replace with lua once nvim supports it)
vim.cmd("source ~/.config/nvim/vimscript/colors.vim")
