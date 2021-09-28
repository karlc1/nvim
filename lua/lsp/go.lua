local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

 cfg = {
  bind = true, -- This is mandatory, otherwise border config won't get registered.
               -- If you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 10, -- only show one line of comment set to 0 if you do not want API comments be shown

  hint_enable = true, -- virtual hint enable
  -- hint_prefix = "🐼",  -- Panda for parameter
  -- hint_scheme = "String",

  handler_opts = {
    border = "shadow"   -- double, single, shadow, none
  },
  decorator = {"`", "`"}  -- or decorator = {"***", "***"}  decorator = {"**", "**"} see markdown help

}


require'lspconfig'.gopls.setup{
    cmd = {DATA_PATH .. "/lspinstall/go/gopls"},
    -- on_attach = require'lsp'.common_on_attach,
    capabilities = capabilities,

    on_attach = function(client, bufnr)
        require'lsp'.common_on_attach(client, bufnr)
        require'lsp_signature'.on_attach(cfg)
    end,


    -- onj_attach = function(client, bufnr)
    --     require'lsp'.common_on_attach(client, bufnr)
    --     require'lsp_signature'.on_attach(cfg)
    -- end,


    -- settings = {gopls = {analyses = {unusedparams = false}, staticcheck = false}},
    root_dir = require'lspconfig'.util.root_pattern(".git","go.mod"),
    -- root_dir = require'lspconfig'.util.root_pattern(".git","go.mod","."),
    init_options = {usePlaceholders = true, completeUnimported = true},
}

function Lsp_organize_imports()
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
vim.api.nvim_command("au BufWritePre *.go lua Lsp_organize_imports()")

-- Format on save
vim.api.nvim_command("autocmd BufWritePre *.go silent! lua vim.lsp.buf.formatting_sync()")

