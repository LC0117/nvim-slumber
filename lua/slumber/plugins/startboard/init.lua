local avatar = {
  '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠈⠉⠠⠏⠛⠋⠛⠋⠝⠐⠋⠁⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⣿⣿⣿⢹⣽⣿⣿⣿⣿',
  '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⢨⣹⣿⣿⣿⣿',
  '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡏⢈⣉⣿⡏⣿⣿',
  '⣿⣿⣿⠿⢿⣛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⠿⠇⠈⠋⣿⡇⣿⣿',
  '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣆⠀⡃⣿⣇⣿⣿',
  '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣟⠀⡇⣿⣿⣿⣿',
  '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠒⠀⠀⠀⠀⠀⢰⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⢶⣤⠀⡇⢹⣿⣿⣿',
  '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣴⠁⠀⠀⠀⠀⠀⠀⠀⠀⣒⣛⢢⣆⠀⣼⣧⣿⣿⡯⢭⢀⣾⡀⠀⠀⠀⠀⠀⠀⠘⣿⠀⡧⢸⣿⢿⣿',
  '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⣰⡏⠘⢿⣿⣿⣦⣿⣿⣿⣿⣷⢶⣦⡹⡇⠀⠀⠀⠀⠀⠀⠀⢻⠀⣧⢸⣿⢸⣿',
  '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⣿⣷⣤⣾⣿⣿⣿⣿⣿⣿⣿⣧⣀⣽⡗⠀⠀⠀⠀⠀⠀⠀⢰⣼⠀⣀⢸⣿⠘⣿',
  '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣥⡆⠀⠀⠀⠀⠀⠀⣾⣿⠀⢉⠘⡟⠀⢿',
  '⠛⠙⠛⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡶⣧⠀⠀⠀⢸⣿⣿⠀⢘⠀⡏⠀⢸',
  '⣀⣀⣤⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⣿⣿⣿⣿⣿⠟⣋⣛⠛⢿⣿⣿⣿⣿⣿⣿⣷⠃⠀⠀⠀⠸⣿⣿⠀⠸⠀⣧⡂⢠',
  '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠘⣿⡿⣛⣥⣾⣿⣿⣿⣶⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠠⣿⣿⠀⢸⠀⣇⠀⢸',
  '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⣿⡿⠀⢀⠀⡗⡂⠸',
  '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣿⣿⡿⢟⣫⡅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠈⠀⡇⠀⢀',
  '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⢸⠀⠀',
  '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⡇⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⡿⢟⠀⠀⠄⢸⠇⠀',
  '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⡀⠀⠄⠀⠀⠀⠀⠀⠀⠀⠀⡇⠉⠀⠀⡀⢘⠤⠀',
  '⠋⠛⠛⠋⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢺⣿⣿⣿⣿⣿⢿⣿⣿⣅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⢰⡨⠀',
  '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⡿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠀⠀⠂⢸⢥⠀',
  '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠒⠀⠀⠀⠀⠘⠁⠀',
}

local neovim = {
  '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀  ⠀     ',
  '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀  ⠀     ',
  ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
  '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀  ⠀     ',
  '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀  ⠀     ',
}

local db = require('dashboard')
db.hide_statusline = true
db.hide_tabline = true
db.custom_header = avatar
db.custom_footer = function()
  local clock = ' ' .. os.date('%H:%M')
  local date = ' ' .. os.date('%d-%m-%y')
  return { clock, date }
end
db.custom_center = {
  {
    icon = ' ',
    desc = 'Find Files          ',
    action = [[Telescope find_files]],
    shortcut = 'SPC f f',
  },
  {
    icon = ' ',
    desc = 'Find Word           ',
    action = [[Telescope live_grep]],
    shortcut = 'SPC l g',
  },
  {
    icon = ' ',
    desc = 'File Browser        ',
    action = [[Telescope file_browser]],
    shortcut = 'SPC f b',
  },
  {
    icon = ' ',
    desc = 'Recent Files        ',
    action = [[DashboardFindHistory]],
    shortcut = 'SPC f h',
  },
}
