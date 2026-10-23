return {
  'kdheepak/lazygit.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  keys = {
    { '<leader>lg', '<cmd>LazyGit<CR>', desc = '[L]azy[G]it' },
    { '<leader>lf', '<cmd>LazyGitCurrentFile<CR>', desc = '[L]azygit current [F]ile history' },
  },
  init = function()
    vim.g.lazygit_floating_window_scaling_factor = 0.9
  end,
}
