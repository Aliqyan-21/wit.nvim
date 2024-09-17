local M = {}

local config = require("wit.config")
local utils = require("wit.utils")

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
	query = utils.normalize_for_url(query)
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
		os.execute('powershell -NoLogo -NoProfile -NonInteractive -Command Start-Process "' .. url .. '"')
	elseif is_macos then
		os.execute('open "' .. url .. '"')
	elseif is_linux then
		os.execute('xdg-open "' .. url .. '" > /dev/null 2>&1 &')
	else
		vim.notify("Unsupported operating system", vim.log.levels.ERROR)
	end
end

return M
