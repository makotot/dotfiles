-- 不可視文字の可視化
vim.opt.list = true
vim.opt.listchars = {
  tab = "▸ ",
  trail = "·",
  nbsp = "␣",
  eol = "↵",  -- 改行（好みで）
}

vim.opt.expandtab = true   -- タブをスペースに展開
vim.opt.tabstop = 2        -- タブ幅
vim.opt.shiftwidth = 2     -- インデント幅

vim.opt.number = true          -- 行番号
vim.opt.cursorline = true -- カーソル行ハイライト

-- 検索
vim.opt.ignorecase = true      -- 大文字小文字を無視
vim.opt.smartcase = true       -- 大文字を含む場合は区別

vim.opt.clipboard = "unnamedplus"  -- システムクリップボードと共有

