local lsp = vim.lsp
local handlers = lsp.handlers

-- Hover doc popup
local pop_opts = {border = "rounded", max_width = 80}
handlers["textDocument/hover"] = lsp.with(handlers.hover, pop_opts)
handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, pop_opts)

-- Global dir paths
DATA_PATH = vim.fn.stdpath("data")
CACHE_PATH = vim.fn.stdpath("cache")

-- local go_capabilities = vim.lsp.protocol.make_client_capabilities()
local go_capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
go_capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits"
  }
}

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(
  function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
  end
)

require "lspconfig".clangd.setup {
  capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(client, bufnr)
    require "lsp_signature".on_attach(cfg)
  end
}

-- Golang setup
require "lspconfig".gopls.setup {
  -- capabilities = capabilities,
  -- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),

  capabilities = go_capabilities,
  on_attach = function(client, bufnr)
    require "lsp_signature".on_attach(cfg)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end,
  root_dir = require "lspconfig".util.root_pattern(".git", "go.mod"),
  settings = {gopls = {analyses = {unusedparams = false}, staticcheck = false}},
  init_options = {usePlaceholders = true, completeUnimported = true}
}

-- Lua setup
local sumneko_root_path = DATA_PATH .. "/lspinstall/lua"
local sumneko_binary = sumneko_root_path .. "/sumneko-lua-language-server"

require "lspconfig".sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";")
      },
      diagnostics = {
        globals = {"vim"}
      },
      workspace = {
        library = {[vim.fn.expand("$VIMRUNTIME/lua")] = true, [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true},
        maxPreload = 10000
      }
    }
  }
}

-- GraphqQL setup
require "lspconfig".graphql.setup {
  filetypes = {"graphql", "graphqls"}
}

-- YAML
require "lspconfig".yamlls.setup {
  cmd = {DATA_PATH .. "/lspinstall/yaml/node_modules/.bin/yaml-language-server", "--stdio"},
  -- on_attach = require'lsp'.common_on_attach,
  settings = {
    yaml = {
      format = {
        enable = true
      },
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
        "!Join sequence"
      }
    }
  }
}

require "lspconfig".pyright.setup {
  cmd = {DATA_PATH .. "/lspinstall/python/node_modules/.bin/pyright-langserver", "--stdio"},
  on_attach = function(client, bufnr)
    require "lsp_signature".on_attach(cfg)
  end,
  -- on_attach = require'lsp'.common_on_attach,
  --     handlers = {
  --         ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  --             virtual_text = O.python.diagnostics.virtual_text,
  --             signs = O.python.diagnostics.signs,
  --             underline = O.python.diagnostics.underline,
  --             update_in_insert = true
  --
  --         })
  --     },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true
      }
    }
  }
}

-- Organize imports and format on save
-- function lsp_organize_imports()
--   local context = { source = { organizeImports = true } }
--   vim.validate { context = { context, "table", true } }
--
--   local params = vim.lsp.util.make_range_params()
--   params.context = context
--
--   local method = "textDocument/codeAction"
--   local timeout = 1000 -- ms
--
--   local resp = vim.lsp.buf_request_sync(0, method, params, timeout)
--   if not resp then return end
--
--   for _, client in ipairs(vim.lsp.get_active_clients()) do
--     if resp[client.id] then
--       local result = resp[client.id].result
--       if not result or not result[1] then return end
--
--       local edit = result[1].edit
--       vim.lsp.util.apply_workspace_edit(edit)
--     end
--   end
-- end

-- Organizie imports on save
-- vim.api.nvim_command("au BufWritePre *.go lua lsp_organize_imports()")

-- Format on save
-- vim.api.nvim_command("autocmd BufWritePre *.go silent! lua vim.lsp.buf.formatting_sync()")
