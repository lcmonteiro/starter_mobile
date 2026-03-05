return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black", "isort" },
      cpp = { "clang_format" },
      c = { "clang_format" },
    },
  },
}
