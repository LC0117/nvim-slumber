local avatar = {
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠈⠉⠠⠏⠛⠋⠛⠋⠝⠐⠋⠁⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⣿⣿⣿⢹⣽⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⢨⣹⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡏⢈⣉⣿⡏⣿⣿",
    "⣿⣿⣿⠿⢿⣛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⠿⠇⠈⠋⣿⡇⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣆⠀⡃⣿⣇⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣟⠀⡇⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠒⠀⠀⠀⠀⠀⢰⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⢶⣤⠀⡇⢹⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣴⠁⠀⠀⠀⠀⠀⠀⠀⠀⣒⣛⢢⣆⠀⣼⣧⣿⣿⡯⢭⢀⣾⡀⠀⠀⠀⠀⠀⠀⠘⣿⠀⡧⢸⣿⢿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⣰⡏⠘⢿⣿⣿⣦⣿⣿⣿⣿⣷⢶⣦⡹⡇⠀⠀⠀⠀⠀⠀⠀⢻⠀⣧⢸⣿⢸⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⣿⣷⣤⣾⣿⣿⣿⣿⣿⣿⣿⣧⣀⣽⡗⠀⠀⠀⠀⠀⠀⠀⢰⣼⠀⣀⢸⣿⠘⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣥⡆⠀⠀⠀⠀⠀⠀⣾⣿⠀⢉⠘⡟⠀⢿",
    "⠛⠙⠛⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡶⣧⠀⠀⠀⢸⣿⣿⠀⢘⠀⡏⠀⢸",
    "⣀⣀⣤⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⣿⣿⣿⣿⣿⠟⣋⣛⠛⢿⣿⣿⣿⣿⣿⣿⣷⠃⠀⠀⠀⠸⣿⣿⠀⠸⠀⣧⡂⢠",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠘⣿⡿⣛⣥⣾⣿⣿⣿⣶⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠠⣿⣿⠀⢸⠀⣇⠀⢸",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⣿⡿⠀⢀⠀⡗⡂⠸",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣿⣿⡿⢟⣫⡅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠈⠀⡇⠀⢀",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⢸⠀⠀",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⡇⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⡿⢟⠀⠀⠄⢸⠇⠀",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⡀⠀⠄⠀⠀⠀⠀⠀⠀⠀⠀⡇⠉⠀⠀⡀⢘⠤⠀",
    "⠋⠛⠛⠋⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢺⣿⣿⣿⣿⣿⢿⣿⣿⣅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⢰⡨⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⡿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠀⠀⠂⢸⢥⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠒⠀⠀⠀⠀⠘⠁⠀",
}

local neovim = {
    " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
    " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
    " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
    " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
    " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
    " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
}

local header = {
    type = "text",
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    title = "Header",
    margin = 5,
    content = avatar,
    highlight = "Statement",
    default_color = "",
    oldfiles_amount = 0,
}

local body = {
    type = "mapping",
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    title = "Basic Commands",
    margin = 5,
    content = {
        { " Find File", "Telescope find_files", "<leader>ff" },
        { " Find Word", "Telescope live_grep", "<leader>lg" },
        { " Recent Files", "Telescope oldfiles", "<leader>of" },
        { " File Browser", "Telescope file_browser", "<leader>fb" },
        { " Colorschemes", "Telescope colorscheme", "<leader>cs" },
        { " New File", "lua require'startup'.new_file()", "<leader>nf" },
    },
    highlight = "String",
    default_color = "",
    oldfiles_amount = 0,
}
local date = {
    type = "text",
    content = function()
        local clock = " " .. os.date("%H:%M")
        local date = " " .. os.date("%d-%m-%y")
        return { clock, date }
    end,
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    title = "",
    margin = 5,
    highlight = "TSString",
    default_color = "#FFFFFF",
    oldfiles_amount = 10,
}

local settings = {
    header = header,
    body = body,
    date = date,
    options = {
        mapping_keys = true,
        cursor_column = 0.5,
        empty_lines_between_mappings = true,
        disable_statuslines = true,
        paddings = { 2, 1, 1 },
    },
    colors = {
        background = "#1f2227",
        folded_section = "#56b6c2",
    },
    mappings = {
        execute_command = "<CR>",
        open_file = "o",
        open_file_split = "<c-o>",
        open_section = "<TAB>",
        open_help = "?",
    },
    parts = {
        "header",
        "body",
        "date",
    },
}

require("startup").create_mappings({
    ["<leader>ff"] = "<cmd>Telescope find_files<CR>",
    ["<leader>lg"] = "<cmd>Telescope live_grep<CR>",
    ["<leader>of"] = "<cmd>Telescope oldfiles<CR>",
    ["<leader>fb"] = "<cmd>Telescope file_browser<CR>",
    ["<leader>cs"] = "<cmd>Telescope colorscheme<CR>",
    ["<leader>nf"] = "<cmd>Telescope new_file<CR>",
})
require("startup").setup(settings)
--require("startup").setup({theme = "dashboard"})
