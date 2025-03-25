require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Disable arrow keys in normal mode
map("n", "<Up>", '<cmd> echo "Use k to move" <CR>')
map("n", "<Down>", '<cmd> echo "Use j to move" <CR>')
map("n", "<Left>", '<cmd> echo "Use h to move" <CR>')
map("n", "<Right>", '<cmd> echo "Use l to move" <CR>')

-- Tmux navigation override
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Window up" })

-- Go Shortcuts
map("n", "<leader>gsj", "<cmd> GoTagAdd json <CR>", { desc = "Add json struct tags" })
map("n", "<leader>gsy", "<cmd> GoTagAdd yaml <CR>", { desc = "Add yaml struct tags" })

local harpoon = require "harpoon"
-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers")
    .new({}, {
      prompt_title = "Harpoon",
      finder = require("telescope.finders").new_table {
        results = file_paths,
      },
      previewer = conf.file_previewer {},
      sorter = conf.generic_sorter {},
    })
    :find()
end
map("n", "<leader>a", function()
  harpoon:list():add()
end)
map("n", "<C-e>", function()
  toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })

map("n", "<C-h>", function()
  harpoon:list():select(1)
end)
map("n", "<C-t>", function()
  harpoon:list():select(2)
end)

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<C-S-P>", function()
  harpoon:list():prev()
end)
map("n", "<C-S-N>", function()
  harpoon:list():next()
end)
