# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working in this repository.

## What this repo is

Personal Neovim configuration. No build step, no tests — changes take effect by restarting Neovim or sourcing the relevant file (`:source %`). Plugin changes are applied via `:Lazy sync` inside Neovim.

## Structure

```
init.lua                  # Entry point: bootstraps lazy.nvim, loads vim-options, remaps, plugins
lua/vim-options.lua       # Core vim settings (indentation, line numbers, search, etc.)
lua/remaps.lua            # Global keymaps (non-plugin)
lua/plugins/              # One file per plugin — each returns a lazy.nvim plugin spec
snippets/                 # Custom JSON snippets (javascript.json, svelte.json)
lazy-lock.json            # Plugin version lockfile — commit when updating plugins
```

## Plugin system

Plugins use [lazy.nvim](https://github.com/folke/lazy.nvim). Each file in `lua/plugins/` returns a spec table (or array of specs). Lazy discovers all files in that directory automatically via `require("lazy").setup("plugins")` in `init.lua`.

Minimal plugin spec:
```lua
return { "author/plugin", opts = {} }
```

Full spec pattern:
```lua
return {
    "author/plugin",
    dependencies = { "other/dep" },
    event = "VeryLazy",        -- lazy-load trigger
    config = function()
        require("plugin").setup({ ... })
    end,
}
```

To add a plugin: create a new file in `lua/plugins/` returning a valid spec.

## LSP setup (`lua/plugins/lsp.lua`)

- Mason installs servers; `mason-lspconfig` enables them automatically.
- Active servers: `lua_ls`, `svelte`, `ts_ls`, `emmet_ls`, `html`, `tailwindcss`.
- Capabilities are provided by `blink.cmp` via `require("blink.cmp").get_lsp_capabilities()`.
- Format-on-save is wired via `LspAttach` autocmd (only for servers that support `textDocument/formatting`).
- Diagnostic virtual text is **disabled** — use `[d`/`]d` to navigate diagnostics, or Trouble (`<leader>qx`).

## Completion (`lua/plugins/blink.lua`)

Uses `blink.cmp` (not nvim-cmp). Key bindings:
- `<C-Space>` — show/toggle docs
- `<CR>` — accept, `<C-CR>` — select and accept
- `<C-p>`/`<C-n>` or arrows — navigate
- `<C-e>` — hide menu

Snippet source extends svelte filetype to include js/ts/html/css, and js↔ts cross-completion.

## Key keymaps summary

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files (Telescope) |
| `<leader>fg` | Live grep |
| `<C-p>` | Git files (Telescope) |
| `<leader>gd` | LSP go to definition |
| `<leader>gr` | LSP references |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename symbol |
| `<C-f>` | Format file (LSP) |
| `<C-s>` | Save |
| `<leader>y`/`<leader>p` | Yank/paste system clipboard |
| `<Tab>`/`<S-Tab>` | Cycle windows |
| `<C-t>`/`<C-i>`/`<C-h>` | New/next/prev tab |

## Local plugin

`lua/plugins/do.lua` loads a plugin from `~/progRock/nvimPlugins/do.nvim` (local dev, not on GitHub).
