if !exists('g:mdvim_no_todo_hl') || !g:mdvim_no_todo_hl
    syn case match

    syn match  markdownTodoDelim /\v\[|\]/               contained display
    syn match  markdownTodoKw    /TODO:/                 contained display
    syn region markdownTodoOpts start=/;/ end=/\]/me=e-1 contained conceal

    syn region markdownTodo start=/\v\[TODO:/ end=/\v\]/me=e+1 contains=markdownTodoDelim,markdownTodoKw,markdownTodoOpts keepend


    hi def link markdownTodoOpts  Comment
    hi def link markdownTodoDelim Comment
    hi def link markdownTodoKw    Todo
endif


" NOTE: this sets global Conceal highlighting, which works because the default
"       markdown.vim does not use it, but if it ever does, this will break it.
"       AFAICT there is no way to set cchar highlighting for a specific hl group
if !exists('g:mdvim_no_cite_hl') || !g:mdvim_no_cite_hl
    syn case match
    syn match markdownCiteDelim /\v\[|\]/ contained display
    syn match markdownCiteCitation /\v\@%(\a|\d)+/ contained conceal cchar=~

    syn region markdownCite start=/\v\[.*\@/ end=/\v\]/me=e+1 contains=markdownCiteDelim,markdownCiteCitation,markdownCiteAt keepend

    hi def link markdownCiteDelim Normal
    hi def link markdownCiteCitation markdownUrl
    hi def link markdownCiteAt Comment
    hi! link Conceal markdownUrl
endif
