local M = {}

function M.jdtls()
    require("slumber.lang.java")
end

function M.rust_tools()
    require("slumber.lang.rust_tools")
end

function M.flutter_tools()
    require("slumber.lang.flutter_tools")
end

function M.go()
    require("slumber.lang.go")
end

function M.crate()
    require("slumber.lang.crate")
end

function M.dap()
    require("slumber.lang.dap")
end

function M.dapui()
    require("slumber.lang.dapui")
end

function M.daptext()
    require("nvim-dap-virtual-text").setup({
        highlight_changed_variables = true,
        enabled = true,
        all_frames = true,
        commented = true,
    })
end

function M.scala()
    local metals_config = require("metals").bare_config()
    metals_config.init_options.statusBarProvider = "on"
    metals_config.settings = {
        showImplicitArguments = true,
    }
    require("metals").initialize_or_attach({})
end

return M
