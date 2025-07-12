local function getFormatters()
  -- Check if 'conform' is available
  local status, conform = pcall(require, "conform")
  if not status then
    return "Conform not installed"
  end

  local lsp_format = require("conform.lsp_format")

  -- Get formatters for the current buffer
  local formatters = conform.list_formatters_for_buffer()
  if formatters and #formatters > 0 then
    local formatterNames = {}

    for _, formatter in ipairs(formatters) do
      table.insert(formatterNames, formatter)
    end

    return "󰷈 " .. table.concat(formatterNames, " ")
  end

  -- Check if there's an LSP formatter
  local bufnr = vim.api.nvim_get_current_buf()
  local lsp_clients = lsp_format.get_format_clients({ bufnr = bufnr })

  if not vim.tbl_isempty(lsp_clients) then
    return "󰷈 LSP Formatter"
  end

  return ""
end

local function getLinters()
  local buf_lint_names = {}
  local buf_ft = vim.bo.filetype
  local lint_s, lint = pcall(require, "lint")
  if lint_s then
    for ft_k, ft_v in pairs(lint.linters_by_ft) do
      if type(ft_v) == "table" then
        for _, linter in ipairs(ft_v) do
          if buf_ft == ft_k then
            table.insert(buf_lint_names, linter)
          end
        end
      elseif type(ft_v) == "string" then
        if buf_ft == ft_k then
          table.insert(buf_lint_names, ft_v)
        end
      end
    end
  end

  if not vim.tbl_isempty(buf_lint_names) then
    return "󰱺 " .. table.concat(buf_lint_names, " ")
  end

  return ""
end

local function getLspName()
  local buf_clients = vim.lsp.get_clients()
  if next(buf_clients) == nil then
    return "  No servers"
  end
  local buf_client_names = {}

  for _, client in pairs(buf_clients) do
    table.insert(buf_client_names, client.name)
  end

  local language_servers = table.concat(buf_client_names, ", ")

  return " " .. language_servers
end

local lsp = {
  function()
    return getLspName()
  end,
}

local fmt = {
  function()
    return getFormatters()
  end,
}

local lnt = {
  function()
    return getLinters()
  end,
}

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local gruvbox = require("lualine.themes.gruvbox")
    local catppuccin = require("lualine.themes.catppuccin")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    lualine.setup({
      options = {
        theme = catppuccin,
      },
      sections = {
        lualine_x = {
          lsp,
          lnt,
          fmt,
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
