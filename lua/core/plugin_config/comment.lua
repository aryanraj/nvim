local comment = require('Comment')
local integrate = require('ts_context_commentstring.integrations.comment_nvim')
comment.setup({
  pre_hook = integrate.create_pre_hook(),
})
