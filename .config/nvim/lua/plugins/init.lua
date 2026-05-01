return {
  {
    'datsfilipe/vesper.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme vesper]])
    end,
  },
  {
    'nvim-telescope/telescope.nvim', version = '*',
      dependencies = {
          'nvim-lua/plenary.nvim',
          -- optional but recommended
          { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      },
      config = function()
        require("telescope").setup({
          defaults = {
            file_ignore_patterns = { "^.git/" }
          }
        })

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", function()
          builtin.find_files({
            hidden = true,
          })  -- ファイル名検索
        end)
        vim.keymap.set("n", "<leader>fg", builtin.live_grep)   -- 内容のgrep検索
        vim.keymap.set("n", "<leader>fb", builtin.buffers)     -- 開いてるバッファ
      end,
  },
  {
    "mikavilpas/yazi.nvim",
    version = "*", -- use the latest stable version
    event = "VeryLazy",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
    -- 👇 in this section, choose your own keymappings!
      {
        -- Open in the current working directory
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
    },
  }
}
