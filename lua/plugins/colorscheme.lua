-- Colorscheme
return {
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_foreground = "original"
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_better_performance = 1

      -- Clear bg on every colorscheme load so the terminal background shows through
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          local groups = { "Normal", "NormalNC", "NormalFloat", "SignColumn", "EndOfBuffer" }
          for _, group in ipairs(groups) do
            local hl = vim.api.nvim_get_hl(0, { name = group })
            hl.bg = nil
            hl.ctermbg = nil
            vim.api.nvim_set_hl(0, group, hl)
          end
        end,
      })

      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "gruvbox-material" },
  },
}
