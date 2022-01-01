local function bind(options)
    for k, v in pairs(options) do
        if v == true then
            vim.cmd("set " .. k)
        elseif v == false then
            vim.cmd("set no" .. k)
        else
            vim.cmd("set " .. k .. "=" .. v)
        end
    end
end
local path_sep = "/"
local home = os.getenv("HOME")
local cache_dir = home .. path_sep .. ".cache" .. path_sep .. "nvim" .. path_sep

local options = {
    termguicolors = true,
    mouse = "a",
    errorbells = true,
    visualbell = true,
    hidden = true,
    fileformats = "unix,mac,dos",
    magic = true,
    virtualedit = "block",
    encoding = "utf-8",
    viewoptions = "folds,cursor,curdir,slash,unix",
    laststatus = 2,
    backup = false,
    writebackup = false,
    swapfile = false,
    directory = cache_dir .. "swap/",
    undodir = cache_dir .. "undo/",
    backupdir = cache_dir .. "backup/",
    viewdir = cache_dir .. "view/",
    spellfile = cache_dir .. "spell/en.utf-8.add",
    cursorline = true,
    cursorcolumn = true,
    showtabline = 2,
    showbreak = "↳  ",
    listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
    backspace = "indent,eol,start",
}

local binds = {
    undofile = true,
    synmaxcol = 2500,
    formatoptions = "1jcroql",
    expandtab = true,
    autoindent = true,
    number = true,
    linebreak = true,
    conceallevel = 0,
    concealcursor = "niv",
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = -1,
    relativenumber = true,
    foldenable = false,
}

local function mkwork()
    vim.cmd([[filetype plugin indent on]])
    vim.g.python_host_prog = "/usr/bin/python"
    vim.g.python3_host_prog = "/usr/bin/python3"
    for k, v in pairs(options) do
        vim.o[k] = v
    end
    bind(binds)
end

mkwork()
