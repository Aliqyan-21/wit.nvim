local M = {}

--- Get the current OS
--- @return string
function M.getOs()
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

return M
