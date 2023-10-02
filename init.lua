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
vim.g.netrw_banner = 0
vim.cmd("set noswapfile")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
vim.cmd("set hidden")
vim.cmd("set signcolumn=yes")
vim.cmd("set conceallevel=2")
vim.cmd("set concealcursor=n")

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
vim.keymap.set({ "n", "x" }, "x", '"_x', { noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "X", '"_X', { noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "c", '"_c', { noremap = true, silent = true })
vim.keymap.set({ "n", "x" }, "C", '"_C', { noremap = true, silent = true })

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

-- do not copy text to clipboard when deleting empty line
vim.keymap.set({ "n" }, "dd", function()
	if vim.api.nvim_get_current_line():match("^%s*$") then
		return '"_dd'
	end

	return "dd"
end, { expr = true, noremap = false, silent = true })

-- move over wrapped lines
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })

function KittyBufferHistoryClean()
	vim.cmd("set nomodifiable")
	vim.cmd("set noconfirm")
	vim.cmd("set nonu")
	vim.cmd("silent! %s/\\e\\[[0-9:;]*m//g")
	vim.cmd("silent! %s/[^[:alnum:][:punct:][:space:]]//g")
	vim.cmd("silent! %s/\\e\\[[^\\s]*\\s//g")
	vim.cmd("silent! %s/\\s*$//")
	vim.cmd('let @/ = ""')
	vim.cmd("cnoremap q q!")
end

vim.cmd("command KittyScrollback lua KittyBufferHistoryClean()")

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- local format_cmd_id = vim.api.nvim_create_autocmd("BufWritePre", {
-- 	group = augroup,
-- 	callback = function()
-- 		vim.lsp.buf.format()
-- 	end,
-- })

local format_cmd_id = -2
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- local function toggle_autoformat()
-- 	if format_cmd_id < 0 then
-- 		if format_cmd_id == -1 then
-- 			require("notify")("Auto format enabled")
-- 		end
-- 		vim.api.nvim_clear_autocmds({ group = augroup })
-- 		format_cmd_id = vim.api.nvim_create_autocmd("BufWritePre", {
-- 			group = augroup,
-- 			callback = function()
-- 				vim.lsp.buf.format()
-- 			end,
-- 		})
-- 	else
-- 		vim.api.nvim_del_autocmd(format_cmd_id)
-- 		format_cmd_id = -1
-- 		require("notify")("Auto format disabled")
-- 	end
-- end

-- toggle_autoformat()

-- vim.keymap.set({ "n", "x" }, "<leader>tf", toggle_autoformat, { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "J", "2<C-e>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "K", "2<C-y>", { noremap = true, silent = true })
