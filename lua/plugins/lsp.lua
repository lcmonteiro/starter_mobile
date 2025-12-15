return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = false, -- disable Mason-managed clangd
        pyright = false, -- disable Mason-managed pyright
        lua_ls = false, -- disable Mason management
        stylua = false, -- disable Mason management
      },
      setup = {
        lua_ls = function(_, opts)
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", opts, {
            cmd = { "lua-language-server" }, -- use Termux pkg binary
            settings = {
              Lua = {
                diagnostics = { globals = { "vim" } },
                workspace = { checkThirdParty = false },
              },
            },
          }))
          return true
        end,

        clangd = function(_, opts)
          local lspconfig = require("lspconfig")
          lspconfig.clangd.setup(vim.tbl_deep_extend("force", opts, {
            cmd = {
              "clangd",
              "--background-index",
              "--clang-tidy",
              "--header-insertion=iwyu",
              "--completion-style=detailed",
              "--function-arg-placeholders",
              "--fallback-style=llvm",
            },
            filetypes = { "c", "cpp" },
            root_dir = require("lspconfig.util").root_pattern("compile_flags.txt"),
          }))
          return true
        end,

        pyright = function(_, opts)
          local lspconfig = require("lspconfig")
          lspconfig.pyright.setup(vim.tbl_deep_extend("force", opts, {
            cmd = { "pyright-langserver", "--stdio" },
            filetypes = { "python" },
            root_dir = require("lspconfig.util").root_pattern("pyproject.toml", "setup.py", ".git", "."),
            settings = {
              python = {
                analysis = {
                  autoSearchPaths = true,
                  useLibraryCodeForTypes = true,
                  diagnosticMode = "workspace",
                },
              },
            },
          }))
          return true
        end,
      },
    },
  },
}
