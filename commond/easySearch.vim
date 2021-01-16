autocmd User esearch_win_config
  \  let b:autopreview = esearch#async#debounce(b:esearch.preview_open, 100)
  \| autocmd CursorMoved <buffer> call b:autopreview.apply({'align': 'right'})
