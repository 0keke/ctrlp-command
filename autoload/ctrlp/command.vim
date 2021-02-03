if exists('g:loaded_ctrlp_command') && g:loaded_ctrlp_command
  finish
endif

let s:command_var = {
  \ 'init': 'ctrlp#command#init()',
  \ 'exit': 'ctrlp#command#exit()',
  \ 'accept': 'ctrlp#command#accept',
  \ 'lname': 'command',
  \ 'sname': 'command',
  \ 'type': 'path',
  \ 'sort': 0,
  \}

function! ctrlp#command#init() abort
  return getcompletion('', 'command')
endfunction

function! ctrlp#command#command() abort
  call ctrlp#init(ctrlp#command#id())
endfunction

function! ctrlp#command#accept(mode, str) abort
  call ctrlp#exit()
  exe a:str
endfunction

function! ctrlp#command#exit() abort
endfunction

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:command_var)
else
  let g:ctrlp_ext_vars = [s:command_var]
endif
let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

function! ctrlp#command#id() abort
  return s:id
endfunction
