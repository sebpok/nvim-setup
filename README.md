
# Simple nvim setup

> Warning: **WORKS ONLY WITH NVIM 0.11+**

All files from repo go to
```
/home/{user}/.config/nvim/
```

Make sure to install:
- unzip
- wget
- curl
- gzip
- tar

You should have structure like this:
```
.config/nvim/
├─ lsp/
│  ├─ gopls.lua
│  ├─ lua_ls.lua
│  ├─ pyright.lua
├─ lua/
│  ├─ config/
│  ├─ core/
│  ├─ plugins/
├─ init.lua

```

## Config structure overview
`init.lua` - require all files from /lua & /lsp | set your `<leader>` key <br />
`lua/config` - your config file for key mapping, autocmds, or setting <br />
`lua/core` - there's lsp settings and lazy.nvim configuration (package manager) <br />
`lua/plugins` - here you can add your plugins <br />
`lsp/*` - in this directory, we set initial setup for LSP servers. <br />

---
## How to install plugins
Simply, create new lua file in `lua/plugins/your_new_plugin.lua`, name it as you want.
Inside you have follow this structure:
```lua
return {
    "theprimeagen/harpoon", -- plugin name
    config = function () -- plugin configuration & setup
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>a", mark.add_file)
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

        vim.keymap.set("n", "C-h", function () ui.nav_file(1) end)
        vim.keymap.set("n", "C-j", function () ui.nav_file(2) end)
        vim.keymap.set("n", "C-k", function () ui.nav_file(3) end)
        vim.keymap.set("n", "C-l", function () ui.nav_file(4) end)
    end
}
```
Plugin manager (lazy.nvim) you can find in `lua/core/lazy.lua`

## How to use LSP and auto-completions
We are using `blink.nvim` for autocompletions (allow for snippets, paths and buffor instead of just LSP from native 0.11+ nvim) <br />
In simple terms, there's step by step how to get this thing going for your language. <br />

- Install your language server. In nvim, open Mason and click `i` on server that you want to install
  ```
  :Mason
  ```
- Create new lua file in `lsp/your_new_file.lua` directory. Name as you want (for example: for pyright lsp, go for: "pyright_ls.lua") Follow structure as below. (You can omit this when using `lspconfig` plugin that comes with predefined lsp settings. In that case, go to next step below)
  ```lua
    return {
      cmd = { "pyright-langserver", "--stdio" }, -- here you have to pass LSP name from Mason
      filetypes = { "python" },                  -- filetypes for LSP to attach
      root_markers = {                           -- root makers
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        "pyrightconfig.json",
      },
      settings = {                               -- optional LSP settings
        python = {
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
          },
        },
      },
  }
  ```
- Go to `lua/core/lsp.lua` and in vim.lsp.enable(), add that filename that you have created. <br />
  For example: You have created file `pyright_ls.lua` for pyright-langserver from Mason. We would have:
  ```lua
  vim.lsp.enable({
    "pyright_ls"
  })
  ```
That's it. LSP and auto-completions are working. For customization you can check `lua/plugins/blink.lua`

## Color schemes
For color schemes, you can play around with file `lua/plugins/colorschemes.lua`. More color schemes you can fund [here](https://github.com/rafi/awesome-vim-colorschemes)

## Keymaps
You can add you keymaps in `lua/config/keymaps.lua`, and in each plugin (for example: telescope or harpoon). Go through plugins to change keymaps as you want. <br />
Leader key can be found in `init.lua`. <br /> <br />

Preset:
```
Telescope:
<leader>pf - Search current dir
<C-p> - Search in git files
<leader>ps - Search by grep in dir 

Harpoon:
<leader>u - create link
<C-e> - opens menu
<C-h> - opens first file in menu
<C-j> - opens 2 file in menu
<C-k> - opens 3 file in menu
<C-l> - opens 4 file in menu

- keymaps.lua
<leader>pv - File explorer
```
