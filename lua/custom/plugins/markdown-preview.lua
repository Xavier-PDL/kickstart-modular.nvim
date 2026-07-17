return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  keys = {
    { '<leader>mp', '<cmd>MarkdownPreviewToggle<CR>', desc = '[M]arkdown [P]review toggle' },
  },
  init = function()
    vim.g.mkdp_auto_close = 1
  end,
}
