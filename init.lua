-- Fix PATH for Termux
vim.env.PATH = vim.env.PATH .. ':/data/data/com.termux/files/usr/bin'

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Basic LSP setup
require("lspconfig").clangd.setup({
 cmd = { "clangd" },
})
