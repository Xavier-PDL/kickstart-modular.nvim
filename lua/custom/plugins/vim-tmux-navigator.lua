return {
  'christoomey/vim-tmux-navigator',
  -- Disable the plugin's default <C-hjkl> / <C-\> maps; navigation lives on
  -- <M-hjkl> (defined in `keys` below), matching the tmux-side bindings.
  init = function()
    vim.g.tmux_navigator_no_mappings = 1
  end,
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
