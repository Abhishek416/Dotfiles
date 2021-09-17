vim.cmd([[ autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2 ]])

vim.api.nvim_set_keymap('n', '<Leader>sl', ':<C-u>SessionLoad<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ss', ':<C-u>SessionSave<cr>', { silent = true })

vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_session_directory = '~/.cache/nvim/session'
vim.g.dashboard_custom_shortcut={
 last_session       = 'SPC s l',
 find_history       = 'SPC f o',
 find_file          = 'SPC f f',
 new_file           = 'SPC c n',
 change_colorscheme = 'SPC f c',
 find_word          = 'SPC f w',
 book_marks         = 'SPC f b',
}


vim.g.dashboard_custom_shortcut_icon = {
  last_session =  ' ',
  find_history = 'ﭯ ',
  new_file = ' ',
  change_colorscheme = ' ',
  find_word = ' ',
  book_marks = ' ',
}

vim.g.dashboard_custom_header = {
 ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
 ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
 ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
 ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
 ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
 ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
}
