" Author: w0rp <devw0rp@gmail.com>
" Description: Fixing files with autopep8.

call ale#Set('python_autopep8_executable', 'autopep8')
call ale#Set('python_autopep8_use_global', 0)
call ale#Set('python_autopep8_options', '')

function! ale#fixers#autopep8#Fix(buffer) abort
    let l:executable = ale#python#FindExecutable(
    \   a:buffer,
    \   'python_autopep8',
    \   ['/bin/autopep8'],
    \)

    if empty(l:executable)
        return 0
    endif

    let l:options = ale#Var(a:buffer, 'python_autopep8_options')

    return {
    \   'command': ale#Escape(l:executable)
    \       . (!empty(l:options) ? ' ' . l:options : '')
    \       . ' -',
    \}
endfunction
