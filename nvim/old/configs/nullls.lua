local null_ls = require("null-ls")

local options = {
    sources = {
        null_ls.builtins.formatting.rustfmt,
        -- null_ls.builtins.formatting.brittany, -- haskell
        null_ls.builtins.formatting.alejandra, -- nix
        null_ls.builtins.formatting.gofmt, -- go
        -- null_ls.builtins.formatting.ktlint, -- kotlin
        null_ls.builtins.formatting.lua_format, -- lua
        null_ls.builtins.formatting.trim_whitespace,
        null_ls.builtins.formatting.zigfmt,

        null_ls.builtins.diagnostics.credo, -- elixir, requires mix

        -- python things
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.formatting.black
    }
}

return options