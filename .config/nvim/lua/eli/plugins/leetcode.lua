local leet_arg = "leetcode.nvim"

return {
  "kawre/leetcode.nvim",
  lazy = leet_arg ~= vim.fn.argv(0, -1),
  build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
  dependencies = {
    -- include a picker of your choice, see picker section for more details
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    lang = "python3",
    arg = leet_arg,
    description = {
      position = "right",
    },
  },
}
