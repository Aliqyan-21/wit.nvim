local M = {}

--- @type wit.Config
M.values = {
	engine = "google",
	command_search = "WitSearch",
	command_search_visual = "WitSearchVisual",
	command_search_wiki = "WitSearchWiki",
}

--- Sets up the config
--- @param opts wit.SetupOpts
function M.setup(opts)
	if opts then
		for k, v in pairs(opts) do
			if M.values[k] ~= nil then
				M.values[k] = v
			end
		end
	end
end

return M
