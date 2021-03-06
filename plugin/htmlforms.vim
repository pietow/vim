if !has("python3")
    echo "vim has to be compiled with +python to run this"
    finish
endif

python3 << en

import vim, dominate
from dominate import tags as tags

def getWordUnderCursor():
    return vim.eval("expand('<cWORD>')").split(',')

def inputforms():
    words = vim.eval("expand('<cWORD>')")
    words = words.split(',')
    form = tags.form()
    b = vim.current.buffer
    cw = vim.current.window
    pos = cw.cursor[0]
    for word in words:
        label = tags.label(fr=word)
        input_ = tags.input_(type='text', name=word, id=word)
        b.append(label.render(), pos)
        pos += 1
        b.append(input_.render(), pos)
        pos += 1

def cssRangeSelector():
    inp = vim.eval("expand('<cWORD>')")
    inp = inp.split('*')
    num = int(inp[-1])
    b = vim.current.buffer
    cw = vim.current.window
    pos = cw.cursor[0]
    for i in range(1, num+1):
        string = inp[0].replace('$',str(i)) + " {"
        b.append(string, pos)
        pos += 1
        b.append("}", pos)
        pos += 1
        b.append(" ", pos)
        pos += 1





    #vim.command('1d')
en

nnoremap <silent> ,t :python3 inputforms()<CR>
inoremap <silent> ,t :python3 inputforms()<CR>

nnoremap <silent> ,f :python3 cssRangeSelector()<CR>


