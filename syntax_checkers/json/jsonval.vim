"============================================================================
"File:        jsonval.vim
"Description: JSON syntax checker - using jsonval
"Maintainer:  Miller Medeiros <contact at millermedeiros dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"============================================================================

function! SyntaxCheckers_json_GetLocList()
    " based on https://gist.github.com/1196345
    let makeprg = syntastic#makeprg#build({ 'exe': 'jsonval', 'subchecker': 'jsonval' })
    let errorformat = '%E%f:\ %m\ at\ line\ %l,%-G%.%#'
    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat, 'defaults': {'bufnr': bufnr('')} })
endfunction
