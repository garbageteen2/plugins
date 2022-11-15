-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- jj to leave insert mode
map("i", "jj", "<ESC>")

map("n", "<Enter>", "o<ESC>")

-- Fix paste formatting
map("i", "<C-V>", "<ESC>\"+p")

-- Ctrl c to copy to system clipboard
map("v", "<C-c>", "\"+y")

-- Tab to indent shift tab to unindent.
map("v", "<Tab>", ">gv")
map("n", "<Tab>", "V>gv<ESC>")
map("v", "<S-Tab>", "<gv")
map("n", "<S-Tab>", "V<gv<ESC>")
-- Only works for begining of line cant unindent in the middle
map("i", "<S-Tab>", "<ESC>v$<I")

-- Navigate splits with Ctrl hjkl
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Increase split size
map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Escape from terminal with jj
map("t", "jj", "<C-\\><C-n>")

-- Open a terminal with \tt
-- map("n", "<Leader>tt", ":10sp| :terminal<Enter>")

-- Don't overwrite your register when you paste
map("v", "p", '"_dP')

-- Ctrl s to save
map("n", "<C-s>", ":<c-u>update<cr>")
map("v", "<C-s>", "<c-c>:update<cr>gv")
map("i", "<C-s>", "<c-o>:update<cr>")
