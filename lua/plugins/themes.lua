return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    --    init = function()
    --      vim.cmd.colorscheme 'tokyonight-night'
    --      vim.cmd.hi 'Comment gui=none'
    --    end,
    config = function()
      require('tokyonight').setup {
        style = 'storm',
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          sidebars = 'dark',
          floats = 'dark',
        },
      }
    end,
  },
}
