function! M(name)
    let path = expand("%:p")
    let dirs= split( path, '/' )
    let dummy = remove(dirs, -1)
    execute ":call add(dirs, a:name)"
    let workdir = execute('pwd') 
    let workdir = split(workdir, '/')
    let slice = len(workdir) - 1 
    let dummy = remove(dirs, 0, 3)
    let newPath = join(dirs, '/')
    echo "file moved to " . newPath
    execute ":Move " . newPath 
endfunction

