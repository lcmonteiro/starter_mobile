return {
  "stevearc/conform.nvim",
  opts = {
    -- Formatters per filetype
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black", "isort" },
      cpp = { "clang_format" },
      c = { "clang_format" },
    },
  },
}
