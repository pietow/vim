function! B(name)
  return substitute(a:name,'\(\w\+\)\(\-\)\(\w\+\)','\u\1\u\3','')
endfunction
" set suffixesadd+=.vue
" setlocal includeexpr=substitute(v:fname,'\\.','/','g')
" setlocal path+=resources/js;
" setlocal includeexpr=substitute(v:fname,'\(\w\+\)\(\-\)\(\w\+\)','\u\1\u\3','g')
" kebab-case

