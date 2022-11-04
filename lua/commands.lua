--------------------------------------------------------
-- Commands configuration file: custom commands
--------------------------------------------------------

local cmd = vim.cmd -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript
local function nvim_set_au(au_type, where, dispatch)
    vim.cmd(string.format("au! %s %s %s", au_type, where, dispatch))
end

-- Tab is 2 space with these files
-- nvim_set_au("FileType", "lua, scala", "set tabstop=2 shiftwidth=2")

-- don't auto comments new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Highlight on yank
exec(
    [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]   ,
    false
)

-- Remove trailing whitespace
cmd [[command Remws %s/\s\+$//e]]
