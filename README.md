<h1 align="center">telescope-gen.nvim</h1>

<p align="center">
  Telescope extension for starting gen.nvim with a pre-configured prompt.
  <br><br>
  This extension let you fuzzy search and choose a pre-configured prompt for gen.nvim,
  which is started with the selected prompt afterwards.
</p>

### 📦 Requirements

- neovim
- [gen.nvim](https://github.com/David-Kunz/gen.nvim)
- [telescope](https://github.com/nvim-telescope/telescope.nvim)

### 🚀 Getting started

Install this lua plugin with the plugin manager of your choice in neovim. Then
register the plugin in telescope with the following lines in your config file
after telescope is initialized.

```lua
require('telescope').load_extension('gen')
```

Next the shortcuts need to be registered. Please bear in mind that the argument
for the extension must be given accordingly (`v` or `V` for visual mode, `n` for
normal mode) since otherwise the telescope extension won't be able to tell
gen.nvim which mode was used before.

```lua
map("n", "<leader>gp", "<Esc><cmd>lua require('telescope').extensions.gen.prompts({ mode = 'n'})<CR>")
map("v", "<leader>gp", "<Esc><cmd>lua require('telescope').extensions.gen.prompts({ mode = 'v'})<CR>")
```

## 🤝 Contributing

If you are missing features or find some annoying bugs please feel free to submit an issue or a bugfix within a pull request :)
