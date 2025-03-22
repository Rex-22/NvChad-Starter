-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = {
    enabled = false,
  },
}

M.mason = {
  pkgs = {
    "gopls",
    "gofumpt",
    "goimports-reviser",
    "golines",
    "stylua",
    "gotests",
    "gomodifytags",
    "impl",
    "iferr",
    "checkmake",
    "prettier", -- ts/js formatter
    "stylua",   -- lua formatter
    "eslint_d", -- ts/js linter
    "shfmt",
    "ruff",
    "debugpy"
  },
}

return M
