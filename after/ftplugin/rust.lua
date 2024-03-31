-- Taken from https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/after/ftplugin/rust.lua

vim.keymap.set("n", "<F5>", function()
  if require("dap").session() then
    require("dap").continue()
  else
    require("aryan.dap").build_and_debug()
  end
end)
