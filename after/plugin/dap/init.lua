


local dap_breakpoint = {
    error = {
        text = "🟥",
        texthl = "LspDiagnosticsSignError",
        linehl = "",
        numhl = "",
    },
    rejected = {
        text = "",
        texthl = "LspDiagnosticsSignHint",
        linehl = "",
        numhl = "",
    },
    stopped = {
        text = "⭐️",
        texthl = "LspDiagnosticsSignInformation",
        linehl = "DiagnosticUnderlineInfo",
        numhl = "LspDiagnosticsSignInformation",
    },
}

vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)

require("nvim-dap-virtual-text").setup()
require('dap-go').setup()
require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end


-- Keymaps
vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>", {desc = "DAP: Continue"})
vim.keymap.set("n", "<F3>", ":lua require'dap'.step_over()<CR>", {desc = "DAP: Step Over"})
vim.keymap.set("n", "<F2>", ":lua require'dap'.step_into()<CR>", {desc = "DAP: Step Into"})
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>", {desc = "DAP: Step Out"})
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", {desc = "DAP: Toggle Breakpoint"})
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {desc = "DAP: Set Breakpoint"})
vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", {desc = "DAP: Log Point"})
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", {desc = "DAP: Open REPL"})
vim.keymap.set("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>", {desc = "DAP: Debug Test"})
