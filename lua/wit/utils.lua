local M = {}

--- Get the current OS
--- @return string|nil
function M.get_os()
	local fh = io.popen("uname")

	if not fh then
		vim.notify("wit.nvim: uname command not found", vim.log.levels.ERROR)
		return nil
	end

	local uname = fh:read("*l")

	fh:close()

	if uname == "Darwin" then
		return "MacOS"
	end

	return "Linux"
end

return M
