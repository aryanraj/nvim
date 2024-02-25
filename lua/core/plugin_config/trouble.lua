local trouble = require('trouble')

trouble.setup({})

vim.keymap.set('n', "<leader>xx", trouble.toggle, {})
