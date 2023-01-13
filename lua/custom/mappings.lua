return {
  disabled = {
    n = {
      ["<C-s>"] = "",
      ["$"] = "",
      ["0"] = "",
    },
    i = {
      ["<ESC>"] = ""
    },
    v = {
      ["<ESC>"] = ""
    }
  },

  user = {
    i = {
      ["jk"] = {"<ESC>", "Leave insert mode"},
      ["Jk"] = {"<ESC>", "Leave insert mode"},
      ["jK"] = {"<ESC>", "Leave insert mode"},
      ["JK"] = {"<ESC>", "Leave insert mode"},
    },

    n = {
      ["L"] = {"$", "Go to the end of the line"},
      ["H"] = {"0", "Go to the beginning of the line"},
      ["!"] = {"<CMD> w <CR>", "Save current buffer"},
      ["<C-s>l"] = {"<CMD> rightbelow vnew <CR>", "Open split to the right"},
      ["<C-s>h"] = {"<CMD> leftabove vnew <CR>", "Open split to the left"},
      ["<C-s>j"] = {"<CMD> rightbelow new <CR>", "Open split to the top"},
      ["<C-s>k"] = {"<CMD> rightbelow new <CR>", "Open split to the bottom"},
    },

    v = {
      ["jk"] = {"<ESC>", "Leave visual mode"},
      ["Jk"] = {"<ESC>", "Leave visual mode"},
      ["jK"] = {"<ESC>", "Leave visual mode"},
      ["JK"] = {"<ESC>", "Leave visual mode"},
      ["L"] = {"$", "Go to the end of the line"},
      ["H"] = {"0", "Go to the beginning of the line" },
      ['<LEADER>"'] = {'<ESC>`<i"<ESC>`>la"<ESC>', "Quote selection"}
    },
  },

  lsp = {
    -- plugin = true,

    n = {
      ["<LEADER>ld"] = {
        function()
          vim.lsp.buf.definition()
        end
        ,"Go to symbol definition"
      },
      -- ["<LEADER>li"] = {
      --   function()
      --     vim.lsp.buf.implementation()
      --   end,
      --   "Go to symbol implementation"
      -- },
      ["<LEADER>lf"] = {
        function ()
          vim.lsp.buf.references()
        end,
        "Find symbol references"
      },
      ["<LEADER>lr"] = {
        function ()
          require("nvchad_ui.renamer").open()
        end,
        "Rename symbol"
      },
      ["<LEADER>lh"] = {
        function ()
          vim.lsp.buf.hover()
        end,
        "Hover symbol"
      },
      ["<LEADER>li"] = {
        function ()
          vim.lsp.buf.incoming_calls()
        end,
        "List calls of the symbol"
      },
      ["<LEADER>lo"] = {
        function ()
          vim.lsp.buf.incoming_calls()
        end,
        "List symbols called by the selected symbol"
      },
      ["<LEADER>lj"] = {
        function ()
          vim.diagnostic.goto_next()
        end,
        "Go to next LSP diagnostic"
      },
      ["<LEADER>lk"] = {
        function ()
          vim.diagnostic.goto_prev()
        end,
        "Go to previous LSP diagnostic"
      },
    }
  }
}
