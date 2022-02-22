local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Remap space as leader key
keymap("n", "<Space>", "<Nop>", opts)
vim.g.mapleader = " " 
vim.g.maplocalleader = " " 

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- {{ Normal }}
-- explorer
--keymap("n", "<Leader>e", ":CHADopen<CR>", opts)
keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

-- Better Window Navigation
keymap("n", "<M-h>", "<C-w>h", opts)
keymap("n", "<M-j>", "<C-w>j", opts)
keymap("n", "<M-k>", "<C-w>k", opts)
keymap("n", "<M-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- {{ Insert }}
-- change escape
keymap("i", "ii", "<ESC>", opts)

-- {{ Visual }}
-- better indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "u", "<ESC>", opts)

-- Move text up and down
-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- {{ Visual Block }}
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Commentary
keymap("n", "<Leader>/", ":CommentToggle<CR>", opts)
keymap("v", "<Leader>", ":'<,'>CommentToggle<CR>", opts)

-- keymap("n", "<leader>fs", ":TZFocus<CR>", { noremap = true, silent = true})
