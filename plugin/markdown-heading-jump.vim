#!/usr/bin/env vim
" vim: expandtab


""
" Find occurrences of MarkDown headings with defined link anchors, eg.
"
" ```markdown
" ## Sub heading
" [label_for_sub_heading]: #sub-heading "Title for Sub heading
"
" ## Other heading
" [label_for_other_heading]:
"   #other-heading
"   "Title for Other heading
" ```
"
" ## Regular Expression Explanation
"
" - `^#\+`   -- Lines starting with at least one hash `#`
" - `\zs`    -- If matched put cursor here
" - `\s\+`   -- At least one space
" - `\S`     -- Any non-space character other than end-of-line/new-line
" - `.*`     -- Any number of characters other than end-of-line/new-line 
" - `\_.`    -- Any single character or end-of-line
" - `\[.*]:` -- Match next line if it looks like a heading link
function! MarkDown_Headings_Jump(direction) abort
  if a:direction == 'forward'
    let l:direction = 'W'
  else
    let l:direction = 'bW'
  endif

  let l:heading_pattern_text = '^#\+\zs\s\+\S.*\_.\[.*\]:'
  call search(l:heading_pattern_text, l:direction)
endfunction

noremap <silent> ]h :call MarkDown_Headings_Jump('forward')<CR>
noremap <silent> [h :call MarkDown_Headings_Jump('backward')<CR>


""
"
function! MarkDown_Headings__Jump()
  let l:current_line = getline('.')
  if l:current_line =~ ".*\[\\p*\]\[\\p*\].*"
    echo 'On usage l:current_line ->' l:current_line
  elseif l:current_line =~ ".*\[\\p*\]:.*"
    echo 'At heading l:current_line ->' l:current_line
  else
    echo 'Did not match l:current_line ->' l:current_line
  endif
endfunction
" [foo][barred]
"
" [foo]: #something
