local autopairs = require('nvim-autopairs')

autopairs.setup({
    enable_check_bracket_line = true,
    ignored_next_char = "[%w]", -- will ignore alphanumeric and `.` symbol
    fast_wrap = {
      map = '<M-;>',
      keys = 'jklfdsaqwertyuiop',
    }
})
