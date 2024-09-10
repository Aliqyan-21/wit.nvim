local M = {}

local types = require("wit.types")
local config = require("wit.config")
local core = require("wit.core")

--- Setup function for the plugin
--- @param opts wit.SetupOpts
function M.setup(opts)
    config.setup(opts)
    M.create_commands()
end

function M.create_commands()
    vim.api.nvim_create_user_command(config.values.command_search, function(opts)
        core.search(opts.args)
    end, { nargs = 1 })

    vim.api.nvim_create_user_command(config.values.command_search_visual, function()
        local lines = vim.fn.getline("'<", "'>")
        local query = type(lines) == "table" and table.concat(lines, " ") or lines
        core.search(query)
    end, { range = true })

    vim.api.nvim_create_user_command(config.values.command_search_wiki, function(opts)
        local query = opts.args:gsub(" ", "_")
        local url = "https://en.wikipedia.org/w/index.php?search=" .. query
        core.open_url(url)
    end, { nargs = 1 })
end

return M
