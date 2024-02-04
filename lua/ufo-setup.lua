vim.opt.foldcolumn = '1' -- '0' is not bad
vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
vim.keymap.set('n', 'zK', function ()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
        vim.lsp.buf.hover()
    end
end, { desc = "peek fold"}
)

-- set up lsp as lsp client with indent as fallback
require('ufo').setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {'lsp'}
    end
})

-- remove highlighting of folds (lua calling vimscript)
vim.cmd("highlight folded guibg=none")

-- remove highlighting of folds (using the lua api)
-- vim.api.nvim_set_hl(0, "Folded", { bg = nil })
