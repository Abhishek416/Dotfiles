vim.opt.hlsearch=false
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.number=true
vim.opt.numberwidth = 4                         -- set number column width to 2 {default 4}
vim.opt.hidden=true
vim.opt.wrap=false
vim.opt.sidescrolloff = 8
vim.opt.fileencoding="utf-8"
vim.opt.encoding="utf-8"
vim.opt.pumheight=10
vim.opt.smarttab=true
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.cmdheight=2
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.termguicolors=true
vim.opt.splitbelow=true
vim.opt.splitright=true
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.conceallevel=0
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.tabstop=2
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.shiftwidth=2
vim.opt.smarttab=true
vim.opt.expandtab=true
vim.opt.autoindent=true
vim.opt.laststatus=2
vim.opt.showtabline=2
vim.opt.showmode=false
vim.opt.backup=false
vim.opt.writebackup=false
vim.opt.updatetime=300
vim.opt.timeoutlen=500
vim.opt.undofile = true                        -- enable persistent undo
vim.opt.incsearch=true
vim.opt.signcolumn="yes"
vim.opt.background="dark"
vim.opt.clipboard = "unnamedplus"
vim.opt.guifont = "monospace:h17"


vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
