-- configure mapleader before loading plugins
vim.g.mapleader = " "

-- bootstrap plugin manager if needed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- load plugins
require("lazy").setup("plugins", {
	change_detection = {
		enabled = false,
		notify = false,
	},
})

-- general options
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.number = true
vim.opt.virtualedit = "all"
vim.opt.laststatus = 3
vim.opt.cmdheight = 0
vim.cmd("set noswapfile")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
vim.cmd("set hidden")

-- persistent undo history
-- vim.opt.undofile = true
-- NOT WORKING BELOW
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undofile"
-- vim.opt.undolevels = 1000
-- vim.opt.undoreload = 10000

-- yank to clipboard
vim.api.nvim_set_option("clipboard", "unnamed")

-- Navigate splits withuot pressing <C-w> first
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })

-- clear highlight on esc
vim.keymap.set("n", "<Esc>", "<cmd>noh<cr><Esc>", { noremap = true, silent = true })

-- highlight yanked text
local highlight_yank = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	command = 'silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=150}',
	group = highlight_yank,
})

-- do not jump when highlighting with '*'
vim.cmd("nnoremap <silent> * :let @/ = '<c-r><c-w>' \\| set hlsearch<cr>")

-- set indentation settings
vim.cmd([[autocmd Filetype * setlocal tabstop=4 shiftwidth=4 expandtab]])

-- Make multiline indentation repeatable
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- indent to correct position when entering insert mode
vim.cmd([[
	function! IndentWithI()
		if charcol('.') > len(getline('.'))
			return "A"
		elseif len(getline('.')) == 0
			return "\"_cc"
		else
			return "i"
		endif
	endfunction
	nnoremap <expr> i IndentWithI()
]])

-- disable copying deleted text using c or x
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })
vim.keymap.set("v", "x", '"_x', { noremap = true, silent = true })
vim.keymap.set("n", "X", '"_X', { noremap = true, silent = true })
vim.keymap.set("v", "X", '"_X', { noremap = true, silent = true })
vim.keymap.set("n", "c", '"_c', { noremap = true, silent = true })
vim.keymap.set("v", "c", '"_c', { noremap = true, silent = true })
vim.keymap.set("n", "C", '"_C', { noremap = true, silent = true })
vim.keymap.set("v", "C", '"_C', { noremap = true, silent = true })

-- make currnent line number highlighted
vim.cmd([[
	set cursorline
	highlight clear CursorLine
]])

-- follow links in help files with 'gd'
vim.api.nvim_create_autocmd("FileType", {
	desc = "Set keymap in help files to follow links with 'gd'",
	pattern = { "help" },
	callback = function(opts)
		vim.keymap.set("n", "gd", "<C-]>", { silent = true, buffer = opts.buf })
	end,
})
