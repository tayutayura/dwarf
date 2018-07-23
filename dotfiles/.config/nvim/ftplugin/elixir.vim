" @ref https://github.com/phoenixframework/phoenix/issues/1165#issuecomment-307863099
augroup AleGroup
  autocmd!
  autocmd User ALELintPost call TouchOpenFile()
augroup END

func! TouchOpenFile()
  let g:ale_enabled = 0
  sleep 500m
  w
  let g:ale_enabled = 1
endfunc
