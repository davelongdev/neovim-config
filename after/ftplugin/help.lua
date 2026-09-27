-- help buffers only: Alt+l follows the link under the cursor (overrides the global 20l map)
vim.keymap.set("n", "<M-l>", "<C-]>", { buffer = true, desc = "follow help link" })
