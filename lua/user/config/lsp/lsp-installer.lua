local servers = {
  "sumneko_lua",
  "jsonls",
  "clangd",
}

local settings = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local lspconfig = require("lspconfig")
lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
  on_attach = require("user.config.lsp.handlers").on_attach,
  capabilities = require("user.config.lsp.handlers").capabilities,
})

require("mason-lspconfig").setup_handlers({
  function(server_name) lspconfig[server_name].setup({})
  end,
  ["sumneko_lua"] = function()
    lspconfig.sumneko_lua.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })
  end,
  ["jsonls"] = function()
    lspconfig.jsonls.setup({
      init_options = {
        provideFormatter = false,
      },
    })
  end,
  ["clangd"] = function()
    lspconfig.clangd.setup({
    })
  end,

})
