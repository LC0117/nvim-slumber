vim.api.nvim_create_user_command('TSPreferGit', function(opts)
  require('nvim-treesitter.install').prefer_git = true
  if opts.bang then
    require('nvim-treesitter.install').prefer_git = false
  end
end, {
  desc = 'Toggle prefer_git for treesitter parsers installation',
  bang = true,
})

vim.api.nvim_create_user_command('MasonMirror', function(opts)
  require('mason').setup({
    github = {
      download_url_template = 'https://' .. opts.fargs[1] .. '/%s/releases/download/%s/%s',
    },
  })
end, {
  desc = 'Mason github download mirror',
  nargs = 1,
  complete = function()
    return { 'hub.fgit.ml' }
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function(args)
    local bufnr = args.buf
    local ft = vim.bo[bufnr].filetype
    if vim.tbl_contains({'', 'tex', 'latex'}, ft) or vim.b[bufnr].treesitter_highlighted then
      return
    end
    local success = pcall(vim.treesitter.start)
    if success then
      vim.b[bufnr].treesitter_highlighted = true
    end
  end,
})
