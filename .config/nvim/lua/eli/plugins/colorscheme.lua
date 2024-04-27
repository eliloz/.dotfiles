return {
  -- {
  --   "catppuccin/nvim",
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     -- load the colorscheme here
  --     vim.cmd([[colorscheme catppuccin-frappe]])
  --   end,
  -- },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme kanagawa]])
    end,
  },
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     -- load the colorscheme here
  --     vim.cmd([[colorscheme gruvbox]])
  --   end,
  -- },
  --	{
  --		"bluz71/vim-nightfly-guicolors",
  --		priority = 1000, -- make sure to load this before all the other start plugins
  --		config = function()
  --			-- load the colorscheme here
  --			vim.cmd([[colorscheme nightfly]])
  --		end,
  --	},
}
