-- Numbers on the side
vim.o.number = true

-- Numbers will show relative to your position
vim.o.relativenumber = true

-- Tabs will now do 2 spaces
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

-- Disables filetype.vim to use a faster version
-- vim.g.did_load_filetypes = 1

-- Makes the thing at the bottom a little taller
vim.o.cmdheight = 2

-- Should vim ignore your capitals when searching
vim.o.ignorecase = false

-- Don't show stuff like INSERT VISUAL at the bottom
vim.o.showmode = true

-- Min number of lines to keep below the cursor when scrolling
vim.o.scrolloff = 8

-- When making a split make it below or to the right
vim.o.splitbelow = true
vim.o.splitright = true

-- Crucial for things like nvim-tree git highlighting
vim.o.termguicolors = true
