require('kommentary.config').configure_language({"default"}, {
  prefer_single_line_comments = true,
  ignore_whitespace = false,
  use_consistent_indentation = true
})

vim.api.nvim_set_keymap("n", "<C-_>", "gcc", {noremap = false})
vim.api.nvim_set_keymap("v", "<C-_>", "gc", {noremap = false})
vim.api.nvim_set_keymap("i", "<C-_>", "<ESC>gccI", {noremap = false})
