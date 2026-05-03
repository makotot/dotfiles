return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      vim.lsp.enable({
        "cssls",
        "eslint",
        "gopls",
        "html",
        "jsonls",
        "lua_ls",
        "ts_ls",
      })
    end,
  },
}
