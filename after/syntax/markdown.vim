if exists('g:mdvim_no_todo_hl') && g:mdvim_no_todo_hl
  finish
endif

syn case match

syn region markdownTodo start=/\[TODO:/ end=/\]/ contains=markdownTodoDelim,markdownTodoKw,markdownTodoOpts

syn match  markdownTodoDelim /\v\[|\]/               contained display
syn match  markdownTodoKw    /TODO:/                 contained display
syn region markdownTodoOpts start=/;/ end=/\]/re=e-1 contained



hi def link markdownTodoOpts  Comment
hi def link markdownTodoDelim Comment
hi def link markdownTodoKw    Todo

