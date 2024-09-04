local M = {}
local m_config = require("wit.config")

M.wit_search = function(query)
	query = query:gsub(" ", "+")
	local url = "https://www." .. m_config.search_engine .. ".com/search?q=" .. query
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
