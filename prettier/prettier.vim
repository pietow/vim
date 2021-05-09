function! Pretty()
    let blade = expand("%:p")
    let file = split( blade, '\.' )
    let bla =  file[0]
    let file_html = join(bla, '.') . '.html'
    echo file_html
    echo blade
    execute ":Move " . file_html
    execute ":Prettier"
    execute ":Move " . blade
endfunction

