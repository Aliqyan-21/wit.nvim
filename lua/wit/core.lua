local M = {}

local utils = require("wit.utils")
local config = require("wit.config")

--- @type table<string, string>
M.search_engines = {
    google = "https://www.google.com/search?q=",
    bing = "https://www.bing.com/search?q=",
    duckduckgo = "https://duckduckgo.com/?q=",
    ecosia = "https://www.ecosia.org/search?q=",
    brave = "https://search.brave.com/search?q=",
    perplexity = "https://www.perplexity.ai/search?q=",
}

--- Performs a web search using the configured search engine
--- @param query string The search query to be executed
function M.search(query)
    query = query:gsub(" ", "+")
    local url = (M.search_engines[config.values.engine] or config.values.engine) .. query
    M.open_url(url)
end

--- Opens a URL in the default browser
--- @param url string The URL to open
function M.open_url(url)
    if utils.getOs() == "Linux" then
        os.execute("xdg-open '" .. url .. "' > /dev/null 2>&1 &")
    else
        os.execute("open '" .. url .. "'")
    end
end

return M