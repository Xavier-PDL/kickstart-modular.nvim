return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = { 'go', 'python' },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
