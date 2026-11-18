return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  -- add dracula
  { "Mofiqul/dracula.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}
