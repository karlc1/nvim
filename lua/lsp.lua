local mason = require("mason")
local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local util = require("lspconfig.util")

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_lspconfig.setup({
	ensure_installed = {
		"gopls",
		"lua_ls",
		-- "bashls",
		-- "jsonls",
	},
})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}

-- local navbuddy = require("nvim-navbuddy")


mason_lspconfig.setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			-- on_attach = function(client, bufnr)
			-- 	navbuddy.attach(client, bufnr)
			-- end
		})
	end,

	-- Next, you can provide targeted overrides for specific servers.
	--
	["lua_ls"] = function()
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
						path = vim.split(package.path, ";"),
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
						},
						maxPreload = 10000,
					},
				},
			},
		})
	end,

	["yamlls"] = function()
		local cfg = require("yaml-companion").setup({
			schemas = {
				result = {
					{
						name = "OpenApi 3.0.X",
						uri = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.json",
					},
				},
			},
			lspconfig = {
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
							"!FindInMap sequence",
							"!Base64",
							"!Cidr",
							"!Ref",
							"!Ref Scalar",
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
			},
		})
		lspconfig.yamlls.setup(cfg)

		-- lspconfig.yamlls.setup({
		-- 	capabilities = capabilities,
		-- 	settings = {
		-- 		yaml = {
		-- 			hover = true,
		-- 			completion = true,
		-- 			customTags = {
		-- 				"!fn",
		-- 				"!And",
		-- 				"!If",
		-- 				"!Not",
		-- 				"!Equals",
		-- 				"!Or",
		-- 				"!FindInMap sequence",
		-- 				"!Base64",
		-- 				"!Cidr",
		-- 				"!Ref",
		-- 				"!Ref Scalar",
		-- 				"!Sub",
		-- 				"!GetAtt",
		-- 				"!GetAZs",
		-- 				"!ImportValue",
		-- 				"!Select",
		-- 				"!Select sequence",
		-- 				"!Split",
		-- 				"!Join sequence",
		-- 			},
		-- 		},
		-- 	},
		-- })
	end,
})

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
util.default_config = vim.tbl_extend("force", util.default_config, {
	autostart = false,
	capabilities = capabilities,
})

local pop_opts = { border = "rounded", max_width = 80 }
local handlers = vim.lsp.handlers
handlers["textDocument/hover"] = vim.lsp.with(handlers.hover, pop_opts)
handlers["textDocument/signatureHelp"] = vim.lsp.with(handlers.signature_help, pop_opts)

function OrgImports(wait_ms)
	local params = vim.lsp.util.make_range_params()
	params.context = { only = { "source.organizeImports" } }
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
	for _, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
			else
				vim.lsp.buf.execute_command(r.command)
			end
		end
	end
end

vim.cmd([[autocmd BufWritePre *.go lua OrgImports(1000)]])
