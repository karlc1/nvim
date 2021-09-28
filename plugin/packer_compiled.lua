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
  local success, result = pcall(loadstring(s))
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
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n‚\2\0\0\6\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\5\0005\5\4\0=\5\6\4=\4\a\3=\3\t\2B\0\2\1K\0\1\0\foptions\1\0\0\15highlights\20buffer_selected\1\0\0\1\0\3\nguibg\f#a89984\bgui\tbold\nguifg\f#282828\1\0\5\22show_buffer_icons\1\20show_close_icon\1\15close_icon\5\27always_show_bufferline\1\20max_name_length\3\18\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\nÔ\4\0\0\4\0 \00016\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0014\0\0\0005\1\4\0005\2\5\0>\2\2\1=\1\3\0005\1\a\0005\2\b\0>\2\2\1=\1\6\0005\1\n\0005\2\v\0>\2\2\1=\1\t\0005\1\r\0005\2\14\0>\2\2\1=\1\f\0005\1\16\0005\2\17\0>\2\2\1=\1\15\0005\1\19\0005\2\20\0>\2\2\1=\1\18\0005\1\22\0005\2\23\0>\2\2\1=\1\21\0005\1\25\0005\2\26\0>\2\2\1=\1\24\0005\1\28\0005\2\29\0>\2\2\1=\1\27\0006\1\0\0'\3\30\0B\1\2\0029\1\31\1\18\3\0\0B\1\2\1K\0\1\0\17set_mappings\21neoscroll.config\1\2\0\0\b250\1\2\0\0\azb\azb\1\2\0\0\b250\1\2\0\0\azz\azz\1\2\0\0\b250\1\2\0\0\azt\azt\1\4\0\0\t0.10\nfalse\b100\1\2\0\0\vscroll\n<C-e>\1\4\0\0\n-0.10\nfalse\b100\1\2\0\0\vscroll\n<C-y>\1\4\0\0#vim.api.nvim_win_get_height(0)\ttrue\b450\1\2\0\0\vscroll\n<C-f>\1\4\0\0$-vim.api.nvim_win_get_height(0)\ttrue\b450\1\2\0\0\vscroll\n<C-b>\1\4\0\0\18vim.wo.scroll\ttrue\b250\1\2\0\0\vscroll\n<C-d>\1\4\0\0\19-vim.wo.scroll\ttrue\b250\1\2\0\0\vscroll\n<C-u>\nsetup\14neoscroll\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nö\1\0\1\a\1\v\2)6\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\2\23\1\0\0016\2\0\0009\2\1\0029\2\4\2B\2\1\2\t\2\0\0X\2\4€-\2\0\0009\2\5\2B\2\1\1X\2\24€\b\1\1\0X\2\16€6\2\0\0009\2\1\0029\2\6\2'\4\3\0B\2\2\2\18\4\2\0009\2\a\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\b\2'\5\t\0B\2\3\2\15\0\2\0X\3\3€\18\2\0\0B\2\1\1X\2\3€-\2\0\0009\2\n\2B\2\1\1K\0\1\0\0À\rcomplete\a%s\nmatch\bsub\fgetline\21select_next_item\15pumvisible\6.\bcol\afn\bvim\2\0a\0\1\3\1\4\1\r6\1\0\0009\1\1\0019\1\2\1B\1\1\2\t\1\0\0X\1\4€-\1\0\0009\1\3\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\21select_prev_item\15pumvisible\afn\bvim\2¤\5\1\0\t\0*\0O6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\5\0009\4\3\0009\4\4\4=\4\6\0035\4\a\0005\5\b\0=\5\t\4=\4\t\0035\4\18\0004\5\a\0009\6\n\0009\6\v\0069\6\f\6>\6\1\0059\6\n\0009\6\v\0069\6\r\6>\6\2\0059\6\n\0009\6\v\0069\6\14\6>\6\3\0059\6\n\0009\6\v\0069\6\15\6>\6\4\0059\6\n\0009\6\v\0069\6\16\6>\6\5\0059\6\n\0009\6\v\0069\6\17\6>\6\6\5=\5\19\4=\4\20\0035\4\23\0009\5\21\0009\5\22\5B\5\1\2=\5\24\0049\5\21\0009\5\25\5)\aüÿB\5\2\2=\5\26\0049\5\21\0009\5\25\5)\a\4\0B\5\2\2=\5\27\0049\5\21\0009\5\28\5B\5\1\2=\5\29\0049\5\21\0009\5\30\0055\a\31\0009\b \0009\b!\b=\b\"\aB\5\2\2=\5#\0043\5$\0=\5%\0043\5&\0=\5'\4=\4\21\0034\4\3\0005\5(\0>\5\1\4=\4)\3B\1\2\0012\0\0€K\0\1\0\fsources\1\0\1\tname\rnvim_lsp\f<S-TAB>\0\n<TAB>\0\t<CR>\rbehavior\vInsert\20ConfirmBehavior\1\0\1\vselect\2\fconfirm\n<C-e>\nclose\n<C-f>\n<C-d>\16scroll_docs\14<C-Space>\1\0\0\rcomplete\fmapping\fsorting\16comparators\1\0\0\norder\tkind\voffset\vlength\nscore\nexact\fcompare\vconfig\15completion\1\0\1\16completeopt\26menu,menuone,noinsert\1\0\1\17autocomplete\1\14preselect\1\0\0\tNone\18PreselectMode\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\ng\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\tview\1\0\1\16auto_resize\2\1\0\1\15auto_close\2\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n¨\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/opt/popup.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nÐ\4\0\0\6\0\f\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0006\3\0\0'\5\3\0B\3\2\0029\3\4\0039\3\5\3=\3\a\2B\0\2\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0+\3\1\0B\0\3\1K\0\1\0œ\3                  highlight TelescopeSelection      guibg=bg gui=bold\n                  highlight TelescopeNormal         guibg=#00000\n                  highlight TelescopeBorder         guifg=#00ff00\n                  highlight TelescopePromptBorder   gui=bold\n                  highlight TelescopeResultsBorder  gui=bold\n                  highlight TelescopePreviewBorder  guifg=#ffffff\n                  \14nvim_exec\bapi\bvim\19file_previewer\1\0\0\bnew\19vim_buffer_cat\25telescope.previewers\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  vim = {
    loaded = false,
    needs_bufread = false,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/opt/vim"
  },
  vimwiki = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/vimwiki"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/karlc/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\nÔ\4\0\0\4\0 \00016\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0014\0\0\0005\1\4\0005\2\5\0>\2\2\1=\1\3\0005\1\a\0005\2\b\0>\2\2\1=\1\6\0005\1\n\0005\2\v\0>\2\2\1=\1\t\0005\1\r\0005\2\14\0>\2\2\1=\1\f\0005\1\16\0005\2\17\0>\2\2\1=\1\15\0005\1\19\0005\2\20\0>\2\2\1=\1\18\0005\1\22\0005\2\23\0>\2\2\1=\1\21\0005\1\25\0005\2\26\0>\2\2\1=\1\24\0005\1\28\0005\2\29\0>\2\2\1=\1\27\0006\1\0\0'\3\30\0B\1\2\0029\1\31\1\18\3\0\0B\1\2\1K\0\1\0\17set_mappings\21neoscroll.config\1\2\0\0\b250\1\2\0\0\azb\azb\1\2\0\0\b250\1\2\0\0\azz\azz\1\2\0\0\b250\1\2\0\0\azt\azt\1\4\0\0\t0.10\nfalse\b100\1\2\0\0\vscroll\n<C-e>\1\4\0\0\n-0.10\nfalse\b100\1\2\0\0\vscroll\n<C-y>\1\4\0\0#vim.api.nvim_win_get_height(0)\ttrue\b450\1\2\0\0\vscroll\n<C-f>\1\4\0\0$-vim.api.nvim_win_get_height(0)\ttrue\b450\1\2\0\0\vscroll\n<C-b>\1\4\0\0\18vim.wo.scroll\ttrue\b250\1\2\0\0\vscroll\n<C-d>\1\4\0\0\19-vim.wo.scroll\ttrue\b250\1\2\0\0\vscroll\n<C-u>\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\ng\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\tview\1\0\1\16auto_resize\2\1\0\1\15auto_close\2\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nö\1\0\1\a\1\v\2)6\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\2\23\1\0\0016\2\0\0009\2\1\0029\2\4\2B\2\1\2\t\2\0\0X\2\4€-\2\0\0009\2\5\2B\2\1\1X\2\24€\b\1\1\0X\2\16€6\2\0\0009\2\1\0029\2\6\2'\4\3\0B\2\2\2\18\4\2\0009\2\a\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\b\2'\5\t\0B\2\3\2\15\0\2\0X\3\3€\18\2\0\0B\2\1\1X\2\3€-\2\0\0009\2\n\2B\2\1\1K\0\1\0\0À\rcomplete\a%s\nmatch\bsub\fgetline\21select_next_item\15pumvisible\6.\bcol\afn\bvim\2\0a\0\1\3\1\4\1\r6\1\0\0009\1\1\0019\1\2\1B\1\1\2\t\1\0\0X\1\4€-\1\0\0009\1\3\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\21select_prev_item\15pumvisible\afn\bvim\2¤\5\1\0\t\0*\0O6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\5\0009\4\3\0009\4\4\4=\4\6\0035\4\a\0005\5\b\0=\5\t\4=\4\t\0035\4\18\0004\5\a\0009\6\n\0009\6\v\0069\6\f\6>\6\1\0059\6\n\0009\6\v\0069\6\r\6>\6\2\0059\6\n\0009\6\v\0069\6\14\6>\6\3\0059\6\n\0009\6\v\0069\6\15\6>\6\4\0059\6\n\0009\6\v\0069\6\16\6>\6\5\0059\6\n\0009\6\v\0069\6\17\6>\6\6\5=\5\19\4=\4\20\0035\4\23\0009\5\21\0009\5\22\5B\5\1\2=\5\24\0049\5\21\0009\5\25\5)\aüÿB\5\2\2=\5\26\0049\5\21\0009\5\25\5)\a\4\0B\5\2\2=\5\27\0049\5\21\0009\5\28\5B\5\1\2=\5\29\0049\5\21\0009\5\30\0055\a\31\0009\b \0009\b!\b=\b\"\aB\5\2\2=\5#\0043\5$\0=\5%\0043\5&\0=\5'\4=\4\21\0034\4\3\0005\5(\0>\5\1\4=\4)\3B\1\2\0012\0\0€K\0\1\0\fsources\1\0\1\tname\rnvim_lsp\f<S-TAB>\0\n<TAB>\0\t<CR>\rbehavior\vInsert\20ConfirmBehavior\1\0\1\vselect\2\fconfirm\n<C-e>\nclose\n<C-f>\n<C-d>\16scroll_docs\14<C-Space>\1\0\0\rcomplete\fmapping\fsorting\16comparators\1\0\0\norder\tkind\voffset\vlength\nscore\nexact\fcompare\vconfig\15completion\1\0\1\16completeopt\26menu,menuone,noinsert\1\0\1\17autocomplete\1\14preselect\1\0\0\tNone\18PreselectMode\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n¨\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n‚\2\0\0\6\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\5\0005\5\4\0=\5\6\4=\4\a\3=\3\t\2B\0\2\1K\0\1\0\foptions\1\0\0\15highlights\20buffer_selected\1\0\0\1\0\3\nguibg\f#a89984\bgui\tbold\nguifg\f#282828\1\0\5\22show_buffer_icons\1\20show_close_icon\1\15close_icon\5\27always_show_bufferline\1\20max_name_length\3\18\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nÐ\4\0\0\6\0\f\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0006\3\0\0'\5\3\0B\3\2\0029\3\4\0039\3\5\3=\3\a\2B\0\2\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0+\3\1\0B\0\3\1K\0\1\0œ\3                  highlight TelescopeSelection      guibg=bg gui=bold\n                  highlight TelescopeNormal         guibg=#00000\n                  highlight TelescopeBorder         guifg=#00ff00\n                  highlight TelescopePromptBorder   gui=bold\n                  highlight TelescopeResultsBorder  gui=bold\n                  highlight TelescopePreviewBorder  guifg=#ffffff\n                  \14nvim_exec\bapi\bvim\19file_previewer\1\0\0\bnew\19vim_buffer_cat\25telescope.previewers\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
