-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/karlc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/karlc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/karlc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/karlc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/karlc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    config = { "\27LJ\2\n~\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\npaths\1\0\0\1\2\0\0\28~/.config/nvim/snippets\14lazy_load luasnip/loaders/from_vscode\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\6\0\f\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\3\0005\4\5\0005\5\4\0=\5\6\4=\4\a\0034\4\3\0005\5\b\0>\5\1\4=\4\t\3=\3\v\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\3\15text_align\vcenter\rfiletype\rNvimTree\ttext\18File Explorer\15highlights\20buffer_selected\1\0\0\1\0\3\bgui\tbold\nguifg\f#282828\nguibg\f#a89984\1\0\6\22show_buffer_icons\1\20show_close_icon\1\15close_icon\5\27always_show_bufferline\1\20max_name_length\3\18\22buffer_close_icon\5\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n�\19\0\0\4\0!\00056\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0006\0\0\0009\0\1\0005\1\f\0005\2\n\0005\3\t\0=\3\v\2=\2\r\0015\2\15\0005\3\14\0=\3\v\2=\2\16\0015\2\18\0005\3\17\0=\3\v\2=\2\19\0015\2\21\0005\3\20\0=\3\v\2=\2\22\0015\2\24\0005\3\23\0=\3\v\2=\2\25\0015\2\27\0005\3\26\0=\3\v\2=\2\28\1=\1\b\0006\0\0\0009\0\29\0'\2\30\0B\0\2\0016\0\0\0009\0\29\0'\2\31\0B\0\2\0016\0\0\0009\0\29\0'\2 \0B\0\2\1K\0\1\0\"hi! link dashboardCenter Type$hi! link dashboardHeader String�\1autocmd FileType dashboard setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs=  | autocmd WinLeave <buffer> set showtabline=2 \bcmd\6f\1\0\1\fcommand0:cd ~/.config/nvim | :e lua/keymappings.lua\1\2\0\0\31  ✎  Keymapping Config  \6e\1\0\1\fcommand,:cd ~/.config/nvim | :e lua/plugins.lua\1\2\0\0\31  ✎  Plugin Config      \6d\1\0\1\fcommand%:cd ~/.config/nvim | :e init.lua\1\2\0\0\31  ✎  Nvim Config        \6c\1\0\1\fcommand\24Telescope live_grep\1\2\0\0\31    Find Word          \6b\1\0\1\fcommand\23Telescope oldfiles\1\2\0\0\31    Recent Files       \6a\1\0\0\16description\1\0\1\fcommand�\1lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 0, previewer=false, layout_config = { height= 100 } }))\1\2\0\0\31    Find File          \29dashboard_custom_section\1\2\0\0\5\28dashboard_custom_footer\14telescope dashboard_default_executive\1\16\0\0\5R   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆               ^    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦             T          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄           T           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄          V          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀         f   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄        ^  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄         j ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄        d ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄       V      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆           \\       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃           V     ⢰⣶  ⣶ ⢶⣆⢀⣶⠂⣶⡶⠶⣦⡄⢰⣶⠶⢶⣦  ⣴⣶           Z     ⢸⣿⠶⠶⣿ ⠈⢻⣿⠁ ⣿⡇ ⢸⣿⢸⣿⢶⣾⠏ ⣸⣟⣹⣧          X     ⠸⠿  ⠿  ⠸⠿  ⠿⠷⠶⠿⠃⠸⠿⠄⠙⠷⠤⠿⠉⠉⠿⠆         \28dashboard_custom_header\6g\bvim\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/dashboard-nvim",
    url = "https://github.com/karlc1/dashboard-nvim"
  },
  ["feline.nvim"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/feline.nvim",
    url = "https://github.com/feline-nvim/feline.nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\a\0\b\0\0145\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\0026\4\2\0009\4\5\0049\4\6\4)\6\0\0B\4\2\0A\2\0\2>\2\2\1=\1\a\0L\0\2\0\targs\22nvim_buf_get_name\bapi\16shellescape\afn\bvim\1\4\0\0\21--stdin-filepath\0\19--single-quote\1\0\2\bexe\rprettier\nstdin\2N\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\4\0\0\19--indent-count\3\2\f--stdin\1\0\2\bexe\vluafmt\nstdin\2s\0\0\5\0\6\1\n5\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2)\4\0\0B\2\2\0?\2\0\0=\1\5\0L\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\2\0\0\a-w\1\0\2\bexe\14goimports\nstdin\1\5����\4�\1\0\0\a\0\b\1\0145\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\0026\4\2\0009\4\5\0049\4\6\4)\6\0\0B\4\2\0A\2\0\0?\2\0\0=\1\a\0L\0\2\0\targs\22nvim_buf_get_name\bapi\16fnameescape\afn\bvim\1\2\0\0)--in-place --aggressive --aggressive\1\0\2\bexe\24python3 -m autopep8\nstdin\1\5����\4�\3\1\0\a\0\25\0:3\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\23\0005\4\4\0004\5\3\0>\0\1\5=\5\5\0044\5\3\0>\0\1\5=\5\6\0044\5\3\0>\0\1\5=\5\a\0044\5\3\0>\0\1\5=\5\b\0044\5\3\0>\0\1\5=\5\t\0044\5\3\0>\0\1\5=\5\n\0044\5\3\0>\0\1\5=\5\v\0044\5\3\0>\0\1\5=\5\f\0044\5\3\0>\0\1\5=\5\r\0044\5\3\0>\0\1\5=\5\14\0044\5\3\0>\0\1\5=\5\15\0044\5\3\0>\0\1\5=\5\16\0044\5\3\0003\6\17\0>\6\1\5=\5\18\0044\5\3\0003\6\19\0>\6\1\5=\5\20\0044\5\3\0003\6\21\0>\6\1\5=\5\22\4=\4\24\3B\1\2\1K\0\1\0\rfiletype\1\0\0\vpython\0\ago\0\blua\0\byml\tyaml\njsonc\tjson\rmarkdown\20typescriptreact\15typescript\20javascriptreact\15javascript\thtml\tscss\bcss\1\0\0\nsetup\14formatter\frequire\0\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nc\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\nnumhl\1\14word_diff\1\vlinehl\1\15signcolumn\1\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["guess-indent.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17guess-indent\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/guess-indent.nvim",
    url = "https://github.com/nmac427/guess-indent.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\ne\0\0\3\0\5\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0B\0\1\1K\0\1\0\22insert_highlights\18hop.highlight\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["inspired-github.vim"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/inspired-github.vim",
    url = "https://github.com/mvpopuk/inspired-github.vim"
  },
  ["lsp-rooter.nvim"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/lsp-rooter.nvim",
    url = "https://github.com/ahmedkhalf/lsp-rooter.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["mini.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19mini.bufremove\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/mini.nvim",
    url = "https://github.com/echasnovski/mini.nvim"
  },
  neorg = {
    config = { "\27LJ\2\n�\a\0\0\b\0-\0>6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0025\1\a\0005\2\4\0005\3\5\0=\3\6\2=\2\b\1=\1\3\0005\1\f\0005\2\n\0005\3\v\0=\3\6\2=\2\b\1=\1\t\0005\1\16\0005\2\14\0005\3\15\0=\3\6\2=\2\b\1=\1\r\0006\1\0\0'\3\17\0B\1\2\0029\1\18\0015\3+\0005\4\19\0004\5\0\0=\5\20\0045\5\22\0005\6\21\0=\6\23\5=\5\24\0045\5\28\0005\6\26\0005\a\25\0=\a\27\6=\6\23\5=\5\29\0045\5\31\0005\6\30\0=\6\23\5=\5 \0045\5\"\0005\6!\0=\6\23\5=\5#\0044\5\0\0=\5$\0045\5&\0005\6%\0=\6\23\5=\5'\0045\5)\0005\6(\0=\6\23\5=\5*\4=\4,\3B\1\2\1K\0\1\0\tload\1\0\0\19core.presenter\1\0\0\1\0\1\rzen_mode\rzen-mode\18core.gtd.base\1\0\0\1\0\1\14workspace\thome core.integrations.telescope\18core.keybinds\1\0\0\1\0\2\21default_keybinds\2\17neorg_leader\14<Leader>o\25core.norg.completion\1\0\0\1\0\1\vengine\rnvim-cmp\21core.norg.dirman\1\0\0\15workspaces\1\0\0\1\0\1\thome\f~/neorg\24core.norg.concealer\vconfig\1\0\0\1\0\1\18markup_preset\vdimmed\18core.defaults\1\0\0\nsetup\nneorg\1\0\0\1\2\0\0\17src/parser.c\1\0\2\vbranch\tmain\burl9https://github.com/nvim-neorg/tree-sitter-norg-table\15norg_table\1\0\0\1\2\0\0\17src/parser.c\1\0\2\vbranch\tmain\burl8https://github.com/nvim-neorg/tree-sitter-norg-meta\14norg_meta\17install_info\1\0\0\nfiles\1\3\0\0\17src/parser.c\19src/scanner.cc\1\0\2\vbranch\tmain\burl3https://github.com/nvim-neorg/tree-sitter-norg\tnorg\23get_parser_configs\28nvim-treesitter.parsers\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/neorg",
    url = "https://github.com/nvim-neorg/neorg"
  },
  ["neorg-telescope"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/neorg-telescope",
    url = "https://github.com/nvim-neorg/neorg-telescope"
  },
  ["neovim-ayu"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/neovim-ayu",
    url = "https://github.com/Shatur/neovim-ayu"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\n�\4\0\0\a\0\18\00026\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\f\0004\3\6\0006\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\0049\4\5\4>\4\1\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\6\0049\4\a\4>\4\2\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\b\0049\4\t\4>\4\3\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\0049\4\n\4>\4\4\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\b\0049\4\v\4>\4\5\3=\3\r\2B\0\2\0016\0\14\0009\0\15\0009\0\16\0'\2\17\0+\3\2\0B\0\3\1K\0\1\0�\1            augroup FormatAutogroup\n              autocmd!\n              autocmd BufWritePost *.go,*.lua lua vim.lsp.buf.formatting_sync({}, 5000)\n            augroup END\n            \14nvim_exec\bapi\bvim\fsources\1\0\0\fluasnip\ngofmt\nspell\15completion\veslint\16diagnostics\vstylua\15formatting\rbuiltins\nsetup\fnull-ls\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire�\1\0\1\a\1\v\2(6\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\2\23\1\0\1-\2\0\0009\2\4\2B\2\1\2\15\0\2\0X\3\4�-\2\0\0009\2\5\2B\2\1\1X\2\24�\b\1\1\0X\2\16�6\2\0\0009\2\1\0029\2\6\2'\4\3\0B\2\2\2\18\4\2\0009\2\a\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\b\2'\5\t\0B\2\3\2\15\0\2\0X\3\3�\18\2\0\0B\2\1\1X\2\3�-\2\0\0009\2\n\2B\2\1\1K\0\1\0\0�\rcomplete\a%s\nmatch\bsub\fgetline\21select_next_item\fvisible\6.\bcol\afn\bvim\2\0R\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\21select_prev_item\fvisible�\a\1\0\t\0:\0i6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\0016\0\4\0'\2\5\0B\0\2\0029\1\6\0005\3\t\0009\4\a\0009\4\b\4=\4\n\0035\4\f\0003\5\v\0=\5\r\4=\4\14\0035\4\15\0005\5\16\0=\5\17\4=\4\17\0035\4\25\0004\5\6\0009\6\18\0009\6\19\0069\6\20\6>\6\1\0059\6\18\0009\6\19\0069\6\21\6>\6\2\0059\6\18\0009\6\19\0069\6\22\6>\6\3\0059\6\18\0009\6\19\0069\6\23\6>\6\4\0059\6\18\0009\6\19\0069\6\24\6>\6\5\5=\5\26\4=\4\27\0035\4\30\0009\5\28\0009\5\29\5B\5\1\2=\5\31\0049\5\28\0009\5 \5)\a��B\5\2\2=\5!\0049\5\28\0009\5 \5)\a\1\0B\5\2\2=\5\"\0049\5\28\0009\5#\5B\5\1\2=\5$\0049\5\28\0009\5%\0055\a&\0009\b'\0009\b(\b=\b)\aB\5\2\2=\5*\0043\5+\0=\5,\0043\5-\0=\5.\4=\4\28\0039\4\18\0009\4/\0044\6\b\0005\a0\0>\a\1\0065\a1\0>\a\2\0065\a2\0>\a\3\0065\a3\0>\a\4\0065\a4\0>\a\5\0065\a5\0>\a\6\0065\a6\0>\a\a\0064\a\3\0005\b7\0>\b\1\aB\4\3\2=\4/\0035\0048\0=\0049\3B\1\2\0012\0\0�K\0\1\0\17experimental\1\0\1\15ghost_text\2\1\0\1\tname\vbuffer\1\0\1\tname\17cmp-nvim-lua\1\0\1\tname\16cmp-luasnip\1\0\1\tname\fluasnip\1\0\1\tname\forgmode\1\0\1\tname\nneorg\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\fsources\f<S-Tab>\0\n<Tab>\0\t<CR>\rbehavior\vInsert\20ConfirmBehavior\1\0\1\vselect\2\fconfirm\n<ESC>\nabort\n<C-d>\n<C-u>\16scroll_docs\14<C-Space>\1\0\0\rcomplete\fmapping\fsorting\16comparators\1\0\0\nexact\vlength\tkind\voffset\norder\fcompare\vconfig\15completion\1\0\1\16completeopt\26menu,menuone,noinsert\1\0\1\17autocomplete\1\fsnippet\vexpand\1\0\0\0\14preselect\1\0\0\tNone\18PreselectMode\nsetup\bcmp\frequire\21set pumheight=10\14nvim_exec\bapi\bvim\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\nf\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\20create_mappings\1\21operator_mapping\agc\nsetup\17nvim_comment\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/nvim-comment",
    url = "https://github.com/terrortylor/nvim-comment"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n�\3\0\0\4\0\n\0\0216\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\4\0009\0\5\0'\2\6\0005\3\a\0B\0\3\0016\0\0\0009\0\4\0009\0\5\0'\2\b\0005\3\t\0B\0\3\1K\0\1\0\1\0\4\vtexthl\17DebugStopped\nnumhl\5\vlinehl\vVisual\ttext\b→\15DapStopped\1\0\4\vtexthl\20DebugBreakpoint\nnumhl\5\vlinehl\5\ttext\b⊚\18DapBreakpoint\16sign_define\afnrexec 'hi DebugStopped guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('WarningMsg'),'fg')pexec 'hi DebugBreakpoint guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('Error'),'fg')\bcmd\bvim\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-go"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vdap-go\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/nvim-dap-go",
    url = "https://github.com/leoluz/nvim-dap-go"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\v\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\5\0004\4\3\0005\5\3\0>\5\1\0045\5\4\0>\5\2\4=\4\6\3=\3\b\0025\3\t\0=\3\n\2B\0\2\1K\0\1\0\fwindows\1\0\1\vindent\3\1\fsidebar\1\0\0\relements\1\0\2\rposition\tleft\tsize\3<\1\0\2\aid\16breakpoints\tsize\4�̙�\6����\3\1\0\2\aid\vscopes\tsize\4͙��\f̙��\3\nsetup\ndapui\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-dd"] = {
    config = { "\27LJ\2\nB\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\ftimeout\3�\1\nsetup\add\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/nvim-dd",
    url = "https://gitlab.com/yorickpeterse/nvim-dd"
  },
  ["nvim-hlslens"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-scrollbar"] = {
    config = { "\27LJ\2\n�\6\0\0\6\0\18\0\0266\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\6\0005\3\a\0=\3\b\0025\3\f\0005\4\n\0005\5\t\0=\5\v\4=\4\r\3=\3\14\0025\3\15\0=\3\16\2B\0\2\0016\0\3\0'\2\17\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\30scrollbar.handlers.search\rhandlers\1\0\2\vsearch\2\15diagnostic\2\nmarks\vSearch\1\0\0\ttext\1\0\3\rpriority\3\0\ncolor\vyellow\14highlight\14IncSearch\1\3\0\0\6-\6=\vhandle\1\0\3\24hide_if_all_visible\2\14highlight\vVisual\ttext\6 \1\0\1\tshow\2\nsetup\14scrollbar\frequire�\4\n        noremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR>\n            \\<Cmd>lua require('hlslens').start()<CR>\n        noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR>\n                    \\<Cmd>lua require('hlslens').start()<CR>\n        noremap * *<Cmd>lua require('hlslens').start()<CR>``\n        noremap # #<Cmd>lua require('hlslens').start()<CR>\n        noremap g* g*<Cmd>lua require('hlslens').start()<CR>\n        noremap g# g#<Cmd>lua require('hlslens').start()<CR>\n\n        \bcmd\bvim\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\ns\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\tview\1\0\1\16auto_resize\2\1\0\2\15update_cwd\2\15auto_close\2\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\1\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\5\0\0\ago\tnorg\14norg_meta\15norg_table\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plantuml-syntax"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/plantuml-syntax",
    url = "https://github.com/aklt/plantuml-syntax"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/opt/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["stabilize.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14stabilize\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/stabilize.nvim",
    url = "https://github.com/luukvbaal/stabilize.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n�\t\0\0\6\0\23\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\n\0005\4\b\0005\5\t\0=\5\5\4=\4\v\0035\4\f\0005\5\r\0=\5\5\4=\4\14\0035\4\15\0005\5\16\0=\5\5\4=\4\17\3=\3\18\2B\0\2\0016\0\19\0009\0\20\0009\0\21\0'\2\22\0+\3\2\0B\0\3\1K\0\1\0�\5                  highlight TelescopeSelection      guibg=bg gui=bold\n                  highlight TelescopeNormal         guibg=#00000\n                  highlight TelescopeBorder         guifg=#00ff00\n                  highlight TelescopePromptBorder   gui=bold\n                  highlight TelescopeResultsBorder  gui=bold\n                  highlight TelescopePreviewBorder  guifg=#ffffff\n                  highlight TelescopeTitle          guifg=#ffffff\n\n                  highlight link TelescopeResultsStruct structure\n                  highlight link TelescopeResultsMethod string\n                  highlight link TelescopePromptTitle string\n                  \14nvim_exec\bapi\bvim\fpickers\25lsp_document_symbols\1\0\2\vheight\4\0����\3\nwidth\3<\1\0\4\22symbol_type_width\3d\14previewer\1\17symbol_width\3-\ntheme\rdropdown\14live_grep\1\0\4\vheight\4��̙\3���\3\nwidth\4�̙�\6�̹�\3\20prompt_position\vbottom\19preview_cutoff\3\n\1\0\1\ntheme\bivy\15find_files\1\0\0\1\0\1\vheight\4\0����\3\1\0\2\14previewer\1\ntheme\rdropdown\rdefaults\1\0\0\18layout_config\1\0\2\20prompt_position\btop\19preview_cutoff\3\n\1\0\2\20layout_strategy\tflex\rwinblend\3\0\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\nG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fcontext\3d\nsetup\rtwilight\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  vim = {
    loaded = false,
    needs_bufread = false,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/opt/vim",
    url = "https://github.com/embark-theme/vim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["vim-ultest"] = {
    config = { "\27LJ\2\n�\4\0\0\4\0\a\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0+\3\1\0B\0\3\1K\0\1\0�\3                hi UltestPass ctermfg=Green guifg=#96F291\n                hi UltestFail ctermfg=Red guifg=#F70067\n                hi UltestRunning ctermfg=Yellow guifg=#FFEC63\n                hi UltestBorder ctermfg=Red guifg=#F70067\n                hi UltestSummaryInfo ctermfg=cyan guifg=#00F1F5 gui=bold cterm=bold\n                hi link UltestSummaryFile UltestSummaryInfo\n                hi link UltestSummaryNamespace UltestSummaryInfo\n              \14nvim_exec\bapi\bvim\nsetup\vultest\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/vim-ultest",
    url = "https://github.com/rcarriga/vim-ultest"
  },
  vimwiki = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/vimwiki",
    url = "https://github.com/vimwiki/vimwiki"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\2B\0\2\1K\0\1\0\fplugins\rtwilight\1\0\0\1\0\1\fenabled\1\vwindow\1\0\0\foptions\1\0\3\19relativenumber\1\vnumber\1\15signcolumn\ano\1\0\3\vheight\4�̙�\6�̙�\3\nwidth\4�̙�\6�̙�\3\rbackdrop\3\1\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  },
  ["zenbones.nvim"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/zenbones.nvim",
    url = "https://github.com/mcchrish/zenbones.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\n�\4\0\0\a\0\18\00026\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\f\0004\3\6\0006\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\0049\4\5\4>\4\1\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\6\0049\4\a\4>\4\2\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\b\0049\4\t\4>\4\3\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\0049\4\n\4>\4\4\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\b\0049\4\v\4>\4\5\3=\3\r\2B\0\2\0016\0\14\0009\0\15\0009\0\16\0'\2\17\0+\3\2\0B\0\3\1K\0\1\0�\1            augroup FormatAutogroup\n              autocmd!\n              autocmd BufWritePost *.go,*.lua lua vim.lsp.buf.formatting_sync({}, 5000)\n            augroup END\n            \14nvim_exec\bapi\bvim\fsources\1\0\0\fluasnip\ngofmt\nspell\15completion\veslint\16diagnostics\vstylua\15formatting\rbuiltins\nsetup\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: stabilize.nvim
time([[Config for stabilize.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14stabilize\frequire\0", "config", "stabilize.nvim")
time([[Config for stabilize.nvim]], false)
-- Config for: guess-indent.nvim
time([[Config for guess-indent.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17guess-indent\frequire\0", "config", "guess-indent.nvim")
time([[Config for guess-indent.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n�\t\0\0\6\0\23\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\n\0005\4\b\0005\5\t\0=\5\5\4=\4\v\0035\4\f\0005\5\r\0=\5\5\4=\4\14\0035\4\15\0005\5\16\0=\5\5\4=\4\17\3=\3\18\2B\0\2\0016\0\19\0009\0\20\0009\0\21\0'\2\22\0+\3\2\0B\0\3\1K\0\1\0�\5                  highlight TelescopeSelection      guibg=bg gui=bold\n                  highlight TelescopeNormal         guibg=#00000\n                  highlight TelescopeBorder         guifg=#00ff00\n                  highlight TelescopePromptBorder   gui=bold\n                  highlight TelescopeResultsBorder  gui=bold\n                  highlight TelescopePreviewBorder  guifg=#ffffff\n                  highlight TelescopeTitle          guifg=#ffffff\n\n                  highlight link TelescopeResultsStruct structure\n                  highlight link TelescopeResultsMethod string\n                  highlight link TelescopePromptTitle string\n                  \14nvim_exec\bapi\bvim\fpickers\25lsp_document_symbols\1\0\2\vheight\4\0����\3\nwidth\3<\1\0\4\22symbol_type_width\3d\14previewer\1\17symbol_width\3-\ntheme\rdropdown\14live_grep\1\0\4\vheight\4��̙\3���\3\nwidth\4�̙�\6�̹�\3\20prompt_position\vbottom\19preview_cutoff\3\n\1\0\1\ntheme\bivy\15find_files\1\0\0\1\0\1\vheight\4\0����\3\1\0\2\14previewer\1\ntheme\rdropdown\rdefaults\1\0\0\18layout_config\1\0\2\20prompt_position\btop\19preview_cutoff\3\n\1\0\2\20layout_strategy\tflex\rwinblend\3\0\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\2\nf\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\20create_mappings\1\21operator_mapping\agc\nsetup\17nvim_comment\frequire\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n�\19\0\0\4\0!\00056\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0006\0\0\0009\0\1\0005\1\f\0005\2\n\0005\3\t\0=\3\v\2=\2\r\0015\2\15\0005\3\14\0=\3\v\2=\2\16\0015\2\18\0005\3\17\0=\3\v\2=\2\19\0015\2\21\0005\3\20\0=\3\v\2=\2\22\0015\2\24\0005\3\23\0=\3\v\2=\2\25\0015\2\27\0005\3\26\0=\3\v\2=\2\28\1=\1\b\0006\0\0\0009\0\29\0'\2\30\0B\0\2\0016\0\0\0009\0\29\0'\2\31\0B\0\2\0016\0\0\0009\0\29\0'\2 \0B\0\2\1K\0\1\0\"hi! link dashboardCenter Type$hi! link dashboardHeader String�\1autocmd FileType dashboard setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs=  | autocmd WinLeave <buffer> set showtabline=2 \bcmd\6f\1\0\1\fcommand0:cd ~/.config/nvim | :e lua/keymappings.lua\1\2\0\0\31  ✎  Keymapping Config  \6e\1\0\1\fcommand,:cd ~/.config/nvim | :e lua/plugins.lua\1\2\0\0\31  ✎  Plugin Config      \6d\1\0\1\fcommand%:cd ~/.config/nvim | :e init.lua\1\2\0\0\31  ✎  Nvim Config        \6c\1\0\1\fcommand\24Telescope live_grep\1\2\0\0\31    Find Word          \6b\1\0\1\fcommand\23Telescope oldfiles\1\2\0\0\31    Recent Files       \6a\1\0\0\16description\1\0\1\fcommand�\1lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 0, previewer=false, layout_config = { height= 100 } }))\1\2\0\0\31    Find File          \29dashboard_custom_section\1\2\0\0\5\28dashboard_custom_footer\14telescope dashboard_default_executive\1\16\0\0\5R   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆               ^    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦             T          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄           T           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄          V          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀         f   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄        ^  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄         j ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄        d ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄       V      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆           \\       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃           V     ⢰⣶  ⣶ ⢶⣆⢀⣶⠂⣶⡶⠶⣦⡄⢰⣶⠶⢶⣦  ⣴⣶           Z     ⢸⣿⠶⠶⣿ ⠈⢻⣿⠁ ⣿⡇ ⢸⣿⢸⣿⢶⣾⠏ ⣸⣟⣹⣧          X     ⠸⠿  ⠿  ⠸⠿  ⠿⠷⠶⠿⠃⠸⠿⠄⠙⠷⠤⠿⠉⠉⠿⠆         \28dashboard_custom_header\6g\bvim\0", "config", "dashboard-nvim")
time([[Config for dashboard-nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire�\1\0\1\a\1\v\2(6\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\2\23\1\0\1-\2\0\0009\2\4\2B\2\1\2\15\0\2\0X\3\4�-\2\0\0009\2\5\2B\2\1\1X\2\24�\b\1\1\0X\2\16�6\2\0\0009\2\1\0029\2\6\2'\4\3\0B\2\2\2\18\4\2\0009\2\a\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\b\2'\5\t\0B\2\3\2\15\0\2\0X\3\3�\18\2\0\0B\2\1\1X\2\3�-\2\0\0009\2\n\2B\2\1\1K\0\1\0\0�\rcomplete\a%s\nmatch\bsub\fgetline\21select_next_item\fvisible\6.\bcol\afn\bvim\2\0R\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\21select_prev_item\fvisible�\a\1\0\t\0:\0i6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\0016\0\4\0'\2\5\0B\0\2\0029\1\6\0005\3\t\0009\4\a\0009\4\b\4=\4\n\0035\4\f\0003\5\v\0=\5\r\4=\4\14\0035\4\15\0005\5\16\0=\5\17\4=\4\17\0035\4\25\0004\5\6\0009\6\18\0009\6\19\0069\6\20\6>\6\1\0059\6\18\0009\6\19\0069\6\21\6>\6\2\0059\6\18\0009\6\19\0069\6\22\6>\6\3\0059\6\18\0009\6\19\0069\6\23\6>\6\4\0059\6\18\0009\6\19\0069\6\24\6>\6\5\5=\5\26\4=\4\27\0035\4\30\0009\5\28\0009\5\29\5B\5\1\2=\5\31\0049\5\28\0009\5 \5)\a��B\5\2\2=\5!\0049\5\28\0009\5 \5)\a\1\0B\5\2\2=\5\"\0049\5\28\0009\5#\5B\5\1\2=\5$\0049\5\28\0009\5%\0055\a&\0009\b'\0009\b(\b=\b)\aB\5\2\2=\5*\0043\5+\0=\5,\0043\5-\0=\5.\4=\4\28\0039\4\18\0009\4/\0044\6\b\0005\a0\0>\a\1\0065\a1\0>\a\2\0065\a2\0>\a\3\0065\a3\0>\a\4\0065\a4\0>\a\5\0065\a5\0>\a\6\0065\a6\0>\a\a\0064\a\3\0005\b7\0>\b\1\aB\4\3\2=\4/\0035\0048\0=\0049\3B\1\2\0012\0\0�K\0\1\0\17experimental\1\0\1\15ghost_text\2\1\0\1\tname\vbuffer\1\0\1\tname\17cmp-nvim-lua\1\0\1\tname\16cmp-luasnip\1\0\1\tname\fluasnip\1\0\1\tname\forgmode\1\0\1\tname\nneorg\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\fsources\f<S-Tab>\0\n<Tab>\0\t<CR>\rbehavior\vInsert\20ConfirmBehavior\1\0\1\vselect\2\fconfirm\n<ESC>\nabort\n<C-d>\n<C-u>\16scroll_docs\14<C-Space>\1\0\0\rcomplete\fmapping\fsorting\16comparators\1\0\0\nexact\vlength\tkind\voffset\norder\fcompare\vconfig\15completion\1\0\1\16completeopt\26menu,menuone,noinsert\1\0\1\17autocomplete\1\fsnippet\vexpand\1\0\0\0\14preselect\1\0\0\tNone\18PreselectMode\nsetup\bcmp\frequire\21set pumheight=10\14nvim_exec\bapi\bvim\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\2B\0\2\1K\0\1\0\fplugins\rtwilight\1\0\0\1\0\1\fenabled\1\vwindow\1\0\0\foptions\1\0\3\19relativenumber\1\vnumber\1\15signcolumn\ano\1\0\3\vheight\4�̙�\6�̙�\3\nwidth\4�̙�\6�̙�\3\rbackdrop\3\1\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\1\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\5\0\0\ago\tnorg\14norg_meta\15norg_table\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: vimwiki
time([[Config for vimwiki]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "vimwiki")
time([[Config for vimwiki]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: mini.nvim
time([[Config for mini.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19mini.bufremove\frequire\0", "config", "mini.nvim")
time([[Config for mini.nvim]], false)
-- Config for: nvim-dap-go
time([[Config for nvim-dap-go]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vdap-go\frequire\0", "config", "nvim-dap-go")
time([[Config for nvim-dap-go]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n�\3\0\0\4\0\n\0\0216\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\4\0009\0\5\0'\2\6\0005\3\a\0B\0\3\0016\0\0\0009\0\4\0009\0\5\0'\2\b\0005\3\t\0B\0\3\1K\0\1\0\1\0\4\vtexthl\17DebugStopped\nnumhl\5\vlinehl\vVisual\ttext\b→\15DapStopped\1\0\4\vtexthl\20DebugBreakpoint\nnumhl\5\vlinehl\5\ttext\b⊚\18DapBreakpoint\16sign_define\afnrexec 'hi DebugStopped guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('WarningMsg'),'fg')pexec 'hi DebugBreakpoint guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('Error'),'fg')\bcmd\bvim\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n~\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\npaths\1\0\0\1\2\0\0\28~/.config/nvim/snippets\14lazy_load luasnip/loaders/from_vscode\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\a\0\b\0\0145\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\0026\4\2\0009\4\5\0049\4\6\4)\6\0\0B\4\2\0A\2\0\2>\2\2\1=\1\a\0L\0\2\0\targs\22nvim_buf_get_name\bapi\16shellescape\afn\bvim\1\4\0\0\21--stdin-filepath\0\19--single-quote\1\0\2\bexe\rprettier\nstdin\2N\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\4\0\0\19--indent-count\3\2\f--stdin\1\0\2\bexe\vluafmt\nstdin\2s\0\0\5\0\6\1\n5\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2)\4\0\0B\2\2\0?\2\0\0=\1\5\0L\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\2\0\0\a-w\1\0\2\bexe\14goimports\nstdin\1\5����\4�\1\0\0\a\0\b\1\0145\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\0026\4\2\0009\4\5\0049\4\6\4)\6\0\0B\4\2\0A\2\0\0?\2\0\0=\1\a\0L\0\2\0\targs\22nvim_buf_get_name\bapi\16fnameescape\afn\bvim\1\2\0\0)--in-place --aggressive --aggressive\1\0\2\bexe\24python3 -m autopep8\nstdin\1\5����\4�\3\1\0\a\0\25\0:3\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\23\0005\4\4\0004\5\3\0>\0\1\5=\5\5\0044\5\3\0>\0\1\5=\5\6\0044\5\3\0>\0\1\5=\5\a\0044\5\3\0>\0\1\5=\5\b\0044\5\3\0>\0\1\5=\5\t\0044\5\3\0>\0\1\5=\5\n\0044\5\3\0>\0\1\5=\5\v\0044\5\3\0>\0\1\5=\5\f\0044\5\3\0>\0\1\5=\5\r\0044\5\3\0>\0\1\5=\5\14\0044\5\3\0>\0\1\5=\5\15\0044\5\3\0>\0\1\5=\5\16\0044\5\3\0003\6\17\0>\6\1\5=\5\18\0044\5\3\0003\6\19\0>\6\1\5=\5\20\0044\5\3\0003\6\21\0>\6\1\5=\5\22\4=\4\24\3B\1\2\1K\0\1\0\rfiletype\1\0\0\vpython\0\ago\0\blua\0\byml\tyaml\njsonc\tjson\rmarkdown\20typescriptreact\15typescript\20javascriptreact\15javascript\thtml\tscss\bcss\1\0\0\nsetup\14formatter\frequire\0\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\v\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\5\0004\4\3\0005\5\3\0>\5\1\0045\5\4\0>\5\2\4=\4\6\3=\3\b\0025\3\t\0=\3\n\2B\0\2\1K\0\1\0\fwindows\1\0\1\vindent\3\1\fsidebar\1\0\0\relements\1\0\2\rposition\tleft\tsize\3<\1\0\2\aid\16breakpoints\tsize\4�̙�\6����\3\1\0\2\aid\vscopes\tsize\4͙��\f̙��\3\nsetup\ndapui\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: neorg
time([[Config for neorg]], true)
try_loadstring("\27LJ\2\n�\a\0\0\b\0-\0>6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0025\1\a\0005\2\4\0005\3\5\0=\3\6\2=\2\b\1=\1\3\0005\1\f\0005\2\n\0005\3\v\0=\3\6\2=\2\b\1=\1\t\0005\1\16\0005\2\14\0005\3\15\0=\3\6\2=\2\b\1=\1\r\0006\1\0\0'\3\17\0B\1\2\0029\1\18\0015\3+\0005\4\19\0004\5\0\0=\5\20\0045\5\22\0005\6\21\0=\6\23\5=\5\24\0045\5\28\0005\6\26\0005\a\25\0=\a\27\6=\6\23\5=\5\29\0045\5\31\0005\6\30\0=\6\23\5=\5 \0045\5\"\0005\6!\0=\6\23\5=\5#\0044\5\0\0=\5$\0045\5&\0005\6%\0=\6\23\5=\5'\0045\5)\0005\6(\0=\6\23\5=\5*\4=\4,\3B\1\2\1K\0\1\0\tload\1\0\0\19core.presenter\1\0\0\1\0\1\rzen_mode\rzen-mode\18core.gtd.base\1\0\0\1\0\1\14workspace\thome core.integrations.telescope\18core.keybinds\1\0\0\1\0\2\21default_keybinds\2\17neorg_leader\14<Leader>o\25core.norg.completion\1\0\0\1\0\1\vengine\rnvim-cmp\21core.norg.dirman\1\0\0\15workspaces\1\0\0\1\0\1\thome\f~/neorg\24core.norg.concealer\vconfig\1\0\0\1\0\1\18markup_preset\vdimmed\18core.defaults\1\0\0\nsetup\nneorg\1\0\0\1\2\0\0\17src/parser.c\1\0\2\vbranch\tmain\burl9https://github.com/nvim-neorg/tree-sitter-norg-table\15norg_table\1\0\0\1\2\0\0\17src/parser.c\1\0\2\vbranch\tmain\burl8https://github.com/nvim-neorg/tree-sitter-norg-meta\14norg_meta\17install_info\1\0\0\nfiles\1\3\0\0\17src/parser.c\19src/scanner.cc\1\0\2\vbranch\tmain\burl3https://github.com/nvim-neorg/tree-sitter-norg\tnorg\23get_parser_configs\28nvim-treesitter.parsers\frequire\0", "config", "neorg")
time([[Config for neorg]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\6\0\f\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\3\0005\4\5\0005\5\4\0=\5\6\4=\4\a\0034\4\3\0005\5\b\0>\5\1\4=\4\t\3=\3\v\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\3\15text_align\vcenter\rfiletype\rNvimTree\ttext\18File Explorer\15highlights\20buffer_selected\1\0\0\1\0\3\bgui\tbold\nguifg\f#282828\nguibg\f#a89984\1\0\6\22show_buffer_icons\1\20show_close_icon\1\15close_icon\5\27always_show_bufferline\1\20max_name_length\3\18\22buffer_close_icon\5\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nc\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\nnumhl\1\14word_diff\1\vlinehl\1\15signcolumn\1\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\nG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fcontext\3d\nsetup\rtwilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\ns\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\tview\1\0\1\16auto_resize\2\1\0\2\15update_cwd\2\15auto_close\2\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: vim-ultest
time([[Config for vim-ultest]], true)
try_loadstring("\27LJ\2\n�\4\0\0\4\0\a\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0+\3\1\0B\0\3\1K\0\1\0�\3                hi UltestPass ctermfg=Green guifg=#96F291\n                hi UltestFail ctermfg=Red guifg=#F70067\n                hi UltestRunning ctermfg=Yellow guifg=#FFEC63\n                hi UltestBorder ctermfg=Red guifg=#F70067\n                hi UltestSummaryInfo ctermfg=cyan guifg=#00F1F5 gui=bold cterm=bold\n                hi link UltestSummaryFile UltestSummaryInfo\n                hi link UltestSummaryNamespace UltestSummaryInfo\n              \14nvim_exec\bapi\bvim\nsetup\vultest\frequire\0", "config", "vim-ultest")
time([[Config for vim-ultest]], false)
-- Config for: nvim-dd
time([[Config for nvim-dd]], true)
try_loadstring("\27LJ\2\nB\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\ftimeout\3�\1\nsetup\add\frequire\0", "config", "nvim-dd")
time([[Config for nvim-dd]], false)
-- Config for: nvim-scrollbar
time([[Config for nvim-scrollbar]], true)
try_loadstring("\27LJ\2\n�\6\0\0\6\0\18\0\0266\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\6\0005\3\a\0=\3\b\0025\3\f\0005\4\n\0005\5\t\0=\5\v\4=\4\r\3=\3\14\0025\3\15\0=\3\16\2B\0\2\0016\0\3\0'\2\17\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\30scrollbar.handlers.search\rhandlers\1\0\2\vsearch\2\15diagnostic\2\nmarks\vSearch\1\0\0\ttext\1\0\3\rpriority\3\0\ncolor\vyellow\14highlight\14IncSearch\1\3\0\0\6-\6=\vhandle\1\0\3\24hide_if_all_visible\2\14highlight\vVisual\ttext\6 \1\0\1\tshow\2\nsetup\14scrollbar\frequire�\4\n        noremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR>\n            \\<Cmd>lua require('hlslens').start()<CR>\n        noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR>\n                    \\<Cmd>lua require('hlslens').start()<CR>\n        noremap * *<Cmd>lua require('hlslens').start()<CR>``\n        noremap # #<Cmd>lua require('hlslens').start()<CR>\n        noremap g* g*<Cmd>lua require('hlslens').start()<CR>\n        noremap g# g#<Cmd>lua require('hlslens').start()<CR>\n\n        \bcmd\bvim\0", "config", "nvim-scrollbar")
time([[Config for nvim-scrollbar]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\ne\0\0\3\0\5\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0B\0\1\1K\0\1\0\22insert_highlights\18hop.highlight\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
