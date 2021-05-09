function! Elint()
    let prettier/vim-prettierext = expand('%:e')
    let path= @%
    if ext == 'vue' 
        let bytecode = system('eslint '.path)

        " Open a new split and set it up.
        vsplit __Eslint_Errors__
        normal! ggdG
        setlocal filetype=eslinterrors
        setlocal buftype=nofile

        " Insert the bytecode.
        call append(0, split(bytecode, '\v\n'))
    else
        echo 'no vue'
    endif
endfunction
