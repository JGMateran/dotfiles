local treesitter = require('nvim-treesitter.configs')

treesitter.setup({
  highlight = {
		enable = true
	},
  ensure_installed = {
    'tsx',
    'javascript',
    'json',
    'html',
    'css'
  }
})
