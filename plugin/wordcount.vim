let g:word_count=wordcount().words
function WordCount()
    if has_key(wordcount(),'visual_words')
        let g:word_count= "Selected " . wordcount().visual_words . " of " . wordcount().words " count selected words
    else
        let g:word_count= "Word " . wordcount().cursor_words . " of " . wordcount().words " or shows words 'so far'
    endif
    return g:word_count
endfunction

function ResetStatus(cfg, fg, bg)
    set statusline=%=%{WordCount()}
    exe 'hi statusline ctermfg=' . a:cfg . ' guifg=' . a:fg . ' guibg='. a:bg
    set laststatus=2
    set ruler
    set showcmd
endfunction
