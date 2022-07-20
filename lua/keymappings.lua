local wk = require("which-key")

-- yank with yanky
vim.keymap.set("n", "p", "<Plug>(YankyPutAfter)", {})
vim.keymap.set("n", "P", "<Plug>(YankyPutBefore)", {})
vim.keymap.set("x", "p", "<Plug>(YankyPutAfter)", {})
vim.keymap.set("x", "P", "<Plug>(YankyPutBefore)", {})
vim.keymap.set("n", "gp", "<Plug>(YankyGPutAfter)", {})
vim.keymap.set("n", "gP", "<Plug>(YankyGPutBefore)", {})
vim.keymap.set("x", "gp", "<Plug>(YankyGPutAfter)", {})
vim.keymap.set("x", "gP", "<Plug>(YankyGPutBefore)", {})

vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)", {})
vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)", {})


-- Hop to char with 's'
vim.api.nvim_set_keymap("n", "s", ":HopChar1<CR>", { noremap = true, silent = true })

-- vim.api.nvim_set_keymap("n", "S", ":HopPatternMW<CR>", { noremap = true, silent = true })

-- Cycle and kill buffers
vim.api.nvim_set_keymap("n", "H", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "L", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "X", ": lua MiniBufremove.delete()<cr>", { noremap = true, silent = true })

-- Navigate splits withuot pressing <C-w> first
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })

-- Search and replace visual selection
-- vim.api.nvim_set_keymap("v", "<C-r>", '"hy:%s/<C-r>h//g<left><left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-r>", '"hy:%s/<C-r>h//gc<left><left><left>', { noremap = true, silent = true })

-- same as above with confirm prompt
-- vim.api.nvim_set_keymap(
-- 	"v",
-- 	"<C-r>",
-- 	'"hy:%s/<C-r>h//gc|norm``<left><left><left><left><left><left><left><left><left><left>',
-- 	{ noremap = true, silent = true }
-- )

-- vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

-- Scroll on J and K without moving cursor
vim.api.nvim_set_keymap("n", "J", "1<C-e>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "K", "1<C-y>", { noremap = true, silent = true })

-- scroll with wheel and arrows
vim.api.nvim_set_keymap("n", "<Down>", "1<C-e>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Up>", "1<C-y>", { noremap = true, silent = true })

-- Disable highlight on <ESC>
vim.api.nvim_set_keymap("n", "<ESC>", ":noh<ESC>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<C-l>", ":echo 'apa'<CR>", { noremap = false, silent = true })

-- move over wrapped lines
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })

-- Use find-cmdline plugin for ex commands
-- vim.api.nvim_set_keymap('n', ';', '<cmd>FineCmdline<CR>', {noremap = false})

-- vim.api.nvim_set_keymap('n', '?', ':Telescope current_buffer_fuzzy_find<cr>', {noremap = false})

-- Jump to snippet locations
-- vim.api.nvim_set_keymap(
--   "i",
--   "<C-l>",
--   "<cmd>lua require('luasnip').jump(1)<Cr> | echo 'apa'<cr>",
--   {noremap = true, silent = true}
-- )
vim.api.nvim_set_keymap("s", "<C-l>", "<cmd>lua require('luasnip').jump(1)<Cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-h>", "<cmd>lua require('luasnip').jump(-1)<Cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"s",
	"<C-h>",
	"<c<Plug>(leap-cross-window)`md>lua require('luasnip').jump(-1)<Cr>",
	{ noremap = true, silent = true }
)

-- vim.api.nvim_set_keymap("n", "s", "<Plug>(leap-omni)", { noremap = false, silent = false })

vim.keymap.set({ "i", "s" }, "<C-l>", function()
	if require("luasnip").expand_or_jumpable() then
		require("luasnip").jump(1)
		return ""
	else
		return "<Right>"
	end
end, { expr = true })

vim.keymap.set({ "i", "s" }, "<C-h>", function()
	if require("luasnip").expand_or_jumpable() then
		require("luasnip").jump(-1)
		return ""
	else
		return "<Left>"
	end
end, { expr = true })

vim.keymap.set({ "n" }, "T", function()
	local r, c = unpack(vim.api.nvim_win_get_cursor(0))
	print(r, c)
	vim.api.nvim_exec([[set pumheight=10]], true)
end, { expr = false })

