if exists('g:mdvim_no_todo_hl') && g:mdvim_no_todo_hl
  finish
endif

syn case match

syn match  markdownTodoDelim /\v\[|\]/         contained display
syn match  markdownTodoKw    /TODO:/           contained display
syn region markdownTodoOpts start=/;/ end=/\]/ contained

syn region markdownTodo start=/\v\[TODO:/ end=/\v\]/me=e+1 contains=markdownTodoDelim,markdownTodoKw,markdownTodoOpts oneline keepend


hi def link markdownTodoOpts  Comment
hi def link markdownTodoDelim Comment
hi def link markdownTodoKw    Todo

