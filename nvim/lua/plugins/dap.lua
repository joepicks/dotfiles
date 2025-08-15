return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>dc", function() require("dap").continue() end, desc = "DAP: Continue (F5)" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "DAP: Toggle breakpoint (F9)" },
      { "<leader>do", function() require("dap").step_over() end, desc = "DAP: Step over (F10)" },
      { "<leader>di", function() require("dap").step_into() end, desc = "DAP: Step into (F11)" },
      { "<leader>du", function() require("dap").step_out() end, desc = "DAP: Step out (F12)" },
      { "<F5>", function() require("dap").continue() end, desc = "DAP: Continue" },
      { "<F9>", function() require("dap").toggle_breakpoint() end, desc = "DAP: Toggle breakpoint" },
      { "<F10>", function() require("dap").step_over() end, desc = "DAP: Step over" },
      { "<F11>", function() require("dap").step_into() end, desc = "DAP: Step into" },
      { "<F12>", function() require("dap").step_out() end, desc = "DAP: Step out" },
      { "<leader>dB", function() require("dap").clear_breakpoints() end, desc = "DAP: Clear breakpoints" },
      { "<leader>dr", function() require("dap").restart() end, desc = "DAP: Restart" },
      { "<leader>dq", function() require("dap").terminate() end, desc = "DAP: Terminate" },
    },
    config = function()
      local dap = require("dap")
      local debugpy_python = "/home/joe/.venv/debugpy/bin/python"
      dap.adapters.python = { type = "executable", command = debugpy_python, args = { "-m", "debugpy.adapter" } }
      dap.configurations.python = {
        { type = "python", request = "launch", name = "Launch file", program = "${file}" },
      }
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    keys = {
      { "<leader>dU", function() require("dapui").toggle() end, desc = "DAP UI: Toggle" },
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui"] = function() dapui.close() end
    end,
  },
}
