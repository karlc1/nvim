if not pcall(require, "feline") then
  return
end

local colors = {
  bg = "#282c34",
  fg = "#abb2bf",
  yellow = "#e0af68",
  cyan = "#56b6c2",
  darkblue = "#081633",
  green = "#98c379",
  orange = "#d19a66",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#61afef",
  red = "#e86671"
}

local lsp_get_diag_int = function(severity_level)
  local d = vim.diagnostic.get(0, {severity = severity_level})
  local count = 0
  for _ in pairs(d) do
    count = count + 1
  end
  return count
end

local lsp_get_diag_str = function(severity_level)
  local count = lsp_get_diag_int(severity_level)
  return (count > 0) and " " .. count .. " " or ""
end

-- LuaFormatter off

local comps = {
  file = {
    info = {
      provider = {
        name = "file_info",
        opts = {
          type = "relative"
        }
      },
      file_modified_icon = "",
      hl = {}
    },
    position = {
      provider = "position",
      left_sep = " ",
      hl = {}
    }
  },
  line_percentage = {
    provider = "line_percentage",
    left_sep = " ",
    hl = {
      style = "bold"
    }
  },
  diagnos = {
    err = {
      provider = function()
        return "" .. lsp_get_diag_str(vim.diagnostic.severity.ERROR)
      end,
      enabled = function()
        return lsp_get_diag_int(vim.diagnostic.severity.ERROR) > 0
      end,
      hl = {
        fg = colors.red
      }
    },
    warn = {
      provider = function()
        return "" .. lsp_get_diag_str(vim.diagnostic.severity.WARN)
      end,
      enabled = function()
        return lsp_get_diag_int(vim.diagnostic.severity.WARN) > 0
      end,
      hl = {
        fg = colors.yellow
      }
    },
    info = {
      provider = function()
        return "" .. lsp_get_diag_str(vim.diagnostic.severity.INFO)
      end,
      enabled = function()
        return lsp_get_diag_int(vim.diagnostic.severity.INFO) > 0
      end,
      hl = {
        fg = colors.blue
      }
    },
    hint = {
      provider = function()
        return "" .. lsp_get_diag_str(vim.diagnostic.severity.HINT)
      end,
      enabled = function()
        return lsp_get_diag_int(vim.diagnostic.severity.HINT) > 0
      end,
      hl = {
        fg = colors.cyan
      }
    }
  },
  git = {
    branch = {
      provider = "git_branch",
      icon = " ",
      left_sep = " ",
      hl = {
        fg = colors.violet
        -- style = 'bold'
      }
    }
  }
}

local components = {
  active = {},
  inactive = {}
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

table.insert(components.inactive[1], comps.file.info)

table.insert(components.active[1], comps.file.info)
table.insert(components.active[1], comps.git.branch)
table.insert(components.active[3], comps.diagnos.err)
table.insert(components.active[3], comps.diagnos.warn)
table.insert(components.active[3], comps.diagnos.hint)
table.insert(components.active[3], comps.diagnos.info)
table.insert(components.active[3], comps.file.position)
table.insert(components.active[3], comps.line_percentage)

require "feline".setup {
  -- colors = { bg = colors.bg, fg = colors.fg },
  components = components,
  disable = {
    filetypes = {
      "packer",
      "NvimTree",
      "fugitive",
      "dashboard",
      "fugitiveblame"
    },
    buftypes = {"terminal"},
    bufnames = {}
  }
}

vim.opt.laststatus = 3

vim.opt.fillchars = {
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋"
}
