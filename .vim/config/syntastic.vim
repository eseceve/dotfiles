let g:syntastic_check_on_wq = 1

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_always_populate_loc_list = 1

let g:syntastic_c_check_header = 1
let g:syntastic_cpp_check_header = 1

if v:version == 700
  let g:syntastic_enable_highlighting = 0
endif
