return {
  "lewis6991/gitsigns.nvim",
  opts = {
    current_line_blame = true,
    current_line_blame_opts = {
      delay = 300,
      virt_text_pos = "eol",
    },
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
  },
  keys = {
    {
      "<leader>gb",
      function()
        require("gitsigns").blame_line({ full = true })
      end,
      desc = "Blame Line (full)",
    },
    {
      "<leader>gB",
      function()
        require("gitsigns").blame()
      end,
      desc = "Blame Buffer (full file)",
    },
    {
      "<leader>gt",
      function()
        require("gitsigns").toggle_current_line_blame()
      end,
      desc = "Toggle line blame",
    },
  },
}
