local u_bundles = {
    vim.fn.glob(
        "~/.vscode/extensions/vscjava.vscode-java-debug-0.37.0/server/com.microsoft.java.debug.plugin-*.jar"
    ),
}
vim.list_extend(
    u_bundles,
    vim.split(vim.fn.glob("~/.vscode/extensions/vscjava.vscode-java-test-0.33.0/server/*.jar"), "\n")
)

local conf = {
    cmd = { "jdtls" },
    root_dir = require("jdtls.setup").find_root({ ".git" }),
    init_options = {
        bundles = u_bundles,
    },
    on_attach = function(client, bufnr)
        require("jdtls").setup_dap({ hotcodereplace = "auto" })
    end,
}

require("jdtls").start_or_attach(conf)
