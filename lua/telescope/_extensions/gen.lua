local has_telescope, telescope = pcall(require, 'telescope')
if not has_telescope then
  error('This plugin requires nvim-telescope/telescope.nvim')
end

local prompts = require("telescope._extensions.gen.prompts")

return telescope.register_extension({
  exports = {
    prompts = prompts,
  }
})
