local M = {}

local config = require("wit.config")

local search_engines = {
	google = "https://www.google.com/search?q=",
	bing = "https://www.bing.com/search?q=",
	duckduckgo = "https://duckduckgo.com/?q=",
	ecosia = "https://www.ecosia.org/search?q=",
	brave = "https://search.brave.com/search?q=",
	perplexity = "https://www.perplexity.ai/search?q=",
}

local function getOs()
	local fh = io.popen("uname")

	if not fh then
		vim.notify("wit.nvim: uname command not found", vim.log.levels.ERROR)
		return
	end

	local uname = fh:read("*l")

	fh:close()

	if uname == "Darwin" then
		return "MacOS"
	end

	return "Linux"
end

M.search = function(query)
	query = query:gsub(" ", "+")
	local url = (search_engines[config.engine] or config.engine) .. query
	if getOs() == "Linux" then
		os.execute("xdg-open '" .. url .. "' > /dev/null 2>&1 &")
	else
		os.execute("open '" .. url .. "'")
	end
end

vim.api.nvim_create_user_command(config.command_search or "WitSearch", function(opts)
	M.search(opts.args)
end, { nargs = 1 })

vim.api.nvim_create_user_command(config.command_search_visual or "WitSearchVisual", function()
	local lines = vim.fn.getline("'<", "'>")
	local query = type(lines) == "table" and table.concat(lines, " ") or lines
	M.search(query)
end, { range = true }) -- allowing range to handle f**ing E481

vim.api.nvim_create_user_command(config.command_search_wiki or "WitSearchWiki", function(opts)
	local query = opts.args:gsub(" ", "_")
	local url = "https://en.wikipedia.org/w/index.php?search=" .. query
	os.execute("xdg-open '" .. url .. "' > /dev/null 2>&1 &")
end, { nargs = 1 })

M.setup = config.setup

return M
