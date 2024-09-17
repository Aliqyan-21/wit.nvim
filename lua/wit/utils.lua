local M = {}

--- Get the visual selection
--- Ref: https://github.com/neovim/neovim/pull/13896#issuecomment-1621702052
--- @return string[]
function M.get_visual_selection()
	local region = vim.region(0, "'<", "'>", vim.fn.visualmode(), true)
	local lines = {}
	local maxcol = vim.v.maxcol
	for line, cols in vim.spairs(region) do
		local endcol = cols[2] == maxcol and -1 or cols[2]
		local chunk = vim.api.nvim_buf_get_text(0, line, cols[1], line, endcol, {})[1]
		chunk = chunk:gsub("%s+", "")
		lines[#lines + 1] = chunk:gsub("%s+", "")
	end
	return lines
end

--- Normalize text for use in URLs
--- @param text string
--- @return string
function M.normalize_for_url(text)
	-- Trim leading and trailing whitespace
	text = text:match("^%s*(.-)%s*$")
	-- Replace spaces with "+"
	text = text:gsub("%s+", "+")
	-- Encode special characters
	text = text:gsub("[^%w+]", function(char)
		return string.format("%%%02X", char:byte())
	end)
	return text
end

return M
