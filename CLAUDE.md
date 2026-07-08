# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal Neovim configuration based on [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim), a modular fork of the popular kickstart.nvim starter config. It uses Lua for configuration and lazy.nvim for plugin management.

## Architecture

### Configuration Loading Order

The configuration is loaded in this sequence (see `init.lua`):

1. Leader keys are set (`<space>`)
2. `lua/options.lua` - Base Neovim options
3. `lua/keymaps.lua` - Base keymaps
4. `lua/lazy-bootstrap.lua` - Bootstraps lazy.nvim plugin manager
5. `lua/lazy-plugins.lua` - Loads all plugins
6. `lua/custom/options.lua` - User overrides for options
7. `lua/custom/keymaps.lua` - User-defined keymaps

### Directory Structure

```
lua/
├── options.lua              # Base Neovim options
├── keymaps.lua              # Base keymaps
├── lazy-bootstrap.lua       # Plugin manager bootstrap
├── lazy-plugins.lua         # Plugin definitions (orchestrator)
├── kickstart/
│   ├── plugins/            # Core plugins from kickstart
│   │   ├── lspconfig.lua   # LSP configuration with Mason
│   │   ├── telescope.lua   # Fuzzy finder
│   │   ├── treesitter.lua  # Syntax highlighting
│   │   ├── blink-cmp.lua   # Autocompletion
│   │   ├── conform.lua     # Formatting
│   │   ├── gitsigns.lua    # Git integration
│   │   ├── which-key.lua   # Keybinding help
│   │   └── ...
│   └── health.lua          # Health check module
└── custom/
    ├── options.lua         # User option overrides
    ├── keymaps.lua         # User keymaps (Telescope, LSP, Copilot)
    └── plugins/            # User plugins (auto-imported)
        ├── init.lua        # Empty placeholder
        ├── oil.lua         # File explorer
        ├── copilot.lua     # GitHub Copilot
        ├── neogit.lua      # Git interface
        ├── fugitive.lua    # Git commands
        ├── git-blame.lua   # Git blame
        ├── neogen.lua      # Documentation generator
        └── ...
```

### Plugin System

Plugins are defined using lazy.nvim's declarative syntax. Each plugin file in `lua/kickstart/plugins/` or `lua/custom/plugins/` returns a lazy.nvim plugin spec (table).

**Example plugin structure:**
```lua
return {
  'author/plugin-name',
  dependencies = { 'other/plugin' },
  opts = { ... },  -- Automatically passed to setup()
  config = function()
    -- Custom setup code
  end,
  keys = { ... },  -- Lazy-loaded on keymap
  cmd = { ... },   -- Lazy-loaded on command
}
```

The `lua/lazy-plugins.lua` file imports all plugins via:
- Individual `require` statements for kickstart plugins
- `{ import = 'custom.plugins' }` for all files in `lua/custom/plugins/`

## Development Workflow

### Testing Configuration Changes

1. **Test in current session:**
   ```vim
   :source %
   " or for Lua files:
   :luafile %
   ```

2. **Restart Neovim to test full config:**
   ```bash
   nvim
   ```

3. **Check health:**
   ```vim
   :checkhealth
   ```

### Plugin Management

All plugin operations use lazy.nvim:

```vim
:Lazy              " Open plugin manager UI
:Lazy update       " Update all plugins
:Lazy sync         " Install missing + update + clean unused
:Lazy clean        " Remove unused plugins
:Lazy profile      " Profile startup time
```

### Adding New Plugins

1. Create a new file in `lua/custom/plugins/my-plugin.lua`
2. Return a lazy.nvim plugin spec:
   ```lua
   return {
     'author/plugin',
     opts = {},
   }
   ```
3. Restart Neovim - lazy.nvim auto-imports from `custom.plugins`

### LSP Management

LSPs are managed through Mason (see `lua/kickstart/plugins/lspconfig.lua`):

```vim
:Mason             " Open Mason UI
:LspInfo           " Show attached LSPs
:LspInstall <server>  " Install language server
```

Language servers are configured in the `servers` table in `lspconfig.lua`.

### Formatting and Linting

- **Formatting:** Configured via conform.nvim (`lua/kickstart/plugins/conform.lua`)
  - Triggered with `<leader>f` or auto-format on save (if enabled)

- **Linting:** Available in `lua/kickstart/plugins/lint.lua` (currently commented out in lazy-plugins.lua)

## Key Customizations

### Custom Options (lua/custom/options.lua)
- Nerd Font enabled
- Relative line numbers
- True color support
- 2-space tabs (expanded)
- Swap files disabled
- Copilot tab mapping disabled

### Custom Keymaps (lua/custom/keymaps.lua)

Important mappings:
- `s` - Change character (mapped to `cl`)
- Arrow keys - Window navigation
- `ff` - Telescope find files
- `<leader>fg` - Telescope live grep
- `<leader> ` - List open buffers
- `<leader>gg` - Open Neogit
- `<leader>bx` - Delete all buffers except current
- `<leader>ng` - Generate documentation (Neogen)
- `<leader>ad/ae` - Ansible vault decrypt/encrypt
- `<C-J>` (insert mode) - Accept Copilot suggestion
- `gd` - Go to definition (Telescope)
- `gr` - Go to references (Telescope)

### Installed Custom Plugins

- **oil.nvim** - File explorer (replaces netrw)
- **copilot.vim** - GitHub Copilot integration
- **neogit** - Magit-like Git interface
- **fugitive** - Git commands
- **git-blame.nvim** - Git blame annotations
- **neogen** - Documentation string generator
- **vim-tmux-navigator** - Seamless tmux/vim navigation
- **guess-indent** - Auto-detect indentation
- **nvim-autopairs** - Auto-close brackets
- **blink-cmp** - Fast completion engine (custom config overrides kickstart)
- **indent-blankline** - Indentation guides

## Important Conventions

1. **Plugin files return tables:** Each plugin file must return a lazy.nvim spec table or array of tables
2. **Custom overrides kickstart:** Files in `lua/custom/` are loaded after and can override kickstart defaults
3. **Modular by default:** Keep plugin configurations in separate files
4. **Lua standard:** This config uses Lua exclusively (no Vimscript)
5. **Leader key:** `<space>` is the leader key
6. **Nerd Fonts required:** Icons depend on Nerd Font being installed and enabled

## External Dependencies

Required for full functionality:
- Neovim >= 0.10 (targets latest stable/nightly)
- Git, make, unzip, C compiler (gcc)
- ripgrep (for Telescope live_grep)
- fd (for Telescope find_files)
- Language servers via Mason (installed per-project needs)
- Optional: Nerd Font for icons
