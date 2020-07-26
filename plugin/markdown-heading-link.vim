#!/usr/bin/env vim


autocmd FileType markdown nnoremap <Leader>hl :call MarkDown_Headings_Make_Link()<cr>
autocmd FileType markdown command! -nargs=* Hl call MarkDown_Headings_Make_Link(<f-args>)


""
" Returns lower-cased string, replacing spaces with dashes and striping non-alpha/numeric characters
" @param {string} heading_text -
" @return {string}
" @author S0AndS0
" @license AGPL-3.0
" @example
" echo s:Sluggify('## Spam Flavored Ham')
" #> spam-flavored-ham
function! s:Sluggify(heading_text)
  let l:trimmed_line = substitute(a:heading_text, '^#* ', '', '')
  let l:lowered_line = tolower(l:trimmed_line)
  let l:sanitized_line = substitute(l:lowered_line, '[^a-z0-9 ]', '', 'g')
  let l:dashed_line = substitute(l:sanitized_line, ' ', '-', 'g')
  let l:slugged_line = substitute(l:dashed_line, '--*', '-', 'g')
  return l:slugged_line
endfunction


""
" Returns heading ref/tag for linking within document
" @param {string} slugged_line -
" @return {string}
" @author S0AndS0
" @license AGPL-3.0
" @example
" echo s:Taggify_Slug('spam-flavored-ham')
" #> heading__spam_flavored_ham
function! s:Taggify_Slug(slugged_line)
  return 'heading__' . substitute(a:slugged_line, '-', '_', 'g')
endfunction


""
" Updates heading link references for entire document
" @author S0AndS0
" @license AGPL-3.0
" @throws Error codes that are **not** E486
" @example
" s:Update_Refs('heading__spam_flavored_ham]', 'heading__raspberry_jam]')
function! s:Update_Refs(old_reference, new_reference)
  try
    execute ':%s/\[' . a:old_reference . '/\[' . a:new_reference . '/g'
  catch
    if v:exception !~ '^Vim\%((\a\+)\)\=:E486'
      throw v:exception
    endif
  endtry
endfunction


""
" Adds or updates reference link for heading under cursor postilion
" @param {string[]|number[]} ... -
" @author S0AndS0
" @license AGPL-3.0
" @throws {string} 'Did not detect MarkDown heading!'
function! MarkDown_Headings_Make_Link(...)
  let l:current_line = getline('.')
  if match(l:current_line, '#') < 0
    throw 'Did not detect MarkDown heading!'
  endif

  let l:cursor_position = getpos('.')
  let l:slugged_line = s:Sluggify(l:current_line)
  let l:tag_line = s:Taggify_Slug(slugged_line)

  let l:next_line = getline(l:cursor_position[1] + 1)
  let l:regex_link_without_title = "\[[a-z0-9_]*\]: #[a-z0-9\-]*"
  let l:regex_link_with_title = l:regex_link_without_title . " \"[[:print:]]*\""

  let l:heading_tag = '[' . l:tag_line . ']'
  let l:heading_title = join(a:000)
  let l:heading_link_text = l:heading_tag . ': #' . l:slugged_line
  if len(l:heading_title) > 0
    let l:heading_link_text .= ' "' . l:heading_title . '"'
  elseif match(l:next_line, l:regex_link_with_title) >= 0
    let l:heading_title = split(l:next_line, '"')[-1]
    if len(l:heading_title) > 0
      let l:heading_link_text .= ' "' . l:heading_title . '"'
    endif
  endif

  if match(l:next_line, l:regex_link_without_title) < 0
    execute "normal! A\n" . l:heading_link_text
  else
    let l:old_heading_tag = l:next_line[0:match(l:next_line, ']')]
    execute "normal! j0c$" . l:heading_link_text

    let l:tag_find = l:old_heading_tag[1:len(l:old_heading_tag)]
    let l:tag_replace = l:heading_tag[1:len(l:heading_tag)]
    call s:Update_Refs(l:tag_find, l:tag_replace)
  endif

  call setpos('.', cursor_position)
  if len(l:heading_title) == 0
    execute "normal! jA" . ' ""'
    :startinsert
  endif
endfunction

