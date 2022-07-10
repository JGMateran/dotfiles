local neogit = require('neogit')

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

neogit.setup({
  integrations = {
    -- use { 
    --   'TimUntersberger/neogit', 
    --   requires = { 
    --     'nvim-lua/plenary.nvim',
    --     'sindrets/diffview.nvim' 
    --   }
    -- }
    diffview = true
  }
})

keymap('n', '<leader>gg', ':Neogit<cr>', opts)
keymap('n', '<leader>gc', ':Neogit commit<cr>', opts)
