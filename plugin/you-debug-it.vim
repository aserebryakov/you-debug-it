"   Copyright 2016 Alexander Serebryakov
"
"   Licensed under the Apache License, Version 2.0 (the "License");
"   you may not use this file except in compliance with the License.
"   You may obtain a copy of the License at
"
"       http://www.apache.org/licenses/LICENSE-2.0
"
"   Unless required by applicable law or agreed to in writing, software
"   distributed under the License is distributed on an "AS IS" BASIS,
"   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
"   See the License for the specific language governing permissions and
"   limitations under the License.

"Plugin helping to control your debug code


"Enter a debug mode in a current buffer
function! YouDebugItStart()
  let b:youdebugit_active = 1

  if !exists('b:youdebugit_tag')
    call YouDebugItGenerateTag()
  endif

  if b:youdebugit_active == 0
    return
  endif

  inoremap <CR> <ESC>:call YouDebugItInsertCommentTag()<CR>$a<CR>
endfunction!


"Leave a debug mode in a current buffer
function! YouDebugItStop()
  let b:youdebugit_active = 0
  iunmap <CR>
endfunction!


"Leave a debug mode in a current buffer
function! YouDebugItClean()
  let l:escaped_tag = substitute(b:youdebugit_tag, '[\.\*\\]', '\\\0', 'g')
  silent execute("g:" . l:escaped_tag . ":d")
endfunction!


"Inserts comment tag into the line
function! YouDebugItInsertCommentTag()
  let l:line = getline(".")
  call setline(".", l:line . b:youdebugit_tag)
endfunction!


"Generates tag
function! YouDebugItGenerateTag()
  if &commentstring == ''
    let b:youdebugit_active = 0
  endif

  let b:youdebugit_tag = substitute(&commentstring,
                                    \ '%s',
                                    \ 'YOU DEBUG IT',
                                    \ '')
endfunction!


"Plugin startup code
if !exists('g:youdebugit_plugin')
  let g:youdebugit_plugin = 1

  "Defining plugin commands
  command! YouDebugItStart call YouDebugItStart()
  command! YouDebugItStop call YouDebugItStop()
  command! YouDebugItClean call YouDebugItClean()
endif
