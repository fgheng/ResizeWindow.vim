let s:save_cpo = &cpo
set cpo&vim

echom "hello"


if exists('g:loaded_resize_window')
  finish
endif
let g:loaded_resize_window = 1

nnoremap <silent> <Plug>(resize_window_down)  :<C-u>call ResizeWindow#down()<CR>
nnoremap <silent> <Plug>(resize_window_up)    :<C-u>call ResizeWindow#up()<CR>
nnoremap <silent> <Plug>(resize_window_left)  :<C-u>call ResizeWindow#left()<CR>
nnoremap <silent> <Plug>(resize_window_right) :<C-u>call ResizeWindow#right()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
