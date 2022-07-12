return {
  settings = {

    Lua = {
      diagnostics = {
        globals = { "vim" }, --add vim as global and not throw error
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
}
