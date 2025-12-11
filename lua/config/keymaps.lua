local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

map("i", "<C-c>", "<Esc>", opts)

-- Better navigation in insert mode
map("i", "<C-h>", "<Left>", opts)
map("i", "<C-l>", "<Right>", opts)
map("i", "<C-j>", "<Down>", opts)
map("i", "<C-k>", "<Up>", opts)

map("n", "<leader>w", ":w<CR>", opts) -- save
map("n", "<leader>q", ":q<CR>", opts) -- quit
map("n", "<leader>h", ":nohlsearch<CR>", opts) -- clear search highlight

vim.keymap.set("n", "<leader>lm", function() vim.diagnostic.open_float() end)
