local wk = require("which-key")

-- Hop to char with 's'
vim.api.nvim_set_keymap('n', 's', ":HopChar1<CR>", {noremap = true, silent = true})

-- Cycle and kill buffers
vim.api.nvim_set_keymap('n', 'H', ':BufferLineCyclePrev<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'L', ':BufferLineCycleNext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'X', ':bw!<CR>', {noremap = true, silent = true})

-- Navigate splits withuot pressing <C-w> first
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})

-- Scroll on J and K without moving cursor
vim.api.nvim_set_keymap('n', 'J', '1<C-e>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'K', '1<C-y>', {noremap = true, silent = true})

-- Disable highlight on <ESC>
vim.api.nvim_set_keymap('n', '<ESC>', ':noh<ESC>', {noremap = true, silent = true})

-- cmd mode on ;
vim.api.nvim_set_keymap('n', ';', ':', {noremap = true, silent = true})

-- Normal leader keymaps
wk.register({
  s = {
    name = "Search",
    s = { function() require'telescope.builtin'.lsp_document_symbols() end, 'Search doc symbol'},
    S = { function() require'telescope.builtin'.lsp_workspace_symbols() end, 'Search workspace symbol'},
    r = { function() require'telescope.builtin'.resume() end, 'Resume last search'},
    w = { function() require'telescope.builtin'.grep_string() end, 'Search word under cursor'},
    t = { function() require'telescope.builtin'.live_grep() end, 'Search any text'},

  },
  -- D = {
  --   name = "Diagnostics",
  --   n = { function() vim.lsp.diagnostic.goto_next({popup_opts={focusable=false,border='rounded'}}) end, 'Next diagnostics'},
  --   p = { function() vim.lsp.diagnostic.goto_prev({popup_opts={focusable=false,border='rounded'}}) end, 'Prev diagnostics'},
  --   l = { function() require'telescope.builtin'.lsp_document_diagnostics() end, 'List doc diagnostics'},
  --   L = { function() require'telescope.builtin'.lsp_workspace_diagnostics() end, 'List workspace diagnostics'},
  -- },

  f = { function() require'telescope.builtin'.find_files() end, 'Find files' },
  F = { function() require'telescope.builtin'.find_files({hidden=true}) end, 'Find files including hidden' },

  e = {':NvimTreeFindFile<CR>', 'Open Tree View'},
  c = {':CommentToggle<CR>', 'Toggle comment' },

  w = {':w <cr>', 'Write file' },

  t = {
      name = "Test",
      n = { ':UltestNearest<CR>', 'Test nearest'},
      f = { ':Ultest<CR>', 'Test file'},
      s = { ':UltestSummary<CR>', 'Toggle summary'},
      o = { ':UltestOutput<CR>', 'Show test output'},
  },

    d = {
        name = "Debug and diagnostics",

        -- debug
        b = { function() require'dap'.toggle_breakpoint() end, 'Toggle breakpoint'},
        c = { function() require'dap'.continue() end, 'Continue' },
        o = { function() require'dap'.step_over() end, 'Step over' },
        i = { function() require'dap'.step_into() end, 'Step into' },
        u = { function() require("dapui").toggle() end, 'Toggle UI' },
        t = { function() require('dap-go').debug_test() end, 'Debug test' },
        h = { function() require("dapui").eval() end , 'Hover variable' },

        -- diagnostics
        n = { function() vim.lsp.diagnostic.goto_next({popup_opts={focusable=false,border='rounded'}}) end, 'Next diagnostics'},
        p = { function() vim.lsp.diagnostic.goto_prev({popup_opts={focusable=false,border='rounded'}}) end, 'Prev diagnostics'},
        l = { function() require'telescope.builtin'.lsp_document_diagnostics() end, 'List doc diagnostics'},
        L = { function() require'telescope.builtin'.lsp_workspace_diagnostics() end, 'List workspace diagnostics'},
  },
  },{ prefix = "<leader>" })

-- Visual leader keymaps
wk.register({
  c = {':CommentToggle<CR>', 'Toggle comment'},
  },{ prefix = "<leader>", mode = 'v'})

wk.register({
    d = {'<Cmd>lua vim.lsp.buf.definition()<CR>', 'Go to definition'},
    s = { '<Cmd>sp | lua vim.lsp.buf.definition()<cr>', 'Go do def in split'},
    v = { '<cmd>vsp | lua vim.lsp.buf.definition()<cr>', 'Go to dev in vsplit'},
    r = { '<Cmd>:Telescope lsp_references<CR>', "Go to references" },
    i = { '<Cmd>:Telescope lsp_implementations<CR>', "Go to implementations" },
    h = { ':lua vim.lsp.buf.hover()<CR>', 'Hover docs'},
}, { prefix = "g", mode = 'n'})

