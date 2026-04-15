-- Claude Code terminal integration
local claude_term = nil
local claude_float = nil

return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        shade_terminals = true,
        shading_factor = 2,
        persist_size = true,
        direction = "vertical",
        float_opts = {
          border = "curved",
          winblend = 3,
        },
      })
      -- Exit terminal mode with Esc
      vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
      -- Navigate from terminal
      vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Go left" })
      vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Go right" })
    end,
    keys = {
      { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
      {
        "<leader>ac",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          if not claude_term then
            claude_term = Terminal:new({
              cmd = "claude",
              direction = "vertical",
              hidden = true,
              on_open = function(term)
                vim.cmd("startinsert!")
              end,
            })
          end
          claude_term:toggle()
        end,
        desc = "Claude Code",
      },
      {
        "<leader>af",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          if not claude_float then
            claude_float = Terminal:new({
              cmd = "claude",
              direction = "float",
              hidden = true,
              float_opts = {
                border = "curved",
                width = math.floor(vim.o.columns * 0.8),
                height = math.floor(vim.o.lines * 0.8),
              },
              on_open = function(term)
                vim.cmd("startinsert!")
              end,
            })
          end
          claude_float:toggle()
        end,
        desc = "Claude Code (float)",
      },
    },
  },
}
