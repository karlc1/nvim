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
local package_path_str = "/home/karl/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/karl/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/karl/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/karl/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/karl/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\n~\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\npaths\1\0\0\1\2\0\0\28~/.config/nvim/snippets\14lazy_load luasnip/loaders/from_vscode\frequire\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\6\0\r\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\v\0005\3\3\0005\4\5\0005\5\4\0=\5\6\4=\4\a\0034\4\3\0005\5\b\0>\5\1\0045\5\t\0>\5\2\4=\4\n\3=\3\f\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\3\15text_align\vcenter\ttextT──────────── Files ────────────\rfiletype\rneo-tree\1\0\3\15text_align\vcenter\ttext\18File Explorer\rfiletype\rNvimTree\15highlights\20buffer_selected\1\0\0\1\0\3\nguibg\f#a89984\bgui\tbold\nguifg\f#282828\1\0\6\15close_icon\5\27always_show_bufferline\1\20max_name_length\3\18\22buffer_close_icon\5\22show_buffer_icons\1\20show_close_icon\1\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  catppuccin = {
    config = { "\27LJ\2\n�\1\0\0\4\0\f\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\b\0005\3\a\0=\3\t\2B\0\2\0016\0\0\0009\0\n\0'\2\v\0B\0\2\1K\0\1\0\27colorscheme catppuccin\bcmd\17dim_inactive\1\0\0\1\0\3\fenabled\1\nshade\tdark\15percentage\4��̙\3���\3\nsetup\15catppuccin\frequire\nmocha\23catppuccin_flavour\6g\bvim\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n�\19\0\0\4\0!\00056\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0006\0\0\0009\0\1\0005\1\f\0005\2\n\0005\3\t\0=\3\v\2=\2\r\0015\2\15\0005\3\14\0=\3\v\2=\2\16\0015\2\18\0005\3\17\0=\3\v\2=\2\19\0015\2\21\0005\3\20\0=\3\v\2=\2\22\0015\2\24\0005\3\23\0=\3\v\2=\2\25\0015\2\27\0005\3\26\0=\3\v\2=\2\28\1=\1\b\0006\0\0\0009\0\29\0'\2\30\0B\0\2\0016\0\0\0009\0\29\0'\2\31\0B\0\2\0016\0\0\0009\0\29\0'\2 \0B\0\2\1K\0\1\0\"hi! link dashboardCenter Type$hi! link dashboardHeader String�\1autocmd FileType dashboard setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs=  | autocmd WinLeave <buffer> set showtabline=2 \bcmd\6f\1\0\1\fcommand0:cd ~/.config/nvim | :e lua/keymappings.lua\1\2\0\0\31  ✎  Keymapping Config  \6e\1\0\1\fcommand,:cd ~/.config/nvim | :e lua/plugins.lua\1\2\0\0\31  ✎  Plugin Config      \6d\1\0\1\fcommand%:cd ~/.config/nvim | :e init.lua\1\2\0\0\31  ✎  Nvim Config        \6c\1\0\1\fcommand\24Telescope live_grep\1\2\0\0\31    Find Word          \6b\1\0\1\fcommand\23Telescope oldfiles\1\2\0\0\31    Recent Files       \6a\1\0\0\16description\1\0\1\fcommand�\1lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 0, previewer=false, layout_config = { height= 100 } }))\1\2\0\0\31    Find File          \29dashboard_custom_section\1\2\0\0\5\28dashboard_custom_footer\14telescope dashboard_default_executive\1\16\0\0\5R   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆               ^    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦             T          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄           T           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄          V          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀         f   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄        ^  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄         j ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄        d ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄       V      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆           \\       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃           V     ⢰⣶  ⣶ ⢶⣆⢀⣶⠂⣶⡶⠶⣦⡄⢰⣶⠶⢶⣦  ⣴⣶           Z     ⢸⣿⠶⠶⣿ ⠈⢻⣿⠁ ⣿⡇ ⢸⣿⢸⣿⢶⣾⠏ ⣸⣟⣹⣧          X     ⠸⠿  ⠿  ⠸⠿  ⠿⠷⠶⠿⠃⠸⠿⠄⠙⠷⠤⠿⠉⠉⠿⠆         \28dashboard_custom_header\6g\bvim\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/dashboard-nvim",
    url = "https://github.com/karlc1/dashboard-nvim"
  },
  ["feline.nvim"] = {
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/feline.nvim",
    url = "https://github.com/feline-nvim/feline.nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\a\0\b\0\0145\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\0026\4\2\0009\4\5\0049\4\6\4)\6\0\0B\4\2\0A\2\0\2>\2\2\1=\1\a\0L\0\2\0\targs\22nvim_buf_get_name\bapi\16shellescape\afn\bvim\1\4\0\0\21--stdin-filepath\0\19--single-quote\1\0\2\nstdin\2\bexe\rprettierN\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\4\0\0\19--indent-count\3\2\f--stdin\1\0\2\nstdin\2\bexe\vluafmts\0\0\5\0\6\1\n5\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2)\4\0\0B\2\2\0?\2\0\0=\1\5\0L\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\2\0\0\a-w\1\0\2\nstdin\1\bexe\14goimports\5����\4�\1\0\0\a\0\b\1\0145\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\0026\4\2\0009\4\5\0049\4\6\4)\6\0\0B\4\2\0A\2\0\0?\2\0\0=\1\a\0L\0\2\0\targs\22nvim_buf_get_name\bapi\16fnameescape\afn\bvim\1\2\0\0)--in-place --aggressive --aggressive\1\0\2\nstdin\1\bexe\24python3 -m autopep8\5����\4�\3\1\0\a\0\25\0:3\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\23\0005\4\4\0004\5\3\0>\0\1\5=\5\5\0044\5\3\0>\0\1\5=\5\6\0044\5\3\0>\0\1\5=\5\a\0044\5\3\0>\0\1\5=\5\b\0044\5\3\0>\0\1\5=\5\t\0044\5\3\0>\0\1\5=\5\n\0044\5\3\0>\0\1\5=\5\v\0044\5\3\0>\0\1\5=\5\f\0044\5\3\0>\0\1\5=\5\r\0044\5\3\0>\0\1\5=\5\14\0044\5\3\0>\0\1\5=\5\15\0044\5\3\0>\0\1\5=\5\16\0044\5\3\0003\6\17\0>\6\1\5=\5\18\0044\5\3\0003\6\19\0>\6\1\5=\5\20\0044\5\3\0003\6\21\0>\6\1\5=\5\22\4=\4\24\3B\1\2\1K\0\1\0\rfiletype\1\0\0\vpython\0\ago\0\blua\0\byml\tyaml\njsonc\tjson\rmarkdown\20typescriptreact\15typescript\20javascriptreact\15javascript\thtml\tscss\bcss\1\0\0\nsetup\14formatter\frequire\0\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nc\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\15signcolumn\1\vlinehl\1\nnumhl\1\14word_diff\1\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox-baby"] = {
    config = { "\27LJ\2\nD\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\tdark\"gruvbox_baby_background_color\6g\bvim\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/gruvbox-baby",
    url = "https://github.com/luisiacc/gruvbox-baby"
  },
  ["guess-indent.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17guess-indent\frequire\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/guess-indent.nvim",
    url = "https://github.com/nmac427/guess-indent.nvim"
  },
  ["hlargs.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vhlargs\frequire\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/hlargs.nvim",
    url = "https://github.com/m-demare/hlargs.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\6\1\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\3\0006\3\0\0'\5\1\0B\3\2\0029\3\2\0035\5\3\0B\3\2\0?\3\0\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\22insert_highlights\18hop.highlight\1\0\1\tkeys\14asdfghjkl\nsetup\bhop\frequire\3����\4\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\3\0\b\0\0156\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\a\0B\0\2\1K\0\1\0\1\0\3\25show_current_context\2\25space_char_blankline\6 \fenabled\1\nsetup\21indent_blankline\frequire0hi IndentBlanklineContextChar guifg=#53525c)hi IndentBlanklineChar guifg=#39383f\bcmd\bvim\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["inspired-github.vim"] = {
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/inspired-github.vim",
    url = "https://github.com/mvpopuk/inspired-github.vim"
  },
  ["lsp-rooter.nvim"] = {
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/lsp-rooter.nvim",
    url = "https://github.com/ahmedkhalf/lsp-rooter.nvim"
  },
  ["lsp_lines.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14lsp_lines\frequire\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\n}\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\17handler_opts\1\0\1\vborder\frounded\1\0\2\tbind\2\16hint_prefix\6H\nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["mini.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19mini.bufremove\frequire\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/mini.nvim",
    url = "https://github.com/echasnovski/mini.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\n�\16\0\0\6\0005\0S6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\3\0009\0\4\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\3\0009\0\4\0'\2\t\0005\3\n\0B\0\3\0016\0\0\0009\0\3\0009\0\4\0'\2\v\0005\3\f\0B\0\3\0016\0\r\0'\2\14\0B\0\2\0029\0\15\0005\2\16\0005\3\18\0005\4\17\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\27\0005\5\26\0=\5\28\4=\4\29\3=\3\30\0025\3\31\0005\4 \0=\4!\3=\3\"\0024\3\0\0=\3#\0025\3(\0005\4$\0005\5%\0=\5&\0044\5\0\0=\5'\4=\4)\0035\4+\0005\5*\0=\5!\4=\4\"\3=\3,\0025\3-\0005\4/\0005\5.\0=\5!\4=\4\"\3=\0030\0025\0033\0005\0041\0005\0052\0=\5!\4=\4\"\3=\3\29\2B\0\2\0016\0\0\0009\0\1\0'\0024\0B\0\2\1K\0\1\0#nnoremap \\ :Neotree reveal<cr>\1\0\0\1\0\a\agp\rgit_push\agg\24git_commit_and_push\agr\20git_revert_file\aga\17git_add_file\6A\16git_add_all\agu\21git_unstage_file\agc\15git_commit\1\0\1\rposition\nfloat\fbuffers\1\0\0\1\0\3\6.\rset_root\abd\18buffer_delete\t<bs>\16navigate_up\1\0\1\18show_unloaded\2\15filesystem\1\0\0\1\0\6\6H\18toggle_hidden\n<c-x>\17clear_filter\t<bs>\16navigate_up\6f\21filter_on_submit\6/\17fuzzy_finder\6.\rset_root\19filtered_items\1\0\3\26hijack_netrw_behavior\17open_default\27use_libuv_file_watcher\1\24follow_current_file\2\15never_show\17hide_by_name\1\3\0\0\14.DS_Store\14thumbs.db\1\0\3\fvisible\1\20hide_gitignored\2\18hide_dotfiles\1\18nesting_rules\vwindow\rmappings\1\0\18\6c\tcopy\6y\22copy_to_clipboard\6r\vrename\6d\vdelete\6t\16open_tabnew\6A\18add_directory\6C\15close_node\6x\21cut_to_clipboard\6s\16open_vsplit\6S\15open_split\18<2-LeftMouse>\topen\f<space>\16toggle_node\t<cr>\topen\6R\frefresh\6q\17close_window\6m\tmove\6a\badd\6p\25paste_from_clipboard\1\0\2\rposition\tleft\nwidth\3(\30default_component_configs\15git_status\fsymbols\1\0\0\1\0\a\frenamed\5\fdeleted\5\rconflict\b\vstaged\5\runstaged\5\fignored\5\14untracked\5\tname\1\0\2\26use_git_status_colors\2\19trailing_slash\1\rmodified\1\0\1\14highlight\20NeoTreeModified\ticon\1\0\4\18folder_closed\b\17folder_empty\bﰊ\fdefault\6*\16folder_open\b\vindent\1\0\0\1\0\t\14highlight\24NeoTreeIndentMarker\23last_indent_marker\b└\18indent_marker\b│\17with_markers\2\fpadding\3\1\16indent_size\3\2\23expander_highlight\20NeoTreeExpander\22expander_expanded\b\23expander_collapsed\b\1\0\4\23popup_border_style\frounded\23enable_diagnostics\1\22enable_git_status\2\25close_if_last_window\2\nsetup\rneo-tree\frequire\1\0\2\ttext\b\vtexthl\23DiagnosticSignHint\23DiagnosticSignHint\1\0\2\ttext\t \vtexthl\23DiagnosticSignInfo\23DiagnosticSignInfo\1\0\2\ttext\t \vtexthl\23DiagnosticSignWarn\23DiagnosticSignWarn\1\0\2\ttext\t \vtexthl\24DiagnosticSignError\24DiagnosticSignError\16sign_define\afn0 let g:neo_tree_remove_legacy_commands = 1 \bcmd\bvim\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  neorg = {
    config = { "\27LJ\2\n�\b\0\0\b\0002\0F6\0\0\0009\0\1\0)\1\2\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\5\0'\2\6\0B\0\2\0029\0\a\0B\0\1\0025\1\f\0005\2\t\0005\3\n\0=\3\v\2=\2\r\1=\1\b\0005\1\17\0005\2\15\0005\3\16\0=\3\v\2=\2\r\1=\1\14\0005\1\21\0005\2\19\0005\3\20\0=\3\v\2=\2\r\1=\1\18\0006\1\5\0'\3\22\0B\1\2\0029\1\23\0015\0030\0005\4\24\0004\5\0\0=\5\25\0045\5\27\0005\6\26\0=\6\28\5=\5\29\0045\5!\0005\6\31\0005\a\30\0=\a \6=\6\28\5=\5\"\0045\5$\0005\6#\0=\6\28\5=\5%\0045\5'\0005\6&\0=\6\28\5=\5(\0044\5\0\0=\5)\0045\5+\0005\6*\0=\6\28\5=\5,\0045\5.\0005\6-\0=\6\28\5=\5/\4=\0041\3B\1\2\1K\0\1\0\tload\1\0\0\19core.presenter\1\0\0\1\0\1\rzen_mode\rzen-mode\18core.gtd.base\1\0\0\1\0\1\14workspace\thome core.integrations.telescope\18core.keybinds\1\0\0\1\0\2\21default_keybinds\2\17neorg_leader\14<Leader>o\25core.norg.completion\1\0\0\1\0\1\vengine\rnvim-cmp\21core.norg.dirman\1\0\0\15workspaces\1\0\0\1\0\1\thome\f~/neorg\24core.norg.concealer\vconfig\1\0\0\1\0\1\18markup_preset\nbrave\18core.defaults\1\0\0\nsetup\nneorg\1\0\0\1\2\0\0\17src/parser.c\1\0\2\burl9https://github.com/nvim-neorg/tree-sitter-norg-table\vbranch\tmain\15norg_table\1\0\0\1\2\0\0\17src/parser.c\1\0\2\burl8https://github.com/nvim-neorg/tree-sitter-norg-meta\vbranch\tmain\14norg_meta\17install_info\1\0\0\nfiles\1\3\0\0\17src/parser.c\19src/scanner.cc\1\0\2\burl3https://github.com/nvim-neorg/tree-sitter-norg\vbranch\tmain\tnorg\23get_parser_configs\28nvim-treesitter.parsers\frequire\6n\18concealcursor\17conceallevel\bopt\bvim\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/neorg",
    url = "https://github.com/nvim-neorg/neorg"
  },
  ["neorg-telescope"] = {
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/neorg-telescope",
    url = "https://github.com/nvim-neorg/neorg-telescope"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\n�\4\0\0\4\0 \00026\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0014\0\0\0005\1\4\0005\2\5\0>\2\2\1=\1\3\0005\1\a\0005\2\b\0>\2\2\1=\1\6\0005\1\n\0005\2\v\0>\2\2\1=\1\t\0005\1\r\0005\2\14\0>\2\2\1=\1\f\0005\1\16\0005\2\17\0>\2\2\1=\1\15\0005\1\19\0005\2\20\0>\2\2\1=\1\18\0005\1\22\0005\2\23\0>\2\2\1=\1\21\0005\1\25\0005\2\26\0>\2\2\1=\1\24\0005\1\28\0005\2\29\0>\2\2\1=\1\27\0006\1\0\0'\3\30\0B\1\2\0029\1\31\1\18\3\0\0B\1\2\1K\0\1\0\17set_mappings\21neoscroll.config\1\2\0\0\b150\1\2\0\0\azb\azb\1\2\0\0\b150\1\2\0\0\azz\azz\1\2\0\0\b150\1\2\0\0\azt\azt\1\4\0\0\t0.10\nfalse\b100\1\2\0\0\vscroll\n<C-e>\1\4\0\0\n-0.10\nfalse\b100\1\2\0\0\vscroll\n<C-y>\1\4\0\0#vim.api.nvim_win_get_height(0)\ttrue\b450\1\2\0\0\vscroll\n<C-f>\1\4\0\0$-vim.api.nvim_win_get_height(0)\ttrue\b450\1\2\0\0\vscroll\n<C-b>\1\4\0\0\18vim.wo.scroll\ttrue\b100\1\2\0\0\vscroll\n<C-d>\1\4\0\0\19-vim.wo.scroll\ttrue\b100\1\2\0\0\vscroll\n<C-u>\nsetup\14neoscroll\frequire\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  neotest = {
    config = { "\27LJ\2\nn\0\0\a\0\6\1\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0004\3\3\0006\4\0\0'\6\3\0B\4\2\0?\4\0\0=\3\5\2B\0\2\1K\0\1\0\radapters\1\0\0\15neotest-go\nsetup\fneotest\frequire\3����\4\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/neotest",
    url = "https://github.com/rcarriga/neotest"
  },
  ["neotest-go"] = {
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/neotest-go",
    url = "https://github.com/akinsho/neotest-go"
  },
  ["neovim-ayu"] = {
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/neovim-ayu",
    url = "https://github.com/Shatur/neovim-ayu"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\a\0\17\0+6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\v\0004\3\5\0006\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\0049\4\5\4>\4\1\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\6\0049\4\a\4>\4\2\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\0049\4\b\4>\4\3\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\t\0049\4\n\4>\4\4\3=\3\f\2B\0\2\0016\0\r\0009\0\14\0009\0\15\0'\2\16\0+\3\2\0B\0\3\1K\0\1\0�\1            augroup FormatAutogroup\n              autocmd!\n              autocmd BufWritePost * silent lua vim.lsp.buf.format()\n            augroup END\n            \14nvim_exec\bapi\bvim\fsources\1\0\0\fluasnip\15completion\ngofmt\veslint\16diagnostics\vstylua\15formatting\rbuiltins\nsetup\fnull-ls\frequire\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire�\1\0\1\a\1\v\2(6\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\2\23\1\0\1-\2\0\0009\2\4\2B\2\1\2\15\0\2\0X\3\4�-\2\0\0009\2\5\2B\2\1\1X\2\24�\b\1\1\0X\2\16�6\2\0\0009\2\1\0029\2\6\2'\4\3\0B\2\2\2\18\4\2\0009\2\a\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\b\2'\5\t\0B\2\3\2\15\0\2\0X\3\3�\18\2\0\0B\2\1\1X\2\3�-\2\0\0009\2\n\2B\2\1\1K\0\1\0\0�\rcomplete\a%s\nmatch\bsub\fgetline\21select_next_item\fvisible\6.\bcol\afn\bvim\2\0R\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\21select_prev_item\fvisible�\a\1\0\t\0:\0i6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\0016\0\4\0'\2\5\0B\0\2\0029\1\6\0005\3\t\0009\4\a\0009\4\b\4=\4\n\0035\4\f\0003\5\v\0=\5\r\4=\4\14\0035\4\15\0005\5\16\0=\5\17\4=\4\17\0035\4\25\0004\5\6\0009\6\18\0009\6\19\0069\6\20\6>\6\1\0059\6\18\0009\6\19\0069\6\21\6>\6\2\0059\6\18\0009\6\19\0069\6\22\6>\6\3\0059\6\18\0009\6\19\0069\6\23\6>\6\4\0059\6\18\0009\6\19\0069\6\24\6>\6\5\5=\5\26\4=\4\27\0035\4\30\0009\5\28\0009\5\29\5B\5\1\2=\5\31\0049\5\28\0009\5 \5)\a��B\5\2\2=\5!\0049\5\28\0009\5 \5)\a\1\0B\5\2\2=\5\"\0049\5\28\0009\5#\5B\5\1\2=\5$\0049\5\28\0009\5%\0055\a&\0009\b'\0009\b(\b=\b)\aB\5\2\2=\5*\0043\5+\0=\5,\0043\5-\0=\5.\4=\4\28\0039\4\18\0009\4/\0044\6\b\0005\a0\0>\a\1\0065\a1\0>\a\2\0065\a2\0>\a\3\0065\a3\0>\a\4\0065\a4\0>\a\5\0065\a5\0>\a\6\0065\a6\0>\a\a\0064\a\3\0005\b7\0>\b\1\aB\4\3\2=\4/\0035\0048\0=\0049\3B\1\2\0012\0\0�K\0\1\0\17experimental\1\0\1\15ghost_text\2\1\0\1\tname\vbuffer\1\0\1\tname\17cmp-nvim-lua\1\0\1\tname\16cmp-luasnip\1\0\1\tname\fluasnip\1\0\1\tname\forgmode\1\0\1\tname\nneorg\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\fsources\f<S-Tab>\0\n<Tab>\0\t<CR>\rbehavior\vInsert\20ConfirmBehavior\1\0\1\vselect\2\fconfirm\n<ESC>\nabort\n<C-d>\n<C-u>\16scroll_docs\14<C-Space>\1\0\0\rcomplete\fmapping\fsorting\16comparators\1\0\0\nexact\vlength\tkind\voffset\norder\fcompare\vconfig\15completion\1\0\1\16completeopt\26menu,menuone,noinsert\1\0\1\17autocomplete\1\fsnippet\vexpand\1\0\0\0\14preselect\1\0\0\tNone\18PreselectMode\nsetup\bcmp\frequire\21set pumheight=10\14nvim_exec\bapi\bvim\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\nf\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\21operator_mapping\agc\20create_mappings\1\nsetup\17nvim_comment\frequire\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/nvim-comment",
    url = "https://github.com/terrortylor/nvim-comment"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n�\3\0\0\4\0\n\0\0216\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\4\0009\0\5\0'\2\6\0005\3\a\0B\0\3\0016\0\0\0009\0\4\0009\0\5\0'\2\b\0005\3\t\0B\0\3\1K\0\1\0\1\0\4\ttext\b→\vlinehl\vVisual\vtexthl\17DebugStopped\nnumhl\5\15DapStopped\1\0\4\ttext\b⊚\vlinehl\5\vtexthl\20DebugBreakpoint\nnumhl\5\18DapBreakpoint\16sign_define\afnrexec 'hi DebugStopped guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('WarningMsg'),'fg')pexec 'hi DebugBreakpoint guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('Error'),'fg')\bcmd\bvim\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-go"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vdap-go\frequire\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/nvim-dap-go",
    url = "https://github.com/leoluz/nvim-dap-go"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n�\3\0\0\4\0\r\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0'\2\5\0B\0\2\0016\0\3\0009\0\4\0'\2\6\0B\0\2\0016\0\3\0009\0\a\0009\0\b\0'\2\t\0005\3\n\0B\0\3\0016\0\3\0009\0\a\0009\0\b\0'\2\v\0005\3\f\0B\0\3\1K\0\1\0\1\0\4\ttext\b→\vlinehl\vVisual\vtexthl\17DebugStopped\nnumhl\5\15DapStopped\1\0\4\ttext\b\vlinehl\5\vtexthl\20DebugBreakpoint\nnumhl\5\18DapBreakpoint\16sign_define\afnrexec 'hi DebugStopped guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('WarningMsg'),'fg')pexec 'hi DebugBreakpoint guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('Error'),'fg')\bcmd\bvim\nsetup\ndapui\frequire\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-dd"] = {
    config = { "\27LJ\2\nB\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\ftimeout\3�\1\nsetup\add\frequire\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/nvim-dd",
    url = "https://gitlab.com/yorickpeterse/nvim-dd"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-scrollbar"] = {
    config = { "\27LJ\2\n�\2\0\0\6\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\t\0005\4\a\0005\5\6\0=\5\b\4=\4\n\3=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\rhandlers\1\0\2\15diagnostic\2\vsearch\1\nmarks\vSearch\1\0\0\ttext\1\0\3\ncolor\vyellow\rpriority\3\0\14highlight\14IncSearch\1\3\0\0\6-\6=\vhandle\1\0\3\14highlight\vVisual\24hide_if_all_visible\2\ttext\6 \1\0\1\tshow\1\nsetup\14scrollbar\frequire\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\3\0\0\5\0\15\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0004\4\0\0=\4\v\0035\4\f\0=\4\r\3=\3\14\2B\0\2\1K\0\1\0\15playground\16keybindings\1\0\n\21toggle_hl_groups\6i\24toggle_query_editor\6o\14show_help\6?\14goto_node\t<cr>\vupdate\6R\21unfocus_language\6F\19focus_language\6f\28toggle_language_display\6I\27toggle_anonymous_nodes\6a\30toggle_injected_languages\6t\fdisable\1\0\3\venable\2\20persist_queries\1\15updatetime\3\25\vindent\1\0\1\venable\1\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\4\0\0\ago\tnorg\15norg_table\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\rpatterns\fdefault\1\0\0\1\n\0\0\nclass\rfunction\vmethod\bfor\nwhile\aif\vswitch\tcase\vreturn\1\0\3\14max_lines\3����\15\venable\2\vzindex\3\20\nsetup\23treesitter-context\frequire\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plantuml-syntax"] = {
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/plantuml-syntax",
    url = "https://github.com/aklt/plantuml-syntax"
  },
  playground = {
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/karl/.local/share/nvim/site/pack/packer/opt/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["stabilize.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14stabilize\frequire\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/stabilize.nvim",
    url = "https://github.com/luukvbaal/stabilize.nvim"
  },
  ["telescope-dap.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bdap\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n�\t\0\0\6\0\23\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\n\0005\4\b\0005\5\t\0=\5\5\4=\4\v\0035\4\f\0005\5\r\0=\5\5\4=\4\14\0035\4\15\0005\5\16\0=\5\5\4=\4\17\3=\3\18\2B\0\2\0016\0\19\0009\0\20\0009\0\21\0'\2\22\0+\3\2\0B\0\3\1K\0\1\0�\5                  highlight TelescopeSelection      guibg=bg gui=bold\n                  highlight TelescopeNormal         guibg=#00000\n                  highlight TelescopeBorder         guifg=#00ff00\n                  highlight TelescopePromptBorder   guifg=#A0A0A0 gui=bold\n                  highlight TelescopeResultsBorder  guifg=#A0A0A0 gui=bold\n                  highlight TelescopePreviewBorder  guifg=#A0A0A0\n                  \" highlight TelescopeTitle          guifg=#ffffff\n\n                  highlight link TelescopeResultsStruct structure\n                  highlight link TelescopeResultsMethod string\n                  highlight link TelescopePromptTitle string\n                  \14nvim_exec\bapi\bvim\fpickers\25lsp_document_symbols\1\0\2\vheight\4\0����\3\nwidth\3<\1\0\4\22symbol_type_width\3d\14previewer\1\17symbol_width\3-\ntheme\rdropdown\14live_grep\1\0\4\19preview_cutoff\3\n\20prompt_position\vbottom\vheight\4��̙\3���\3\nwidth\4�̙�\6�̹�\3\1\0\1\ntheme\bivy\15find_files\1\0\0\1\0\1\vheight\4\0����\3\1\0\2\ntheme\rdropdown\14previewer\1\rdefaults\1\0\0\18layout_config\1\0\2\19preview_cutoff\3\n\20prompt_position\btop\1\0\2\20layout_strategy\tflex\rwinblend\3\0\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["true-zen.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\18ScrollbarHide\bcmd\bvim�\1\1\0\6\0\f\0\0163\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\n\0005\4\6\0005\5\4\0=\0\5\5=\5\a\0045\5\b\0=\0\5\5=\5\t\4=\4\v\3B\1\2\1K\0\1\0\nmodes\1\0\0\rataraxis\1\0\1\19quit_untoggles\2\vnarrow\1\0\0\18open_callback\1\0\2\16run_atarxis\2\16folds_style\14invisible\nsetup\rtrue-zen\frequire\0\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/true-zen.nvim",
    url = "https://github.com/Pocco81/true-zen.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\nG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fcontext\3d\nsetup\rtwilight\frequire\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  vim = {
    loaded = false,
    needs_bufread = false,
    path = "/home/karl/.local/share/nvim/site/pack/packer/opt/vim",
    url = "https://github.com/embark-theme/vim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  vimwiki = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/vimwiki",
    url = "https://github.com/vimwiki/vimwiki"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["yanky.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\t\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0029\0\a\0'\2\b\0B\0\2\1K\0\1\0\17yank_history\19load_extension\14telescope\14highlight\1\0\0\1\0\3\ntimer\3�\1\fon_yank\2\von_put\2\nsetup\nyanky\frequire\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/yanky.nvim",
    url = "https://github.com/gbprod/yanky.nvim"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\2B\0\2\1K\0\1\0\fplugins\rtwilight\1\0\0\1\0\1\fenabled\1\vwindow\1\0\0\foptions\1\0\3\vnumber\1\19relativenumber\1\15signcolumn\ano\1\0\3\nwidth\4�̙�\6�̙�\3\vheight\4�̙�\6�̙�\3\rbackdrop\3\1\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  },
  ["zenbones.nvim"] = {
    loaded = true,
    path = "/home/karl/.local/share/nvim/site/pack/packer/start/zenbones.nvim",
    url = "https://github.com/mcchrish/zenbones.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\n�\4\0\0\4\0 \00026\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0014\0\0\0005\1\4\0005\2\5\0>\2\2\1=\1\3\0005\1\a\0005\2\b\0>\2\2\1=\1\6\0005\1\n\0005\2\v\0>\2\2\1=\1\t\0005\1\r\0005\2\14\0>\2\2\1=\1\f\0005\1\16\0005\2\17\0>\2\2\1=\1\15\0005\1\19\0005\2\20\0>\2\2\1=\1\18\0005\1\22\0005\2\23\0>\2\2\1=\1\21\0005\1\25\0005\2\26\0>\2\2\1=\1\24\0005\1\28\0005\2\29\0>\2\2\1=\1\27\0006\1\0\0'\3\30\0B\1\2\0029\1\31\1\18\3\0\0B\1\2\1K\0\1\0\17set_mappings\21neoscroll.config\1\2\0\0\b150\1\2\0\0\azb\azb\1\2\0\0\b150\1\2\0\0\azz\azz\1\2\0\0\b150\1\2\0\0\azt\azt\1\4\0\0\t0.10\nfalse\b100\1\2\0\0\vscroll\n<C-e>\1\4\0\0\n-0.10\nfalse\b100\1\2\0\0\vscroll\n<C-y>\1\4\0\0#vim.api.nvim_win_get_height(0)\ttrue\b450\1\2\0\0\vscroll\n<C-f>\1\4\0\0$-vim.api.nvim_win_get_height(0)\ttrue\b450\1\2\0\0\vscroll\n<C-b>\1\4\0\0\18vim.wo.scroll\ttrue\b100\1\2\0\0\vscroll\n<C-d>\1\4\0\0\19-vim.wo.scroll\ttrue\b100\1\2\0\0\vscroll\n<C-u>\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\a\0\b\0\0145\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\0026\4\2\0009\4\5\0049\4\6\4)\6\0\0B\4\2\0A\2\0\2>\2\2\1=\1\a\0L\0\2\0\targs\22nvim_buf_get_name\bapi\16shellescape\afn\bvim\1\4\0\0\21--stdin-filepath\0\19--single-quote\1\0\2\nstdin\2\bexe\rprettierN\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\4\0\0\19--indent-count\3\2\f--stdin\1\0\2\nstdin\2\bexe\vluafmts\0\0\5\0\6\1\n5\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2)\4\0\0B\2\2\0?\2\0\0=\1\5\0L\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\2\0\0\a-w\1\0\2\nstdin\1\bexe\14goimports\5����\4�\1\0\0\a\0\b\1\0145\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\0026\4\2\0009\4\5\0049\4\6\4)\6\0\0B\4\2\0A\2\0\0?\2\0\0=\1\a\0L\0\2\0\targs\22nvim_buf_get_name\bapi\16fnameescape\afn\bvim\1\2\0\0)--in-place --aggressive --aggressive\1\0\2\nstdin\1\bexe\24python3 -m autopep8\5����\4�\3\1\0\a\0\25\0:3\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\23\0005\4\4\0004\5\3\0>\0\1\5=\5\5\0044\5\3\0>\0\1\5=\5\6\0044\5\3\0>\0\1\5=\5\a\0044\5\3\0>\0\1\5=\5\b\0044\5\3\0>\0\1\5=\5\t\0044\5\3\0>\0\1\5=\5\n\0044\5\3\0>\0\1\5=\5\v\0044\5\3\0>\0\1\5=\5\f\0044\5\3\0>\0\1\5=\5\r\0044\5\3\0>\0\1\5=\5\14\0044\5\3\0>\0\1\5=\5\15\0044\5\3\0>\0\1\5=\5\16\0044\5\3\0003\6\17\0>\6\1\5=\5\18\0044\5\3\0003\6\19\0>\6\1\5=\5\20\0044\5\3\0003\6\21\0>\6\1\5=\5\22\4=\4\24\3B\1\2\1K\0\1\0\rfiletype\1\0\0\vpython\0\ago\0\blua\0\byml\tyaml\njsonc\tjson\rmarkdown\20typescriptreact\15typescript\20javascriptreact\15javascript\thtml\tscss\bcss\1\0\0\nsetup\14formatter\frequire\0\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: nvim-treesitter-context
time([[Config for nvim-treesitter-context]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\rpatterns\fdefault\1\0\0\1\n\0\0\nclass\rfunction\vmethod\bfor\nwhile\aif\vswitch\tcase\vreturn\1\0\3\14max_lines\3����\15\venable\2\vzindex\3\20\nsetup\23treesitter-context\frequire\0", "config", "nvim-treesitter-context")
time([[Config for nvim-treesitter-context]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nc\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\15signcolumn\1\vlinehl\1\nnumhl\1\14word_diff\1\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: gruvbox-baby
time([[Config for gruvbox-baby]], true)
try_loadstring("\27LJ\2\nD\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\tdark\"gruvbox_baby_background_color\6g\bvim\0", "config", "gruvbox-baby")
time([[Config for gruvbox-baby]], false)
-- Config for: guess-indent.nvim
time([[Config for guess-indent.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17guess-indent\frequire\0", "config", "guess-indent.nvim")
time([[Config for guess-indent.nvim]], false)
-- Config for: hlargs.nvim
time([[Config for hlargs.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vhlargs\frequire\0", "config", "hlargs.nvim")
time([[Config for hlargs.nvim]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\6\1\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\3\0006\3\0\0'\5\1\0B\3\2\0029\3\2\0035\5\3\0B\3\2\0?\3\0\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\22insert_highlights\18hop.highlight\1\0\1\tkeys\14asdfghjkl\nsetup\bhop\frequire\3����\4\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: stabilize.nvim
time([[Config for stabilize.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14stabilize\frequire\0", "config", "stabilize.nvim")
time([[Config for stabilize.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\3\0\b\0\0156\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\a\0B\0\2\1K\0\1\0\1\0\3\25show_current_context\2\25space_char_blankline\6 \fenabled\1\nsetup\21indent_blankline\frequire0hi IndentBlanklineContextChar guifg=#53525c)hi IndentBlanklineChar guifg=#39383f\bcmd\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: telescope-dap.nvim
time([[Config for telescope-dap.nvim]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bdap\19load_extension\14telescope\frequire\0", "config", "telescope-dap.nvim")
time([[Config for telescope-dap.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n~\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\npaths\1\0\0\1\2\0\0\28~/.config/nvim/snippets\14lazy_load luasnip/loaders/from_vscode\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\f\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\b\0005\3\a\0=\3\t\2B\0\2\0016\0\0\0009\0\n\0'\2\v\0B\0\2\1K\0\1\0\27colorscheme catppuccin\bcmd\17dim_inactive\1\0\0\1\0\3\fenabled\1\nshade\tdark\15percentage\4��̙\3���\3\nsetup\15catppuccin\frequire\nmocha\23catppuccin_flavour\6g\bvim\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n�\t\0\0\6\0\23\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\n\0005\4\b\0005\5\t\0=\5\5\4=\4\v\0035\4\f\0005\5\r\0=\5\5\4=\4\14\0035\4\15\0005\5\16\0=\5\5\4=\4\17\3=\3\18\2B\0\2\0016\0\19\0009\0\20\0009\0\21\0'\2\22\0+\3\2\0B\0\3\1K\0\1\0�\5                  highlight TelescopeSelection      guibg=bg gui=bold\n                  highlight TelescopeNormal         guibg=#00000\n                  highlight TelescopeBorder         guifg=#00ff00\n                  highlight TelescopePromptBorder   guifg=#A0A0A0 gui=bold\n                  highlight TelescopeResultsBorder  guifg=#A0A0A0 gui=bold\n                  highlight TelescopePreviewBorder  guifg=#A0A0A0\n                  \" highlight TelescopeTitle          guifg=#ffffff\n\n                  highlight link TelescopeResultsStruct structure\n                  highlight link TelescopeResultsMethod string\n                  highlight link TelescopePromptTitle string\n                  \14nvim_exec\bapi\bvim\fpickers\25lsp_document_symbols\1\0\2\vheight\4\0����\3\nwidth\3<\1\0\4\22symbol_type_width\3d\14previewer\1\17symbol_width\3-\ntheme\rdropdown\14live_grep\1\0\4\19preview_cutoff\3\n\20prompt_position\vbottom\vheight\4��̙\3���\3\nwidth\4�̙�\6�̹�\3\1\0\1\ntheme\bivy\15find_files\1\0\0\1\0\1\vheight\4\0����\3\1\0\2\ntheme\rdropdown\14previewer\1\rdefaults\1\0\0\18layout_config\1\0\2\19preview_cutoff\3\n\20prompt_position\btop\1\0\2\20layout_strategy\tflex\rwinblend\3\0\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n�\3\0\0\6\0\r\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\v\0005\3\3\0005\4\5\0005\5\4\0=\5\6\4=\4\a\0034\4\3\0005\5\b\0>\5\1\0045\5\t\0>\5\2\4=\4\n\3=\3\f\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\3\15text_align\vcenter\ttextT──────────── Files ────────────\rfiletype\rneo-tree\1\0\3\15text_align\vcenter\ttext\18File Explorer\rfiletype\rNvimTree\15highlights\20buffer_selected\1\0\0\1\0\3\nguibg\f#a89984\bgui\tbold\nguifg\f#282828\1\0\6\15close_icon\5\27always_show_bufferline\1\20max_name_length\3\18\22buffer_close_icon\5\22show_buffer_icons\1\20show_close_icon\1\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: lsp_lines.nvim
time([[Config for lsp_lines.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14lsp_lines\frequire\0", "config", "lsp_lines.nvim")
time([[Config for lsp_lines.nvim]], false)
-- Config for: true-zen.nvim
time([[Config for true-zen.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\18ScrollbarHide\bcmd\bvim�\1\1\0\6\0\f\0\0163\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\n\0005\4\6\0005\5\4\0=\0\5\5=\5\a\0045\5\b\0=\0\5\5=\5\t\4=\4\v\3B\1\2\1K\0\1\0\nmodes\1\0\0\rataraxis\1\0\1\19quit_untoggles\2\vnarrow\1\0\0\18open_callback\1\0\2\16run_atarxis\2\16folds_style\14invisible\nsetup\rtrue-zen\frequire\0\0", "config", "true-zen.nvim")
time([[Config for true-zen.nvim]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\n}\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\17handler_opts\1\0\1\vborder\frounded\1\0\2\tbind\2\16hint_prefix\6H\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n�\3\0\0\4\0\n\0\0216\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\4\0009\0\5\0'\2\6\0005\3\a\0B\0\3\0016\0\0\0009\0\4\0009\0\5\0'\2\b\0005\3\t\0B\0\3\1K\0\1\0\1\0\4\ttext\b→\vlinehl\vVisual\vtexthl\17DebugStopped\nnumhl\5\15DapStopped\1\0\4\ttext\b⊚\vlinehl\5\vtexthl\20DebugBreakpoint\nnumhl\5\18DapBreakpoint\16sign_define\afnrexec 'hi DebugStopped guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('WarningMsg'),'fg')pexec 'hi DebugBreakpoint guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('Error'),'fg')\bcmd\bvim\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\nG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fcontext\3d\nsetup\rtwilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
-- Config for: nvim-dap-go
time([[Config for nvim-dap-go]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vdap-go\frequire\0", "config", "nvim-dap-go")
time([[Config for nvim-dap-go]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\2\nf\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\21operator_mapping\agc\20create_mappings\1\nsetup\17nvim_comment\frequire\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)
-- Config for: neorg
time([[Config for neorg]], true)
try_loadstring("\27LJ\2\n�\b\0\0\b\0002\0F6\0\0\0009\0\1\0)\1\2\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\5\0'\2\6\0B\0\2\0029\0\a\0B\0\1\0025\1\f\0005\2\t\0005\3\n\0=\3\v\2=\2\r\1=\1\b\0005\1\17\0005\2\15\0005\3\16\0=\3\v\2=\2\r\1=\1\14\0005\1\21\0005\2\19\0005\3\20\0=\3\v\2=\2\r\1=\1\18\0006\1\5\0'\3\22\0B\1\2\0029\1\23\0015\0030\0005\4\24\0004\5\0\0=\5\25\0045\5\27\0005\6\26\0=\6\28\5=\5\29\0045\5!\0005\6\31\0005\a\30\0=\a \6=\6\28\5=\5\"\0045\5$\0005\6#\0=\6\28\5=\5%\0045\5'\0005\6&\0=\6\28\5=\5(\0044\5\0\0=\5)\0045\5+\0005\6*\0=\6\28\5=\5,\0045\5.\0005\6-\0=\6\28\5=\5/\4=\0041\3B\1\2\1K\0\1\0\tload\1\0\0\19core.presenter\1\0\0\1\0\1\rzen_mode\rzen-mode\18core.gtd.base\1\0\0\1\0\1\14workspace\thome core.integrations.telescope\18core.keybinds\1\0\0\1\0\2\21default_keybinds\2\17neorg_leader\14<Leader>o\25core.norg.completion\1\0\0\1\0\1\vengine\rnvim-cmp\21core.norg.dirman\1\0\0\15workspaces\1\0\0\1\0\1\thome\f~/neorg\24core.norg.concealer\vconfig\1\0\0\1\0\1\18markup_preset\nbrave\18core.defaults\1\0\0\nsetup\nneorg\1\0\0\1\2\0\0\17src/parser.c\1\0\2\burl9https://github.com/nvim-neorg/tree-sitter-norg-table\vbranch\tmain\15norg_table\1\0\0\1\2\0\0\17src/parser.c\1\0\2\burl8https://github.com/nvim-neorg/tree-sitter-norg-meta\vbranch\tmain\14norg_meta\17install_info\1\0\0\nfiles\1\3\0\0\17src/parser.c\19src/scanner.cc\1\0\2\burl3https://github.com/nvim-neorg/tree-sitter-norg\vbranch\tmain\tnorg\23get_parser_configs\28nvim-treesitter.parsers\frequire\6n\18concealcursor\17conceallevel\bopt\bvim\0", "config", "neorg")
time([[Config for neorg]], false)
-- Config for: nvim-dd
time([[Config for nvim-dd]], true)
try_loadstring("\27LJ\2\nB\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\ftimeout\3�\1\nsetup\add\frequire\0", "config", "nvim-dd")
time([[Config for nvim-dd]], false)
-- Config for: vimwiki
time([[Config for vimwiki]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "vimwiki")
time([[Config for vimwiki]], false)
-- Config for: mini.nvim
time([[Config for mini.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19mini.bufremove\frequire\0", "config", "mini.nvim")
time([[Config for mini.nvim]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\2B\0\2\1K\0\1\0\fplugins\rtwilight\1\0\0\1\0\1\fenabled\1\vwindow\1\0\0\foptions\1\0\3\vnumber\1\19relativenumber\1\15signcolumn\ano\1\0\3\nwidth\4�̙�\6�̙�\3\vheight\4�̙�\6�̙�\3\rbackdrop\3\1\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\3\0\0\5\0\15\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0004\4\0\0=\4\v\0035\4\f\0=\4\r\3=\3\14\2B\0\2\1K\0\1\0\15playground\16keybindings\1\0\n\21toggle_hl_groups\6i\24toggle_query_editor\6o\14show_help\6?\14goto_node\t<cr>\vupdate\6R\21unfocus_language\6F\19focus_language\6f\28toggle_language_display\6I\27toggle_anonymous_nodes\6a\30toggle_injected_languages\6t\fdisable\1\0\3\venable\2\20persist_queries\1\15updatetime\3\25\vindent\1\0\1\venable\1\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\4\0\0\ago\tnorg\15norg_table\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\n�\16\0\0\6\0005\0S6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\3\0009\0\4\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\3\0009\0\4\0'\2\t\0005\3\n\0B\0\3\0016\0\0\0009\0\3\0009\0\4\0'\2\v\0005\3\f\0B\0\3\0016\0\r\0'\2\14\0B\0\2\0029\0\15\0005\2\16\0005\3\18\0005\4\17\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\27\0005\5\26\0=\5\28\4=\4\29\3=\3\30\0025\3\31\0005\4 \0=\4!\3=\3\"\0024\3\0\0=\3#\0025\3(\0005\4$\0005\5%\0=\5&\0044\5\0\0=\5'\4=\4)\0035\4+\0005\5*\0=\5!\4=\4\"\3=\3,\0025\3-\0005\4/\0005\5.\0=\5!\4=\4\"\3=\0030\0025\0033\0005\0041\0005\0052\0=\5!\4=\4\"\3=\3\29\2B\0\2\0016\0\0\0009\0\1\0'\0024\0B\0\2\1K\0\1\0#nnoremap \\ :Neotree reveal<cr>\1\0\0\1\0\a\agp\rgit_push\agg\24git_commit_and_push\agr\20git_revert_file\aga\17git_add_file\6A\16git_add_all\agu\21git_unstage_file\agc\15git_commit\1\0\1\rposition\nfloat\fbuffers\1\0\0\1\0\3\6.\rset_root\abd\18buffer_delete\t<bs>\16navigate_up\1\0\1\18show_unloaded\2\15filesystem\1\0\0\1\0\6\6H\18toggle_hidden\n<c-x>\17clear_filter\t<bs>\16navigate_up\6f\21filter_on_submit\6/\17fuzzy_finder\6.\rset_root\19filtered_items\1\0\3\26hijack_netrw_behavior\17open_default\27use_libuv_file_watcher\1\24follow_current_file\2\15never_show\17hide_by_name\1\3\0\0\14.DS_Store\14thumbs.db\1\0\3\fvisible\1\20hide_gitignored\2\18hide_dotfiles\1\18nesting_rules\vwindow\rmappings\1\0\18\6c\tcopy\6y\22copy_to_clipboard\6r\vrename\6d\vdelete\6t\16open_tabnew\6A\18add_directory\6C\15close_node\6x\21cut_to_clipboard\6s\16open_vsplit\6S\15open_split\18<2-LeftMouse>\topen\f<space>\16toggle_node\t<cr>\topen\6R\frefresh\6q\17close_window\6m\tmove\6a\badd\6p\25paste_from_clipboard\1\0\2\rposition\tleft\nwidth\3(\30default_component_configs\15git_status\fsymbols\1\0\0\1\0\a\frenamed\5\fdeleted\5\rconflict\b\vstaged\5\runstaged\5\fignored\5\14untracked\5\tname\1\0\2\26use_git_status_colors\2\19trailing_slash\1\rmodified\1\0\1\14highlight\20NeoTreeModified\ticon\1\0\4\18folder_closed\b\17folder_empty\bﰊ\fdefault\6*\16folder_open\b\vindent\1\0\0\1\0\t\14highlight\24NeoTreeIndentMarker\23last_indent_marker\b└\18indent_marker\b│\17with_markers\2\fpadding\3\1\16indent_size\3\2\23expander_highlight\20NeoTreeExpander\22expander_expanded\b\23expander_collapsed\b\1\0\4\23popup_border_style\frounded\23enable_diagnostics\1\22enable_git_status\2\25close_if_last_window\2\nsetup\rneo-tree\frequire\1\0\2\ttext\b\vtexthl\23DiagnosticSignHint\23DiagnosticSignHint\1\0\2\ttext\t \vtexthl\23DiagnosticSignInfo\23DiagnosticSignInfo\1\0\2\ttext\t \vtexthl\23DiagnosticSignWarn\23DiagnosticSignWarn\1\0\2\ttext\t \vtexthl\24DiagnosticSignError\24DiagnosticSignError\16sign_define\afn0 let g:neo_tree_remove_legacy_commands = 1 \bcmd\bvim\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire�\1\0\1\a\1\v\2(6\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\2\23\1\0\1-\2\0\0009\2\4\2B\2\1\2\15\0\2\0X\3\4�-\2\0\0009\2\5\2B\2\1\1X\2\24�\b\1\1\0X\2\16�6\2\0\0009\2\1\0029\2\6\2'\4\3\0B\2\2\2\18\4\2\0009\2\a\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\b\2'\5\t\0B\2\3\2\15\0\2\0X\3\3�\18\2\0\0B\2\1\1X\2\3�-\2\0\0009\2\n\2B\2\1\1K\0\1\0\0�\rcomplete\a%s\nmatch\bsub\fgetline\21select_next_item\fvisible\6.\bcol\afn\bvim\2\0R\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\21select_prev_item\fvisible�\a\1\0\t\0:\0i6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\0016\0\4\0'\2\5\0B\0\2\0029\1\6\0005\3\t\0009\4\a\0009\4\b\4=\4\n\0035\4\f\0003\5\v\0=\5\r\4=\4\14\0035\4\15\0005\5\16\0=\5\17\4=\4\17\0035\4\25\0004\5\6\0009\6\18\0009\6\19\0069\6\20\6>\6\1\0059\6\18\0009\6\19\0069\6\21\6>\6\2\0059\6\18\0009\6\19\0069\6\22\6>\6\3\0059\6\18\0009\6\19\0069\6\23\6>\6\4\0059\6\18\0009\6\19\0069\6\24\6>\6\5\5=\5\26\4=\4\27\0035\4\30\0009\5\28\0009\5\29\5B\5\1\2=\5\31\0049\5\28\0009\5 \5)\a��B\5\2\2=\5!\0049\5\28\0009\5 \5)\a\1\0B\5\2\2=\5\"\0049\5\28\0009\5#\5B\5\1\2=\5$\0049\5\28\0009\5%\0055\a&\0009\b'\0009\b(\b=\b)\aB\5\2\2=\5*\0043\5+\0=\5,\0043\5-\0=\5.\4=\4\28\0039\4\18\0009\4/\0044\6\b\0005\a0\0>\a\1\0065\a1\0>\a\2\0065\a2\0>\a\3\0065\a3\0>\a\4\0065\a4\0>\a\5\0065\a5\0>\a\6\0065\a6\0>\a\a\0064\a\3\0005\b7\0>\b\1\aB\4\3\2=\4/\0035\0048\0=\0049\3B\1\2\0012\0\0�K\0\1\0\17experimental\1\0\1\15ghost_text\2\1\0\1\tname\vbuffer\1\0\1\tname\17cmp-nvim-lua\1\0\1\tname\16cmp-luasnip\1\0\1\tname\fluasnip\1\0\1\tname\forgmode\1\0\1\tname\nneorg\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\fsources\f<S-Tab>\0\n<Tab>\0\t<CR>\rbehavior\vInsert\20ConfirmBehavior\1\0\1\vselect\2\fconfirm\n<ESC>\nabort\n<C-d>\n<C-u>\16scroll_docs\14<C-Space>\1\0\0\rcomplete\fmapping\fsorting\16comparators\1\0\0\nexact\vlength\tkind\voffset\norder\fcompare\vconfig\15completion\1\0\1\16completeopt\26menu,menuone,noinsert\1\0\1\17autocomplete\1\fsnippet\vexpand\1\0\0\0\14preselect\1\0\0\tNone\18PreselectMode\nsetup\bcmp\frequire\21set pumheight=10\14nvim_exec\bapi\bvim\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: yanky.nvim
time([[Config for yanky.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\t\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0029\0\a\0'\2\b\0B\0\2\1K\0\1\0\17yank_history\19load_extension\14telescope\14highlight\1\0\0\1\0\3\ntimer\3�\1\fon_yank\2\von_put\2\nsetup\nyanky\frequire\0", "config", "yanky.nvim")
time([[Config for yanky.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\n�\3\0\0\a\0\17\0+6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\v\0004\3\5\0006\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\0049\4\5\4>\4\1\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\6\0049\4\a\4>\4\2\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\0049\4\b\4>\4\3\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\t\0049\4\n\4>\4\4\3=\3\f\2B\0\2\0016\0\r\0009\0\14\0009\0\15\0'\2\16\0+\3\2\0B\0\3\1K\0\1\0�\1            augroup FormatAutogroup\n              autocmd!\n              autocmd BufWritePost * silent lua vim.lsp.buf.format()\n            augroup END\n            \14nvim_exec\bapi\bvim\fsources\1\0\0\fluasnip\15completion\ngofmt\veslint\16diagnostics\vstylua\15formatting\rbuiltins\nsetup\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n�\19\0\0\4\0!\00056\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0006\0\0\0009\0\1\0005\1\f\0005\2\n\0005\3\t\0=\3\v\2=\2\r\0015\2\15\0005\3\14\0=\3\v\2=\2\16\0015\2\18\0005\3\17\0=\3\v\2=\2\19\0015\2\21\0005\3\20\0=\3\v\2=\2\22\0015\2\24\0005\3\23\0=\3\v\2=\2\25\0015\2\27\0005\3\26\0=\3\v\2=\2\28\1=\1\b\0006\0\0\0009\0\29\0'\2\30\0B\0\2\0016\0\0\0009\0\29\0'\2\31\0B\0\2\0016\0\0\0009\0\29\0'\2 \0B\0\2\1K\0\1\0\"hi! link dashboardCenter Type$hi! link dashboardHeader String�\1autocmd FileType dashboard setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs=  | autocmd WinLeave <buffer> set showtabline=2 \bcmd\6f\1\0\1\fcommand0:cd ~/.config/nvim | :e lua/keymappings.lua\1\2\0\0\31  ✎  Keymapping Config  \6e\1\0\1\fcommand,:cd ~/.config/nvim | :e lua/plugins.lua\1\2\0\0\31  ✎  Plugin Config      \6d\1\0\1\fcommand%:cd ~/.config/nvim | :e init.lua\1\2\0\0\31  ✎  Nvim Config        \6c\1\0\1\fcommand\24Telescope live_grep\1\2\0\0\31    Find Word          \6b\1\0\1\fcommand\23Telescope oldfiles\1\2\0\0\31    Recent Files       \6a\1\0\0\16description\1\0\1\fcommand�\1lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 0, previewer=false, layout_config = { height= 100 } }))\1\2\0\0\31    Find File          \29dashboard_custom_section\1\2\0\0\5\28dashboard_custom_footer\14telescope dashboard_default_executive\1\16\0\0\5R   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆               ^    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦             T          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄           T           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄          V          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀         f   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄        ^  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄         j ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄        d ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄       V      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆           \\       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃           V     ⢰⣶  ⣶ ⢶⣆⢀⣶⠂⣶⡶⠶⣦⡄⢰⣶⠶⢶⣦  ⣴⣶           Z     ⢸⣿⠶⠶⣿ ⠈⢻⣿⠁ ⣿⡇ ⢸⣿⢸⣿⢶⣾⠏ ⣸⣟⣹⣧          X     ⠸⠿  ⠿  ⠸⠿  ⠿⠷⠶⠿⠃⠸⠿⠄⠙⠷⠤⠿⠉⠉⠿⠆         \28dashboard_custom_header\6g\bvim\0", "config", "dashboard-nvim")
time([[Config for dashboard-nvim]], false)
-- Config for: neotest
time([[Config for neotest]], true)
try_loadstring("\27LJ\2\nn\0\0\a\0\6\1\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0004\3\3\0006\4\0\0'\6\3\0B\4\2\0?\4\0\0=\3\5\2B\0\2\1K\0\1\0\radapters\1\0\0\15neotest-go\nsetup\fneotest\frequire\3����\4\0", "config", "neotest")
time([[Config for neotest]], false)
-- Config for: nvim-scrollbar
time([[Config for nvim-scrollbar]], true)
try_loadstring("\27LJ\2\n�\2\0\0\6\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\t\0005\4\a\0005\5\6\0=\5\b\4=\4\n\3=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\rhandlers\1\0\2\15diagnostic\2\vsearch\1\nmarks\vSearch\1\0\0\ttext\1\0\3\ncolor\vyellow\rpriority\3\0\14highlight\14IncSearch\1\3\0\0\6-\6=\vhandle\1\0\3\14highlight\vVisual\24hide_if_all_visible\2\ttext\6 \1\0\1\tshow\1\nsetup\14scrollbar\frequire\0", "config", "nvim-scrollbar")
time([[Config for nvim-scrollbar]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n�\3\0\0\4\0\r\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0'\2\5\0B\0\2\0016\0\3\0009\0\4\0'\2\6\0B\0\2\0016\0\3\0009\0\a\0009\0\b\0'\2\t\0005\3\n\0B\0\3\0016\0\3\0009\0\a\0009\0\b\0'\2\v\0005\3\f\0B\0\3\1K\0\1\0\1\0\4\ttext\b→\vlinehl\vVisual\vtexthl\17DebugStopped\nnumhl\5\15DapStopped\1\0\4\ttext\b\vlinehl\5\vtexthl\20DebugBreakpoint\nnumhl\5\18DapBreakpoint\16sign_define\afnrexec 'hi DebugStopped guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('WarningMsg'),'fg')pexec 'hi DebugBreakpoint guibg=' . synIDattr(hlID('Normal'),'bg') ' guifg=' . synIDattr(hlID('Error'),'fg')\bcmd\bvim\nsetup\ndapui\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
