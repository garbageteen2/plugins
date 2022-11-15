-- following options are the default
require'nvim-tree'.setup({
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "case_sensitive",
  auto_reload_on_write = true,
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    icons = {
      show = {
        git = false
      }
    }
  },
  git = {
    ignore = false
  },
  filters = {
    dotfiles = false,
  },
})

vim.api.nvim_set_keymap("n", "<F2>", "<cmd>NvimTreeToggle<cr>", {noremap = false})

vim.cmd([[
  highlight NvimTreeGitNew guifg=#27ae60 gui=NONE
  highlight NvimTreeGitDirty guifg=#f39c12 gui=NONE
]])
