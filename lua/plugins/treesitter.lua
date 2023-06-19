return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = "all",
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		})
		vim.cmd("set foldmethod=expr")
		vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
		vim.cmd("set nofoldenable")

		-- interpret tfvar files as normal terraform files in highlighting
		vim.cmd("autocmd BufNewFile,BufRead *.tfvars set ft=tf")
	end,
}