-- Normal leader keymaps
wk.register({

	n = { ":set nu! <CR>", "Toggle numbers" },
	m = { ":ScrollbarToggle <CR>", "" },

	s = {
		name = "Search",
		s = {
			function()
				require("telescope.builtin").lsp_document_symbols()
			end,
			"Search doc symbol",
		},
		S = {
			function()
				require("telescope.builtin").lsp_workspace_symbols()
			end,
			"Search workspace symbol",
		},
		r = {
			function()
				require("telescope.builtin").resume()
			end,
			"Resume last search",
		},
		w = {
			function()
				require("telescope.builtin").grep_string()
			end,
			"Search word under cursor",
		},
		t = {
			function()
				require("telescope.builtin").live_grep()
			end,
			"Search any text",
		},
	},
	f = {
		function()
			require("telescope.builtin").find_files()
		end,
		"Find files",
	},
	F = {
		function()
			require("telescope.builtin").find_files({ hidden = true })
		end,
		"Find files including hidden",
	},
	W = { ":VimwikiIndex<CR>", "Open VimWIki" },
	e = { ":Neotree<CR>", "Open Tree View" },
	c = { ":CommentToggle<CR>", "Toggle comment" },
	w = { ":w <cr>", "Write file" },
	z = {
		function()
			require("zen-mode").toggle()
			vim.cmd("ScrollbarToggle")
		end,
		"Zen Mode",
	},
	t = {
		name = "Test and terminal",
		-- t = { ": ToggleTerm<CR>", "Toggle terminal" },
		n = {
			function()
			require("neotest").run.run()
			end,
			"Test nearest",
		},
		f = {
			function()
			require("neotest").run.run(vim.fn.expand("%"))
		end,
			"Test file",
		},
		s = {
			function()
			require("neotest").summary.toggle()
		end,
			"Toggle summary",
		},
		o = {
			function()
			require("neotest").output.open({ enter = true })
		end,
			"Show test output",
		},
	},
	d = {
		name = "Debug and diagnostics",
		-- debug
		b = {
			function()
				require("dap").toggle_breakpoint()
			end,
			"Toggle breakpoint",
		},
		c = {
			function()
				require("dap").continue()
			end,
			"Continue",
		},
		o = {
			function()
				require("dap").step_over()
			end,
			"Step over",
		},
		O = {
			function()
				require("dap").step_out()
			end,
			"Step out",
		},
		i = {
			function()
				require("dap").step_into()
			end,
			"Step into",
		},
		r = {
			function()
				require("dap").run_last()
			end,
			"Run last",
		},
		u = {
			function()
				require("dapui").toggle()
			end,
			"Toggle UI",
		},
		t = {
			function()
				require("dap-go").debug_test()
			end,
			"Debug test",
		},
		h = {
			function()
				require("dapui").eval()
			end,
			"Hover variable",
		},
		-- diagnostics
		n = {
			function()
				vim.diagnostic.goto_next({ popup_opts = { focusable = false, border = "rounded" } })
			end,
			"Next diagnostics",
		},
		p = {
			function()
				vim.diagnostic.goto_prev({ popup_opts = { focusable = false, border = "rounded" } })
			end,
			"Prev diagnostics",
		},
		l = {
			function()
				require("telescope.builtin").diagnostics({ bufnr = 0 })
			end,
			"List doc diagnostics",
		},
		L = {
			function()
				require("telescope.builtin").diagnostics()
			end,
			"List all buffers diagnostics",
		},
	},
}, { prefix = "<leader>" })

-- Visual leader keymaps
wk.register({
	c = { ":CommentToggle<CR>", "Toggle comment" },
}, { prefix = "<leader>", mode = "v" })

wk.register({
	d = {
		function()
			vim.lsp.buf.definition()
		end,
		"Go to definition",
	},
	s = {
		function()
			vim.cmd("sp")
			vim.lsp.buf.definition()
		end,
		"Go do def in split",
	},
	v = {
		function()
			vim.cmd("vsp")
			vim.lsp.buf.definition()
		end,
		"Go to dev in vsplit",
	},
	r = {
		function()
			require("telescope.builtin").lsp_references()
		end,
		"Go to references",
	},
	i = {
		function()
			require("telescope.builtin").lsp_implementations()
		end,
		"Go to implementations",
	},
	h = {
		function()
			vim.lsp.buf.hover()
		end,
		"Hover docs",
	},
	T = {
		function()
			vim.lsp.buf.type_definition()
		end,
		"Hover docs",
	},
	I = {
		function()
			vim.lsp.buf.incoming_calls()
		end,
		"Incoming calls",
	},
	O = {
		function()
			vim.lsp.buf.outgoing_calls()
		end,
		"Incoming calls",
	},
	R = {
		function()
			vim.lsp.buf.rename()
		end,
		"Rename",
	},
}, { prefix = "g", mode = "n" })
