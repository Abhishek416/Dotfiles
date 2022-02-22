local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

npairs.setup {
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
  fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0, -- Offset from pattern match
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey = "LineNr",
  },
  --map_cr = false,
  map_bs = false
}

local remap = vim.api.nvim_set_keymap
local opts = { expr = true, noremap = true }
--vim.g.coq_settings = { keymap = { recommended = false } }

-- these mappings are coq recommended mappings unrelated to nvim-autopairs
remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], opts )
remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], opts )
remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], opts )
remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], opts )

-- skip it, if you use another global object
_G.MUtils= {}

MUtils.CR = function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
      return npairs.esc('<c-y>')
    else
      return npairs.esc('<c-e>') .. npairs.autopairs_cr()
    end
  else
    return npairs.autopairs_cr()
  end
end
remap('i', '<cr>', 'v:lua.MUtils.CR()', opts )

MUtils.BS = function()
  if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
    return npairs.esc('<c-e>') .. npairs.autopairs_bs()
  else
    return npairs.autopairs_bs()
  end
end
remap('i', '<bs>', 'v:lua.MUtils.BS()', opts )

--local cmp_autopairs = require "nvim-autopairs.completion.cmp"
--local cmp_status_ok, cmp = pcall(require, "cmp")
--if not cmp_status_ok then
--  return
--end
--cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
