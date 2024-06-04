return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.opt.termguicolors = true
    require('bufferline').setup {
      options = {
        'buffers',
      },
    }

    local builtin = require 'bufferline'
    vim.keymap.set('n', '<leader>bp', builtin.pick, { desc = '[P]ick [B]uffer' })
    vim.keymap.set('n', '<leader>bd', builtin.close_with_pick, { desc = '[D]elete [B]uffer' })
  end,
}
