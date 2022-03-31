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

keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

---- keymap("n", "<leader>fs", ":TZFocus<CR>", { noremap = true, silent = true})
keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
keymap("n", "<F10>", ":lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F11>", ":lua require'dap'.step_into()<CR>", opts)
keymap("n", "<F12>", ":lua require'dap'.step_out()<CR>", opts)
keymap("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)

keymap( "n", "<F4>", ":lua require('dapui').toggle()<CR>", opts)
--keymap( "n", "<F5>", ":lua require('dap').toggle_breakpoint()<CR>" )
--keymap( "n", "<F9>", ":lua require('dap').continue()<CR>" )

--keymap( "n", "<F1>", ":lua require('dap').step_over()<CR>" )
--keymap( "n", "<F2>", ":lua require('dap').step_into()<CR>" )
--keymap( "n", "<F3>", ":lua require('dap').step_out()<CR>" )

keymap( "n", "<Leader>dsc", ":lua require('dap').continue()<CR>", opts)
keymap( "n", "<Leader>dsv", ":lua require('dap').step_over()<CR>", opts)
keymap( "n", "<Leader>dsi", ":lua require('dap').step_into()<CR>", opts)
keymap( "n", "<Leader>dso", ":lua require('dap').step_out()<CR>", opts)

keymap( "n", "<Leader>dhh", ":lua require('dap.ui.variables').hover()<CR>", opts)
keymap( "v", "<Leader>dhv", ":lua require('dap.ui.variables').visual_hover()<CR>",opts)

keymap( "n", "<Leader>duh", ":lua require('dap.ui.widgets').hover()<CR>", opts)
keymap( "n", "<Leader>duf", ":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>", opts)

keymap( "n", "<Leader>dro", ":lua require('dap').repl.open()<CR>", opts)
keymap( "n", "<Leader>drl", ":lua require('dap').repl.run_last()<CR>", opts)

keymap( "n", "<Leader>dbc", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap( "n", "<Leader>dbm", ":lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>", opts)
keymap( "n", "<Leader>dbt", ":lua require('dap').toggle_breakpoint()<CR>", opts)

keymap( "n", "<Leader>dc", ":lua require('dap.ui.variables').scopes()<CR>", opts)
keymap( "n", "<Leader>di", ":lua require('dapui').toggle()<CR>", opts)
