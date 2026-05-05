return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = { "n", "v" },
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      lua              = { "stylua" },
      javascript       = { "prettier" },
      javascriptreact  = { "prettier" },
      typescript       = { "prettier" },
      typescriptreact  = { "prettier" },
      json             = { "prettier" },
      jsonc            = { "prettier" },
      markdown         = { "prettier" },
      css              = { "prettier" },
      html             = { "prettier" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
