require "nvchad.options"

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local o = vim.o

o.cursorlineopt = "both" -- to enable cursorline!
o.relativenumber = true -- Makes it easier to jump to lines
o.wrap = false -- Disable line wrapping
