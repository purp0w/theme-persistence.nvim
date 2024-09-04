# theme-persistance.nvim

**theme-persistance.nvim** is a Neovim plugin that automatically saves your current colorscheme to a file and re-applies it every time Neovim starts.

## Features

- Automatically saves the current colorscheme to a file on colorscheme change.
- Re-applies the saved colorscheme on startup.
- No configuration required.

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

Add the following line to your `init.lua` file:

```lua
return {
  "purp0w/theme-persistence.nvim",
  config = function()
    require("theme-persistence")
  end,
  lazy = false, -- To ensure it applies the theme on startup
}
```

Then, run `:Lazy sync` in Neovim.

## Usage

1. The plugin automatically saves your current colorscheme every time you change it.
2. On the next startup, it reads the saved colorscheme from the disk and applies it.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
