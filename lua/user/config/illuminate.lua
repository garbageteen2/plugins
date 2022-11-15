-- small delay
-- highlights the word instead of underlining
-- Don't highlight the word you're on
vim.cmd([[
  let g:Illuminate_delay = 100
  hi link illuminatedWord Visual
  let g:Illuminate_highlightUnderCursor = 0
]])
