let s:save_cpo = &cpo
set cpo&vim

" 步长
let s:resize_window_step = get(g:, 'resize_window_step', 1)

" 检测窗口的某个方向是否还有窗口
function! s:has_win(dir) abort
    return winnr() != winnr(a:dir)
endfunction

" 对于垂直排列的窗口
" 如果垂直方向只有一个窗口，那么不应该有任何动作
" 如果是在顶部，也就是下方有窗口，上方没有窗口，移动的应该是底部的边框
" 如果是在底部，也就是上方有窗口，下方没有窗口，移动的应该是顶部的边框
" 如果是在中间，即上下都有窗口，那么应该移动上方的边框
function! ResizeWindow#up() abort
    if !s:has_win('k') && !s:has_win('j')
        " 只有一个窗口
        return
    elseif s:has_win('j') && !s:has_win('k')
        " 顶部
        exec 'resize -' . s:resize_window_step
    elseif s:has_win('k') && !s:has_win('j')
        " 底部
        exec 'resize +' . s:resize_window_step
    elseif s:has_win('k') && s:has_win('j')
        " 中间
        exec winnr('k') . 'resize -' . s:resize_window_step
    endif
endfunction

function! ResizeWindow#down() abort
    if !s:has_win('k') && !s:has_win('j')
        " 只有一个窗口
        return
    elseif s:has_win('j') && !s:has_win('k')
        " 顶部
        exec 'resize +' . s:resize_window_step
    elseif s:has_win('k') && !s:has_win('j')
        " 底部
        exec winnr('k') . 'resize +' . s:resize_window_step
    elseif s:has_win('k') && s:has_win('j')
        " 中间
        exec winnr('k') . 'resize +' .s:resize_window_step
    endif
endfunction

" 中间窗口水平移动的是右侧的边框
function! ResizeWindow#left() abort
    if !s:has_win('l') && !s:has_win('h')
        " 只有一个窗口
        return
    elseif s:has_win('h') && !s:has_win('l')
        " 最右侧
        exec 'vertical resize +' . s:resize_window_step
    elseif s:has_win('l') && !s:has_win('h')
        " 最左侧
        exec 'vertical resize -' . s:resize_window_step
    elseif s:has_win('h') && s:has_win('l')
        " 中间
        exec 'vertical resize -' . s:resize_window_step
    endif
endfunction

" 中间窗口水平移动的是右侧的边框
function! ResizeWindow#right() abort
    if !s:has_win('l') && !s:has_win('h')
        " 只有一个窗口
        return
    elseif s:has_win('h') && !s:has_win('l')
        " 最右侧
        exec 'vertical resize -' . s:resize_window_step
    elseif s:has_win('l') && !s:has_win('h')
        " 最左侧
        exec 'vertical resize +' . s:resize_window_step
    elseif s:has_win('h') && s:has_win('l')
        " 中间
        exec 'vertical resize +' . s:resize_window_step
    endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
