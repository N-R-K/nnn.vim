if exists('g:nnn#loaded')
    finish
endif
let g:nnn#loaded = 1

let g:nnn#has_floating_window_support = has('nvim-0.5') || has('popupwin')

if !exists('g:nnn#layout')
    if g:nnn#has_floating_window_support
        let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
    else
        let g:nnn#layout = 'enew'
    endif
endif

if !exists('g:nnn#action')
    let g:nnn#action = {}
endif


patch-18
if !exists('g:nnn#command')
    let g:nnn#command = 'nnn'


if !(exists("g:nnn#command"))
    let g:nnn#command = 'xplr'

master
endif

if !exists('g:nnn#statusline')
    let g:nnn#statusline = 1
endif

if !exists('g:nnn#session')
    let g:nnn#session = "none"
endif

if !exists('g:nnn#set_default_mappings')
    let g:nnn#set_default_mappings = 1
endif

command! -bar -nargs=? -complete=dir XplrPicker call nnn#pick(<f-args>)
command! -bar -nargs=? -complete=dir Xp call nnn#pick(<f-args>)

if g:nnn#set_default_mappings
    nnoremap <silent> <leader>n :NnnPicker<CR>
endif

if !exists('g:nnn#replace_netrw')
    let g:nnn#replace_netrw = 0
endif

" To open nnn when vim load a directory
if g:nnn#replace_netrw
    function! s:nnn_pick_on_load_dir(argv_path)
        let l:path = expand(a:argv_path)
        bdelete!
        call nnn#pick(l:path, {'layout': 'enew'})
    endfunction

    augroup ReplaceNetrwByNnnVim
        autocmd VimEnter * silent! autocmd! FileExplorer
        autocmd BufEnter * if isdirectory(expand("%")) | call <SID>nnn_pick_on_load_dir("%") | endif
    augroup END
endif

command! -bar -nargs=? -complete=dir NnnPicker call nnn#pick(<f-args>)
command! -bar -nargs=? -complete=dir Np echohl WarningMsg | echom 'Np is deprecated in favor of NnnPicker' | echohl None | call nnn#pick(<f-args>)

" vim: set sts=4 sw=4 ts=4 et :
