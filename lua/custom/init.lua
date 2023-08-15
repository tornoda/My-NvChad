-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })


local autocmd = vim.api.nvim_create_autocmd

vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snippets"
vim.g.snipmate_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snippets"

vim.g.mapleader = ";"
-- vim.opt.signcolumn = "number"
vim.opt.scrolloff = 2
vim.cmd('set nowrap')

vim.keymap.set("n", "<leader>i", "<cmd> set ignorecase!<CR>")
vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")
vim.keymap.set("n", "<leader>4", "4gt")
vim.keymap.set("n", "<leader>5", "5gt")
vim.keymap.set("n", "<leader>6", "6gt")
-- vim.keymap.set("n", "W", ":wa<cr>")

vim.api.nvim_create_augroup("_my_auto", { clear = true })

autocmd("Filetype", {
  pattern = "typescript,typescriptreact,javascript,javascriptreact,yml,json,css,scss,sass,less,lua,vue",
  callback = function()
    vim.opt_local.foldmethod = "indent"
    vim.diagnostic.config({ virtual_text = false })
  end,
  group = "_my_auto",
})

autocmd("BufWritePre", {
  pattern = {"*.vue", "*.css", "*.tsx", "*.ts", "*.js", "*.less"},
  callback = function()
    vim.lsp.buf.format()
  end,
})

--https://github.com/NvChad/extensions/pull/35
local function setDiffColors ()
  local themeName = vim.g.nvchad_theme

  if(string.find(themeName, "light") ~= nil) then
    vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#d7eed8", fg = nil })
    vim.api.nvim_set_hl(0, "DiffDelete", { fg = "#ffbebe" })
    vim.api.nvim_set_hl(0, "DiffText", { bg = "#a6daa9", fg = nil})
    vim.api.nvim_set_hl(0, "DiffChange", { bg = "#def1df", fg = nil })
  else
    vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#295337", fg = nil })
    vim.api.nvim_set_hl(0, "DiffDelete", { bg = "brown", fg = "brown" })
    vim.api.nvim_set_hl(0, "DiffText", { bg = "#157d38", fg = nil })
    vim.api.nvim_set_hl(0, "DiffChange", { bg = "#295337" })
  end

  vim.cmd('set fillchars+=diff:╱')
  -- require("gitsigns").refresh()
  -- print(
  --   ("A new %s was opened on tab page %d!")
  --     :format(view.class:name(), view.tabpage)
  -- )
  -- require("base46").load_all_highlights()
end

setDiffColors()

autocmd("User NvChadThemeReload", {
  callback = function()
    setDiffColors()
  end,
})


