-- Taken from https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/dap.lua

local Job = require "plenary.job"
local dap = require "dap"

local M = {}

M.build_and_debug = function()
  local args = { "build", "--message-format=json" }
  vim.notify("Building the target with: cargo " .. table.concat(args, " "))

  Job:new({
    command = "cargo",
    args = args,
    on_exit = function(j, code)
      if code and code > 0 then
        vim.notify "An error occured while compiling. Please fix all compilation issues and try again."
      end

      vim.schedule(function()
        for _, value in pairs(j:result()) do
          local json = vim.fn.json_decode(value)
          if type(json) == "table" and json.executable ~= vim.NIL and json.executable ~= nil then
            dap.run {
              name = "Rust tools debug",
              type = "codelldb",
              request = "launch",
              program = json.executable,
              stopOnEntry = false,
              runInTerminal = false,
            }
            break
          end
        end
      end)
    end,
  }):start()
end

return M
