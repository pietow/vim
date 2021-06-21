" Lookup the country for an IP address under the current cursor

" Make sure Python is ready
if !has("python")
    echo "vim has to be compiled with +python to run this"
    finish
endif

python << endpython

import vim, urllib

def getCountryFromIP( ip ):
  # use the minimal https://www.hostip.info/use.html API
  return urllib.urlopen('https://api.hostip.info/country.php?ip='+ip).read()

def getWordUnderCursor():
  return vim.eval("expand('<cWORD>')")

endpython
