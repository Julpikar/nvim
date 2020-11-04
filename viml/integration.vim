" Python Executable
let g:python_host_skip_check = 1
let g:python2_host_skip_check = 1
let g:python3_host_skip_check = 1

if executable('python2')
    let g:python_host_prog=system('where python2')
endif

if executable('python3')
    let g:python3_host_prog='C:\Users\benawas\Miniconda3\python.exe'
endif