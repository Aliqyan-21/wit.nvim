--- @class Config
--- @field search_engine string The search engine to use (default: "google")
--- @field command_search string The command for search (default: "WitSearch")
--- @field command_search_visual string The command for visual search (default: "WitSearchVisual")
--- @field command_search_wiki string The command for wiki search (default: "WitSearchWiki")
local M = {
	search_engine = "google",
	command_search = "WitSearch",
	command_search_visual = "WitSearchVisual",
	command_search_wiki = "WitSearchWiki",
}

--- Sets up the config
--- @param config Config? Optional config table to override defaults.
function M.setup(config)
	if not config then
		return
	end

	for key, value in pairs(config) do
		if M[key] ~= nil then
			M[key] = value
		end
	end
end

return M
