local telescope = require('telescope')

telescope.setup({ 
  extensions = {
    fuzzy = true,
    override_generic_sorter = true,
    override_file_sorter = true,
    case_mode = "smart_case"
  },
  defaults = { 
    file_ignore_patterns = {'node_modules'},
    preview = false
  } 
})

