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
		"sumneko_lua",
		"bashls",
		"jsonls",
	},
})

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}

mason_lspconfig.setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
		})
	end,

	-- Next, you can provide targeted overrides for specific servers.
	["sumneko_lua"] = function()
		lspconfig.sumneko_lua.setup({
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
		lspconfig.yamlls.setup({
			capabilities = capabilities,
			settings = {
				yaml = {
					hover = true,
					completion = true,
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
						"!Split",
						"!Join sequence",
					},
				},
			},
		})
	end,
})

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
util.default_config = vim.tbl_extend("force", util.default_config, {
	autostart = false,
	capabilities = capabilities,
})

-- -- Language specific init options
-- local enhance_server_opts = {
-- 	["gopls"] = function(opts)
-- 		local lastrootpath = nil
--
-- 		local gopath = os.getenv("GOPATH")
-- 		if gopath == nil then
-- 			gopath = ""
-- 		end
-- 		local gopathmod = gopath .. "/pkg/mod"
--
-- 		opts.root_dir = function(fname)
-- 			local fullpath = vim.fn.expand(fname, ":p")
-- 			if string.find(fullpath, gopathmod) and lastrootpath ~= nil then
-- 				return lastrootpath
-- 			end
-- 			lastrootpath = require("lspconfig").util.root_pattern("go.mod", ".git")(fname)
-- 			return lastrootpath
-- 		end
-- 		opts.settings = { gopls = { analyses = { unusedparams = false }, staticcheck = false } }
-- 		opts.init_options = { usePlaceholders = true, completeUnimported = true }
-- 	end,
--
-- 	["sumneko_lua"] = function(opts)
-- 		opts.settings = {
-- 			Lua = {
-- 				runtime = {
-- 					version = "LuaJIT",
-- 					path = vim.split(package.path, ";"),
-- 				},
-- 				diagnostics = {
-- 					globals = { "vim" },
-- 				},
-- 				workspace = {
-- 					library = {
-- 						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
-- 						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
-- 					},
-- 					maxPreload = 10000,
-- 				},
-- 			},
-- 		}
-- 	end,
--
-- 	["graphql"] = function(opts)
-- 		opts.filetypes = { "graphql", "graphqls" }
-- 	end,
--
-- 	["yamlls"] = function(opts)
-- 		opts.settings = {
-- 			yaml = {
-- 				hover = true,
-- 				completion = true,
-- 				customTags = {
-- 					"!fn",
-- 					"!And",
-- 					"!If",
-- 					"!Not",
-- 					"!Equals",
-- 					"!Or",
-- 					"!FindInMap sequence",
-- 					"!Base64",
-- 					"!Cidr",
-- 					"!Ref",
-- 					"!Ref Scalar",
-- 					"!Sub",
-- 					"!GetAtt",
-- 					"!GetAZs",
-- 					"!ImportValue",
-- 					"!Select",
-- 					"!Split",
-- 					"!Join sequence",
-- 				},
-- 			},
-- 		}
-- 	end,
--
-- 	["pyright"] = function(opts)
-- 		opts.python = {
-- 			analysis = {
-- 				autoSearchPaths = true,
-- 				diagnosticMode = "workspace",
-- 				useLibraryCodeForTypes = true,
-- 			},
-- 		}
-- 	end,
-- }
--
-- -- Make hover doc popup look nicer
local pop_opts = { border = "rounded", max_width = 80 }
local handlers = vim.lsp.handlers
handlers["textDocument/hover"] = vim.lsp.with(handlers.hover, pop_opts)
handlers["textDocument/signatureHelp"] = vim.lsp.with(handlers.signature_help, pop_opts)
--
-- -- Make diagnostics signs nicer
-- -- local signs = { Error = "", Warn = "", Hint = "", Info = "" }
-- local signs = { Error = "", Warn = "", Hint = "", Info = "" }
-- for type, icon in pairs(signs) do
-- 	local hl = "DiagnosticSign" .. type
-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end
--
-- -- Global LSP capabilities
-- local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
-- 	properties = {
-- 		"documentation",
-- 		"detail",
-- 		"additionalTextEdits",
-- 	},
-- }
--
-- -- Run setup func each server installed with lsp-installer
-- require("nvim-lsp-installer").on_server_ready(function(server)
-- 	-- Set global options
-- 	local opts = {
-- 		on_attach = function(client, bufnr)
-- 			_ = bufnr
-- 			_ = client
-- 			-- client.resolved_capabilities.document_formatting = false
-- 			-- client.resolved_capabilities.document_range_formatting = false
-- 		end,
-- 		capabilities = capabilities,
-- 	}
--
-- 	-- Set language specific options
-- 	if enhance_server_opts[server.name] then
-- 		enhance_server_opts[server.name](opts)
-- 	end
--
-- 	server:setup(opts)
-- end)
--
-- ----------------------------------------------------------------------
-- -- local lsp = vim.lsp
-- -- local handlers = lsp.handlers
-- --
-- -- -- Hover doc popup
-- -- local pop_opts = { border = "rounded", max_width = 80 }
-- -- handlers["textDocument/hover"] = lsp.with(handlers.hover, pop_opts)
-- -- handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, pop_opts)
-- --
-- -- -- Global dir paths
-- -- DATA_PATH = vim.fn.stdpath("data")
-- -- CACHE_PATH = vim.fn.stdpath("cache")
-- --
-- -- -- local go_capabilities = vim.lsp.protocol.make_client_capabilities()
-- -- local go_capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- -- go_capabilities.textDocument.completion.completionItem.resolveSupport = {
-- -- 	properties = {
-- -- 		"documentation",
-- -- 		"detail",
-- -- 		"additionalTextEdits",
-- -- 	},
-- -- }
-- --
-- -- -- Register a handler that will be called for all installed servers.
-- -- -- Alternatively, you may also register handlers on specific server instances instead (see example below).
-- -- lsp_installer.on_server_ready(function(server)
-- -- 	local opts = {}
-- --
-- -- 	-- (optional) Customize the options passed to the server
-- -- 	-- if server.name == "tsserver" then
-- -- 	--     opts.root_dir = function() ... end
-- -- 	-- end
-- --
-- -- 	-- This setup() function is exactly the same as lspconfig's setup function.
-- -- 	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- -- 	server:setup(opts)
-- -- end)
-- --
-- -- -- Golang setup
-- -- require("lspconfig").gopls.setup({
-- -- 	-- capabilities = capabilities,
-- -- 	-- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
-- --
-- -- 	capabilities = go_capabilities,
-- -- 	on_attach = function(client, bufnr)
-- -- 		require("lsp_signature").on_attach(cfg)
-- -- 		client.resolved_capabilities.document_formatting = false
-- -- 		client.resolved_capabilities.document_range_formatting = false
-- -- 	end,
-- -- 	root_dir = require("lspconfig").util.root_pattern(".git", "go.mod"),
-- -- 	settings = { gopls = { analyses = { unusedparams = false }, staticcheck = false } },
-- -- 	init_options = { usePlaceholders = true, completeUnimported = true },
-- -- })
-- --
-- -- -- Lua setup
-- -- local sumneko_root_path = DATA_PATH .. "/lspinstall/lua"
-- -- local sumneko_binary = sumneko_root_path .. "/sumneko-lua-language-server"
-- --
-- -- require("lspconfig").sumneko_lua.setup({
-- -- 	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
-- -- 	settings = {
-- -- 		Lua = {
-- -- 			runtime = {
-- -- 				version = "LuaJIT",
-- -- 				path = vim.split(package.path, ";"),
-- -- 			},
-- -- 			diagnostics = {
-- -- 				globals = { "vim" },
-- -- 			},
-- -- 			workspace = {
-- -- 				library = {
-- -- 					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
-- -- 					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
-- -- 				},
-- -- 				maxPreload = 10000,
-- -- 			},
-- -- 		},
-- -- 	},
-- -- })
-- --
-- -- -- GraphqQL setup
-- -- require("lspconfig").graphql.setup({
-- -- 	filetypes = { "graphql", "graphqls" },
-- -- })
-- --
-- -- -- YAML
-- -- require("lspconfig").yamlls.setup({
-- -- 	cmd = { DATA_PATH .. "/lspinstall/yaml/node_modules/.bin/yaml-language-server", "--stdio" },
-- -- 	-- on_attach = require'lsp'.common_on_attach,
-- -- 	settings = {
-- -- 		yaml = {
-- -- 			format = {
-- -- 				enable = true,
-- -- 			},
-- -- 			hover = true,
-- -- 			completion = true,
-- -- 			customTags = {
-- -- 				"!fn",
-- -- 				"!And",
-- -- 				"!If",
-- -- 				"!Not",
-- -- 				"!Equals",
-- -- 				"!Or",
-- -- 				"!FindInMap sequence",
-- -- 				"!Base64",
-- -- 				"!Cidr",
-- -- 				"!Ref",
-- -- 				"!Ref Scalar",
-- -- 				"!Sub",
-- -- 				"!GetAtt",
-- -- 				"!GetAZs",
-- -- 				"!ImportValue",
-- -- 				"!Select",
-- -- 				"!Split",
-- -- 				"!Join sequence",
-- -- 			},
-- -- 		},
-- -- 	},
-- -- })
-- --
-- -- require("lspconfig").pyright.setup({
-- -- 	cmd = { DATA_PATH .. "/lspinstall/python/node_modules/.bin/pyright-langserver", "--stdio" },
-- -- 	on_attach = function(client, bufnr)
-- -- 		require("lsp_signature").on_attach(cfg)
-- -- 	end,
-- -- 	-- on_attach = require'lsp'.common_on_attach,
-- -- 	--     handlers = {
-- -- 	--         ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
-- -- 	--             virtual_text = O.python.diagnostics.virtual_text,
-- -- 	--             signs = O.python.diagnostics.signs,
-- -- 	--             underline = O.python.diagnostics.underline,
-- -- 	--             update_in_insert = true
-- -- 	--
-- -- 	--         })
-- -- 	--     },
-- -- 	settings = {
-- -- 		python = {
-- -- 			analysis = {
-- -- 				autoSearchPaths = true,
-- -- 				diagnosticMode = "workspace",
-- -- 				useLibraryCodeForTypes = true,
-- -- 			},
-- -- 		},
-- -- 	},
-- -- })
-- --
-- -- -- Organize imports and format on save
-- -- -- function lsp_organize_imports()
-- -- --   local context = { source = { organizeImports = true } }
-- -- --   vim.validate { context = { context, "table", true } }
-- -- --
-- -- --   local params = vim.lsp.util.make_range_params()
-- -- --   params.context = context
-- -- --
-- -- --   local method = "textDocument/codeAction"
-- -- --   local timeout = 1000 -- ms
-- -- --
-- -- --   local resp = vim.lsp.buf_request_sync(0, method, params, timeout)
-- -- --   if not resp then return end
-- -- --
-- -- --   for _, client in ipairs(vim.lsp.get_active_clients()) do
-- -- --     if resp[client.id] then
-- -- --       local result = resp[client.id].result
-- -- --       if not result or not result[1] then return end
-- -- --
-- -- --       local edit = result[1].edit
-- -- --       vim.lsp.util.apply_workspace_edit(edit)
-- -- --     end
-- -- --   end
-- -- -- end
-- --
-- -- -- Organizie imports on save
-- -- -- vim.api.nvim_command("au BufWritePre *.go lua lsp_organize_imports()")
-- --
-- -- -- Format on save
-- -- -- vim.api.nvim_command("autocmd BufWritePre *.go silent! lua vim.lsp.buf.formatting_sync()")
-- --
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
