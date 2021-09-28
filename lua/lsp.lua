-- Global dir paths
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

local go_capabilities = vim.lsp.protocol.make_client_capabilities()
go_capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

-- Golang setup
require'lspconfig'.gopls.setup{
    -- capabilities = capabilities,
    -- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),

    capabilities = go_capabilities,

    on_attach = function(client, bufnr)
        require'lsp_signature'.on_attach(cfg)
    end,
    root_dir = require'lspconfig'.util.root_pattern(".git","go.mod"),
    settings = {gopls = {analyses = {unusedparams = false}, staticcheck = false}},
    init_options = {usePlaceholders = true, completeUnimported = true},
}

-- Lua setup
local sumneko_root_path = DATA_PATH .. "/lspinstall/lua"
local sumneko_binary = sumneko_root_path .. "/sumneko-lua-language-server"

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                globals = {'vim'}
            },
            workspace = {
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true},
                maxPreload = 10000
            }
        }
    }
}

-- GraphqQL setup
require'lspconfig'.graphql.setup{
    filetypes = { "graphql", "graphqls"}
}




-- Organize imports and format on save
function lsp_organize_imports()
  local context = { source = { organizeImports = true } }
  vim.validate { context = { context, "table", true } }

  local params = vim.lsp.util.make_range_params()
  params.context = context

  local method = "textDocument/codeAction"
  local timeout = 1000 -- ms

  local resp = vim.lsp.buf_request_sync(0, method, params, timeout)
  if not resp then return end

  for _, client in ipairs(vim.lsp.get_active_clients()) do
    if resp[client.id] then
      local result = resp[client.id].result
      if not result or not result[1] then return end

      local edit = result[1].edit
      vim.lsp.util.apply_workspace_edit(edit)
    end
  end
end

-- Organizie imports on save
vim.api.nvim_command("au BufWritePre *.go lua lsp_organize_imports()")

-- Format on save
vim.api.nvim_command("autocmd BufWritePre *.go silent! lua vim.lsp.buf.formatting_sync()")

