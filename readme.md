# wit.nvim

###### `wit.nvim` is a plugin that allows you to perform web searches directly from within Neovim.

Switch, open browser, click on search, search...aah I was tired of this, Now I can web search directly through nvim.

Especially the errors I can just visual select and hit keymap and...voila done!

## Features

- **Search Web Directly**
- **Set your preffered Search Engine**
- **Visual Mode Search:** select text or errors to search directly

## Sound On

https://github.com/user-attachments/assets/7e31238e-8b1e-484c-a68b-8604d6b1d971

## Installation

You can install wit.nvim using any plugin manager for example:

Using packer.nvim:

```lua
require('packer').startup(function()
  use {
    'aliyan-21/wit.nvim',
    config = function()
      require('wit').setup()
    end
  }
end)
```

Using lazy.nvim:

```lua
return {
  "aliqyan-21/wit.nvim",
  config = function()
    require('wit').setup()
  end
}
```

## Usage

###### Search with Command

To perform a web search, use the `:WitSearch` command followed by your query.

```
:WitSearch your search query
```

###### Search with Visual Mode

Select the text you want to search and then hit `:WitVisualSearch` and enter.

## Configuration

Configure `wit.nvim` by adding the setup function in your configuration file.

```lua
require('wit').setup({
  search_engine = 'google' -- your preferred search engine name
})
```

## Contributing

Feel free to contribute to the development of `wit.nvim` by submitting issues or pull requests.

## License

wit.nvim is licensed under the MIT License.

## Acknowledgements

Special thanks to the Neovim and Neovim community.
