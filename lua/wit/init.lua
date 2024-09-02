local M = {}

M.wit_search = function(query)
	query = query:gsub(" ", "+")
	local url = "https://www.google.com/search?q=" .. query
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

return M
