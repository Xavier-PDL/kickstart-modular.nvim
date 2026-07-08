return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  ft = { 'markdown' },
  opts = {
    heading = {
      icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
    },
    code = {
      sign = true,
      width = 'block',
      right_pad = 1,
    },
    checkbox = {
      enabled = true,
      unchecked = {
        icon = '󰄱 ',
        highlight = 'RenderMarkdownUnchecked',
      },
      checked = {
        icon = '󰱒 ',
        highlight = 'RenderMarkdownChecked',
      },
    },
    bullet = {
      icons = { '●' },
    },
    quote = {
      icon = '┃',
    },
  },
  config = function(_, opts)
    require('render-markdown').setup(opts)

    -- Optional: Toggle command
    vim.keymap.set('n', '<leader>rm', ':RenderMarkdown toggle<CR>', { desc = '[R]ender [M]arkdown toggle' })
  end,
}
