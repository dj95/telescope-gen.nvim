local actions = require("telescope.actions")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local sorters = require("telescope.sorters")
local state = require("telescope.actions.state")

local gen = require("gen")
local prompts = require("gen.prompts")

return function(opts)
	pickers
		.new(opts, {
			prompt_title = "gen.nvim prompts",
			finder = finders.new_table({
				results = vim.tbl_keys(prompts),
			}),
			sorter = sorters.get_generic_fuzzy_sorter(),
			attach_mappings = function(prompt_bufnr, _)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)

					local selection = state.get_selected_entry()
					local prompt = prompts[selection[1]]

					if prompt == nil then
						vim.notify("cannot find prompt", vim.log.levels.WARN)

						return
					end

					gen.exec(vim.tbl_deep_extend("force", { mode = opts.mode }, prompt))
				end)
				return true
			end,
		})
		:find()
end
