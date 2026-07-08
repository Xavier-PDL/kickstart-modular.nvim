return {
  'CopilotC-Nvim/CopilotChat.nvim',
  dependencies = {
    { 'github/copilot.vim' },
    { 'nvim-lua/plenary.nvim' },
  },
  opts = {
    window = {
      layout = 'float',
      relative = 'editor',
      width = 0.8,
      height = 0.8,
      border = 'rounded',
    },
  },
  keys = {
    { '<leader>cc', '<cmd>CopilotChatToggle<CR>', desc = '[C]opilot [C]hat toggle' },
    { '<leader>ce', '<cmd>CopilotChatExplain<CR>', mode = 'v', desc = '[C]opilot [E]xplain selection' },
    { '<leader>cr', '<cmd>CopilotChatReview<CR>', mode = 'v', desc = '[C]opilot [R]eview selection' },
    { '<leader>cf', '<cmd>CopilotChatFix<CR>', mode = 'v', desc = '[C]opilot [F]ix selection' },
    { '<leader>co', '<cmd>CopilotChatOptimize<CR>', mode = 'v', desc = '[C]opilot [O]ptimize selection' },
    { '<leader>ct', '<cmd>CopilotChatTests<CR>', mode = 'v', desc = '[C]opilot generate [T]ests' },
    { '<leader>cq', function()
        local input = vim.fn.input 'Copilot Chat: '
        if input ~= '' then
          vim.cmd('CopilotChat ' .. input)
        end
      end, desc = '[C]opilot [Q]uick chat' },
  },
  cmd = {
    'CopilotChat',
    'CopilotChatToggle',
    'CopilotChatExplain',
    'CopilotChatReview',
    'CopilotChatFix',
    'CopilotChatOptimize',
    'CopilotChatTests',
  },
}
