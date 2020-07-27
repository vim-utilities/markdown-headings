#!/usr/bin/env vim


autocmd FileType markdown call s:Register_Leader()
autocmd FileType markdown call s:Register_Commands()


""
" Registers Normal mode leader sequences
function! s:Register_Leader()
  nnoremap <Leader>h0 :call MarkDown_Heading_Transform(0)<cr>
  nnoremap <Leader>h1 :call MarkDown_Heading_Transform(1)<cr>
  nnoremap <Leader>h2 :call MarkDown_Heading_Transform(2)<cr>
  nnoremap <Leader>h3 :call MarkDown_Heading_Transform(3)<cr>
  nnoremap <Leader>h4 :call MarkDown_Heading_Transform(4)<cr>
endfunction


""
" Registers Ex mode commands
function! s:Register_Commands()
  command! -nargs=1 H call MarkDown_Heading_Transform(<f-args>)
endfunction


""
" Transforms current line to MarkDown heading of defined depth
" @param {number} depth - Heading depth, eg. `0`, or `1`, or `-1`, etc
" @author S0AndS0
" @license AGPL-3.0
" @example text
" foo bar
" @example input
" \h3
" @example output
" ### foo bar
function! MarkDown_Heading_Transform(depth)
  let l:cursor_position = getpos('.')
  let l:current_line = getline('.')
  let l:trimmed_line = substitute(l:current_line, '^#* ', '', '')
  let l:current_depth = len(substitute(l:current_line, '[^#*].*', '', ''))

  if a:depth == l:current_depth
    return
  elseif a:depth > l:current_depth && l:current_depth == 0
    let l:cursor_x_offset = a:depth + 1 - l:current_depth
  elseif a:depth < l:current_depth && a:depth == 0
    let l:cursor_x_offset = a:depth - 1 - l:current_depth
  else
    let l:cursor_x_offset = a:depth - l:current_depth
  endif

  if a:depth > 0
    let l:headings = repeat('#', a:depth)
    let l:heading_line = join([l:headings, ' ', l:trimmed_line], '')
    let l:cursor_position[2] += l:cursor_x_offset
  elseif a:depth == 0
    let l:heading_line = l:trimmed_line
    if l:cursor_position[2] > 0
      let l:cursor_position[2] += l:cursor_x_offset
    else
      let l:cursor_position[2] = 0
    endif
  else
    let l:new_depth = len(repeat('#', l:current_depth + a:depth))
    if l:new_depth > 0
      call MarkDown_Heading_Transform(l:new_depth)
    else
      call MarkDown_Heading_Transform(0)
    endif
    return
  endif

  execute 'normal! 0d$0i' . l:heading_line
  call setpos('.', l:cursor_position)
endfunction

