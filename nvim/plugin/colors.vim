" Custom color tweaks

function! s:setup_colors() abort

  let sign_col_bg = synIDattr(synIDtrans(hlID('SignColumn')), 'bg#', 'gui') 
  let sign_col_bg = empty(sign_col_bg) ? synIDattr(synIDtrans(hlID('SignColumn')), 'bg#', 'cterm') : sign_col_bg
  exec 'hi RedSign guifg=#cc241d ctermfg=124 gui=NONE cterm=NONE guibg=NONE' . sign_col_bg
  exec 'hi YellowSign guifg=#fabd2f ctermfg=214 gui=NONE cterm=NONE guibg=NONE' . sign_col_bg
  exec 'hi GreenSign guifg=#b8cc26 ctermfg=142 gui=NONE cterm=NONE guibg=NONE' . sign_col_bg
  exec 'hi BlueSign guifg=#83a5cb ctermfg=109 gui=NONE cterm=NONE guibg=NONE' . sign_col_bg
  exec 'hi PurpleSign guifg=#a3a5eb ctermfg=109 gui=NONE cterm=NONE guibg=NONE' . sign_col_bg
  exec 'hi AquaSign guifg=#8ec07c ctermfg=108 gui=NONE cterm=NONE guibg=NONE' . sign_col_bg
  exec 'hi WhiteSign guifg=#ffffff gui=NONE cterm=NONE guibg=NONE' . sign_col_bg

  hi! link LspFloatWinBorder IndentBlanklineChar
  hi! link LspSagaDiagnosticBorder IndentBlanklineChar
  hi! link LspSagaDiagnosticTruncateLine IndentBlanklineChar
endfunction

augroup colors_customization
  au!
  au ColorScheme * call s:setup_colors()
augroup END

call s:setup_colors()
