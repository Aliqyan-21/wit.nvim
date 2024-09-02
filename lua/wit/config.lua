local M = {}

M.search_engine = "google"

function M.setup(config)
	if config and config.search_engine then
		M.search_engine = config.search_engine
	end
end

return M
