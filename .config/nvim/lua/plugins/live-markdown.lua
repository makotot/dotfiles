return {
  "bun913/live-markdown.nvim",
  cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
  build = "scripts/install.sh",
  config = function()
    require("live-markdown").setup({
      browser = {
        strategy = "cmux browser open-split",
      },
    })
  end,
}
