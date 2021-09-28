local wk = require("which-key")


-- Cycle and kill buffers
vim.api.nvim_set_keymap('n', 'H', ':BufferLineCyclePrev<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'L', ':BufferLineCycleNext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'X', ':bw<CR>', {noremap = true, silent = true})

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

wk.register({
  s = {
    name = "Search",
    s = {':lua require\'telescope.builtin\'.lsp_document_symbols(require(\'telescope.themes\').get_dropdown({ previewer = false, winblend = 10, symbol_width = 65, symbol_type_width = 100}))<cr>', 'Search doc symbol'},
    S = {':lua require\'telescope.builtin\'.lsp_workspace_symbols(require(\'telescope.themes\').get_dropdown({ previewer = false, winblend = 10, symbol_width = 65, symbol_type_width = 100}))<cr>', 'Search WS symbol'},
    r = {':lua require\'telescope.builtin\'.resume()<cr>', 'Resume last search'},
    w = {'<Cmd>Telescope grep_string<CR>', 'Search word under cursor'},

    t = {':lua require\'telescope.builtin\'.live_grep(require(\'telescope.themes\').get_dropdown({winblend = 10, symbol_width = 65, symbol_type_width = 100}))<cr>', 'Search doc symbol'},

  },
  f = { ':lua require\'telescope.builtin\'.find_files(require(\'telescope.themes\').get_dropdown({ previewer = false, winblend = 10, position = \'top\'}))<cr>', 'Find File' },
  e = {':NvimTreeFindFile<CR>', 'Open Tree View'}},
{ prefix = "<leader>" }
)

wk.register({
    d = {'<Cmd>lua vim.lsp.buf.definition()<CR>', 'Go to definition'},
    s = {'<Cmd>sp | lua vim.lsp.buf.definition()<cr>', 'Go do def in split'},
    v = {'<cmd>vsp | lua vim.lsp.buf.definition()<cr>', 'Go to dev in vsplit'},
    r = { '<Cmd>:Telescope lsp_references<CR>', "Go to references" },
    i = { '<Cmd>:Telescope lsp_implementations<CR>', "Go to implementations" },
}, { prefix = "g" })

