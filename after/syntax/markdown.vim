if !exists('g:mdvim_no_todo_hl') || !g:mdvim_no_todo_hl
    let g:mdvim_no_todo_hl=v:true
    syn case match

    syn match  dk949MarkdownTodoDelim /\v\[|\]/               contained display
    syn match  dk949MarkdownTodoKw    /TODO:/                 contained display
    syn region dk949MarkdownTodoOpts start=/;/ end=/\]/me=e-1 contained conceal

    syn region dk949MarkdownTodo start=/\v\[TODO:/ end=/\v\]/me=e+1 contains=dk949MarkdownTodoDelim,dk949MarkdownTodoKw,dk949MarkdownTodoOpts keepend


    hi def link dk949MarkdownTodoOpts  Comment
    hi def link dk949MarkdownTodoDelim Comment
    hi def link dk949MarkdownTodoKw    Todo
endif


" NOTE: this sets global Conceal highlighting, which works because the default
"       markdown.vim does not use it, but if it ever does, this will break it.
"       AFAICT there is no way to set cchar highlighting for a specific hl group
if !exists('g:mdvim_no_cite_hl') || !g:mdvim_no_cite_hl
    let g:mdvim_no_cite_hl=v:true
    syn case match
    syn match dk949MarkdownCiteDelim /\v\[|\]/ contained display
    syn match dk949MarkdownCiteCitation /\v\@%(\a|\d)+/ contained conceal cchar=~

    syn region dk949MarkdownCite start=/\v\[.*\@/ end=/\v\]/me=e+1 contains=dk949MarkdownCiteDelim,dk949MarkdownCiteCitation,dk949MarkdownCiteAt keepend

    hi def link dk949MarkdownCiteDelim Normal
    hi def link dk949MarkdownCiteCitation markdownUrl
    hi def link dk949MarkdownCiteAt Comment
    hi! link Conceal markdownUrl
endif
