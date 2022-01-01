local function load()
    require("neorg").modules.load_module("core.norg.completion", nil, {
        engine = "nvim-cmp",
    })
end
require("neorg").setup({
    load = {
        ["core.defaults"] = {},
        ["core.norg.completion"] = {
            config = {
                engine = "nvim-cmp",
            },
        },
        ["core.norg.concealer"] = {},
        ["core.integrations.telescope"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    plan_space = "~/Proj/neorg",
                },
            },
        },
    },
})
local neorg_callbacks = require("neorg.callbacks")

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
    -- Map all the below keybinds only when the "norg" mode is active
    keybinds.map_event_to_mode("norg", {
        n = { -- Bind keys in normal mode
            { "<C-s>", "core.integrations.telescope.find_linkable" },
        },

        i = { -- Bind in insert mode
            { "<C-l>", "core.integrations.telescope.insert_link" },
        },
    }, {
        silent = true,
        noremap = true,
    })
end)
if require("neorg").is_loaded() then
    load()
else
    require("neorg").callbacks.on_event("core.started", load)
end
