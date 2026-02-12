return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
      "williamboman/mason.nvim",
    },
    opts = {
      -- use :Mason for installing lsp
      servers = {
        lua_ls = {},
        ts_ls = {},
        gopls = {},
        rust_analyzer = {}
      }
    },
    config = function(_, opts)
      local blink_cap = require("blink.cmp").get_lsp_capabilities

      for server, conf in pairs(opts.servers) do
        conf.capabilities = blink_cap(conf.capabilities)
        vim.lsp.enable(server, conf)
      end
    end

  }
}
