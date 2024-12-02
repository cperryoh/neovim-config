return {
  {
    'blumaa/ohne-accidents',
    config = function()
      require("ohne-accidents").setup()
      vim.api.nvim_set_keymap('n', '<leader>oh', ':OhneAccidents<CR>', {noremap = true, silent = true})
    end
  },
}
