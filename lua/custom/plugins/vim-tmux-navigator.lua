return {
  'christoomey/vim-tmux-navigator',
  lazy = false,
  cmd = {
    'TmuxNavigateLeft',
    'TmuxNavigateDown',
    'TmuxNavigateUp',
    'TmuxNavigateRight',
  },
  keys = {
    -- { "<M-Left>",  "<cmd>TmuxNavigateLeft<cr>" },
    -- { "<M-Down>",  "<cmd>TmuxNavigateDown<cr>" },
    -- { "<M-Up>",    "<cmd>TmuxNavigateUp<cr>" },
    -- { "<M-Right>", "<cmd>TmuxNavigateRight<cr>" },
    { '<M-h>', '<cmd>TmuxNavigateLeft<cr>' },
    { '<M-j>', '<cmd>TmuxNavigateDown<cr>' },
    { '<M-k>', '<cmd>TmuxNavigateUp<cr>' },
    { '<M-l>', '<cmd>TmuxNavigateRight<cr>' },
    -- { "<c-\\>",    "<cmd>TmuxNavigatePrevious<cr>" },
  },
}
