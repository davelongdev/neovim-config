local rainbow_delimiters = require 'rainbow-delimiters'

vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
        javascript = 'rainbow-delimiters-react',
        astro = '; inherits: ecma, jsx, html, typescript',
    },
    highlight = {
    'RainbowDelimiterRed',
    'RainbowDelimiterViolet',
    'RainbowDelimiterOrange',
    'RainbowDelimiterYellow',
    'RainbowDelimiterBlue',
    'RainbowDelimiterGreen',
    'RainbowDelimiterCyan',
    },
}

