-- n, v, i, t = mode names

local M = {}

M.general = {
  i = {
    -- go to  beginning and end
    ["<C-b>"] = { "<ESC>^i", "論 beginning of line" },
    ["<C-e>"] = { "<End>", "壟 end of line" },

    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", "  move left" },
    ["<C-l>"] = { "<Right>", " move right" },
    ["<C-j>"] = { "<Down>", " move down" },
    ["<C-k>"] = { "<Up>", " move up" },
  },

  n = {
    ["<leader>q"] = { "<cmd>:q<CR>", "  exit buffer" },
    ["<leader>wj"] = { "<cmd>:sp<CR><c-j>", " new buffer and move to it" },
    ["<leader>wl"] = { "<cmd>:vsp<CR><c-l>", " new buffer and move to it" },
    ["<leader>."] = { ":<Up><CR>", "repeat cmd last time" },
    ["<space>"] = { "viw", "visual select a word" },
    ["<M-k>"] = { "<C-b>", "back forward" },

    -- preview content in quickfix
    ["<leader>p"] = {
      function()
        if vim.bo.buftype == "quickfix" then
          vim.api.nvim_command('silent execute "normal! \r"')
        end
      end,
      "todo  preview quicklist",
    },
  },
}


M.lspconfig = {
  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
    ["<leader>a"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "   lsp code_action",
    },

    ["[e"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "   goto prev",
    },

    ["]e"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "   goto_next",
    },
  },
}


M.telescope = {
  n = {
    ["<leader>b"] = { "<cmd> Telescope buffers <CR>", "  find buffers" },
    ["gd"] = { "<cmd> Telescope lsp_definitions <CR>", "Go Defininition" },
    ["gr"] = { "<cmd> Telescope lsp_references <CR>", "Go References" },
    ["<leader>s"] = { "<cmd> Telescope lsp_document_symbols <CR>", "   lsp references" },
    ["<leader>d"] = { "<cmd> Telescope diagnostics <CR>", "Diagnostic" },
    ["<leader><leader>"] = { "<cmd> Telescope builtin <CR>", "Diagnostic" },
  },
}

return M

