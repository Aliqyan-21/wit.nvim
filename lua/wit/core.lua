local M = {}

local config = require("wit.config")

--- @type table<SearchEngine, string>
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
	local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
	local is_macos = vim.fn.has("mac") == 1
	local is_linux = not is_windows and not is_macos

	if is_windows then
		vim.notify("Windows is not supported yet", vim.log.levels.ERROR)
	elseif is_macos then
		os.execute('open "' .. url .. '"')
	elseif is_linux then
		os.execute('xdg-open "' .. url .. '" > /dev/null 2>&1 &')
	else
		vim.notify("Unsupported operating system", vim.log.levels.ERROR)
	end
end

return M
