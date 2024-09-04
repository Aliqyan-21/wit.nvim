# wit.nvim

###### `wit.nvim` is a plugin that allows you to perform web searches directly from within Neovim.

Switch, open browser, click on search, search...aah I was tired of this, Now I can web search directly through nvim.

Especially the errors I can just visual select and hit keymap and...voila done!

## Features

- **Search Web Directly**
- **Set your preffered Search Engine**
- **Support for Custom Search Engine URLs**
- **Wikipedia Search Command**
- **Visual Mode Search:** select text or errors to search directly

## Sound On

https://github.com/user-attachments/assets/7e31238e-8b1e-484c-a68b-8604d6b1d971

### AI (perplexity.ai, ...etc.)

![perplexity](https://github.com/user-attachments/assets/a0ca9aa6-d587-4b03-89fe-ef1d9e802917)

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

To perform a direct wikipedia search, use the `:WitSearchWiki` command followed by your query.

```
:WitSearchWiki your search topic
```

###### Search with Visual Mode

Select the text you want to search and then hit `:WitVisualSearch` and enter.

## Configuration

Configure `wit.nvim` by adding the setup function in your configuration file.

```lua
require("wit").setup({
  search_engine = "google" -- your preferred search engine name from the list
  -- search_engine = "https://any_other_search_engine.com/search?q=" -- for any other search engine not in list you can define it's url directly

  -- for example:
  -- search_engine = "https://you.com/search?q=" -- defining the search url of you.com as it is not in the list
})
```

### Supported Search Engines list

    - google
    - bing
    - duckduckgo
    - ecosia
    - brave
    - perplexity

###### You can also specify a custom search engine URL by providing the base URL in the search_engine configuration. Just ensure you include the ?q= at the end.

## Contributing

Feel free to contribute to the development of `wit.nvim` by submitting issues or pull requests.

## License

wit.nvim is licensed under the MIT License.

## Acknowledgements

Special thanks to the Neovim and Neovim community.
