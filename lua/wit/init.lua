local M = {}
local m_config = require("wit.config")

local search_engines = {
	google = "https://www.google.com/search?q=",
	bing = "https://www.bing.com/search?q=",
	duckduckgo = "https://duckduckgo.com/?q=",
	ecosia = "https://www.ecosia.org/search?q=",
	brave = "https://search.brave.com/search?q=",
	perplexity = "https://www.perplexity.ai/search?q=",
}

M.wit_search = function(query)
	query = query:gsub(" ", "+")
	local url = (search_engines[m_config.search_engine] or m_config.search_engine) .. query
	os.execute("xdg-open '" .. url .. "' > /dev/null 2>&1 &")
end

vim.api.nvim_create_user_command("WitSearch", function(opts)
	M.wit_search(opts.args)
end, { nargs = 1 })

vim.api.nvim_create_user_command("WitSearchVisual", function()
	local lines = vim.fn.getline("'<", "'>")
	local query = type(lines) == "table" and table.concat(lines, " ") or lines
	M.wit_search(query)
end, { range = true }) -- allowing range to handle f**ing E481

vim.api.nvim_create_user_command("WitSearchWiki", function(opts)
	local query = opts.args:gsub(" ", "_")
	local url = "https://en.wikipedia.org/w/index.php?search=" .. query
	os.execute("xdg-open '" .. url .. "' > /dev/null 2>&1 &")
end, { nargs = 1 })

function M.setup(config)
	m_config.setup(config)
end

return M
