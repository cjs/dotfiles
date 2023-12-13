-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.termguicolors = true
-- configure ripgrep for vimgrep
opt.grepprg = [[rg --hidden --glob "!.git" --no-heading --smart-case --vimgrep --follow $*]]
opt.grepformat = "%f:%l:%c:%m"

-- keep text on the same line for horizontal splits
opt.splitkeep = "screen"
