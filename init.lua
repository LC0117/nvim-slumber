do
  local ok, impatient = pcall(require, 'impatient')
  if not ok then
    vim.notify('impatient.nvim not installed', vim.log.levels.WARN)
  else
    impatient.enable_profile()
  end
end

require('slumber')
