pcall(
    vim.cmd,
    [[ 
let g:local_history_max_changes = 100 
let g:local_history_exclude = [ '**/node_modules/**', '*.txt' ]
let g:local_history_mappings = {
  \ "diff": ["d"],
  \ "quit": ["q", "Q"],
  \ "preview_bigger": ["b"],
  \ }
]]
)
