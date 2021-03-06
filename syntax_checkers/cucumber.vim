"============================================================================
"File:        cucumber.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Martin Grenfell <martin.grenfell at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

"bail if the user doesnt have cucumber installed
if !executable("cucumber")
    finish
endif

function! SyntaxCheckers_cucumber_GetLocList()
    let makeprg = syntastic#makeprg#build({
                \ 'exe': 'cucumber',
                \ 'args': '--dry-run --quiet --strict --format pretty' })
    let errorformat =  '%f:%l:%c:%m,%W      %.%# (%m),%-Z%f:%l:%.%#,%-G%.%#'

    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endfunction
