local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name 
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap('', '<Space>', '<NOP>', opts )
vim.g.mapleader = ' '
vim.g.maplocalleader = " "

-- no hl
keymap('n', '<Leader>h', ':set hlsearch!<CR>', opts )

-- explorer
keymap('n', '<Leader>e', ':NvimTreeToggle<CR>',opts )

-- better window movement
keymap('n', '<C-h>', '<C-w>h', opts )
keymap('n', '<C-j>', '<C-w>j', opts )
keymap('n', '<C-k>', '<C-w>k', opts )
keymap('n', '<C-l>', '<C-w>l', opts )

-- Use alt + hjkl to resize windows
keymap('n', '<M-j>', ':resize -2<CR>', opts )
keymap('n', '<M-k>', ':resize +2<CR>', opts )
keymap('n', '<M-h>', ':vertical resize -2<CR>', opts )
keymap('n', '<M-l>', ':vertical resize +2<CR>', opts )

-- better indenting
keymap('v', '<', '<gv', opts )
keymap('v', '>', '>gv', opts )

-- change escape
keymap('i', 'ii', '<ESC>', opts)

-- Tab switch bufer
keymap('n', '<S-l>', ':bnext<CR>', opts)
keymap('n', '<S-h>', ':bprevious<CR>', opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- move selected line of text
keymap('x', 'K', ':move \'<-2<CR>gv-gv\'', opts)
keymap('x', 'J', ':move \'<+2<CR>gv-gv\'', opts)

-- Commentary
-- keymap('n', '<Leader>/', ':CommentToggle<CR>', opts)
-- keymap('v', '<Leader>', ":'<,'>CommentToggle<CR>", opts)

keymap("n", "<leader>fs", ":TZFocus<CR>", { noremap = true, silent = true})

-- Visual Block -- 
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
keymap('n', '<Leader>fw', "<cmd>lua require'telescope.builtin'.grep_string(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",  term_opts )
keymap('n', '<Leader>fb', "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", term_opts )
keymap('n', '<Leader>fh', "<cmd>lua require'telescope.builtin'.help_tags(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", term_opts )
keymap('n', '<Leader>fc', "<cmd>lua require'telescope.builtin'.colorsheme(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", term_opts )
keymap('n', '<Leader>fo', "<cmd>lua require'telescope.builtin'.oldfiles(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", term_opts )
