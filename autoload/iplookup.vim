" Lookup the country for an IP address under the current cursor

" Make sure Python is ready
if !has("python3")
    echo "vim has to be compiled with +python3 to run this"
    finish
endif

python << en

import vim, urllib

def getCountryFromIP( ip ):
    # use the minimal http://www.hostip.info/use.html API
    return urllib.urlopen('http://api.hostip.info/get_html.php?ip='+ip).read()

def getWordUnderCursor():
    return vim.eval("expand('<cWORD>')")

def lookupIPUnderCursor():
    ip = getWordUnderCursor()
    print "Looking up " + ip + "..."
    country = getCountryFromIP( ip )
    vim.command( "redraw" ) # discard previous messages
    print country
en


nmap <silent> ,IP :python lookupIPUnderCursor()<CR>
