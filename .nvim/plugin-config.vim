" HTML, JSX
let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx'

" Lightlane
let g:lightline = {
      \ 'active': {
      \   'left': [['mode', 'paste'], [], ['relativepath', 'modified']],
      \   'right': [['kitestatus'], ['filetype', 'percent', 'lineinfo'], ['gitbranch']]
      \ },
      \ 'inactive': {
      \   'left': [['inactive'], ['relativepath']],
      \   'right': [['bufnum']]
      \ },
      \ 'component': {
      \   'bufnum': '%n',
      \   'inactive': 'inactive'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'kitestatus': 'kite#statusline'
      \ },
      \ 'colorscheme': 'gruvbox',
      \ 'subseparator': {
      \   'left': '',
      \   'right': ''
      \ }
      \}

"  nerdtree
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1
let NERDTreeMapOpenInTab='\t'

" kite
let g:kite_supported_languages = ['java', 'python', 'javascript']
let g:coc_global_extensions = [
  	\ 'coc-json',
	  \ 'coc-vimlsp'
    \ ]

" tmux navigator
let g:tmux_navigator_no_mappings = 1

" coc
autocmd FileType java let b:coc_suggest_disable = 1
autocmd FileType python let b:coc_suggest_disable = 1
autocmd FileType javascript let b:coc_suggest_disable = 1
autocmd FileType scss setl iskeyword+=@-@
au BufNewFile,BufRead *.html set filetype=htmldjango

" Usar <Ctrl+space> para gatillar el autocompletado de kite
"if &filetype == "javascript" || &filetype == "java"
""  inoremap <C-space> <C-x><C-u>
"else
""  inoremap <silent><expr> <C-space> coc#refresh()
"endif

" vim fugitive
command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"*---------------------- OpenTerminal() ----------------------*
function! OpenTerminal()
  " move to right most buffer
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"

  let bufNum = bufnr("%")
  let bufType = getbufvar(bufNum, "&buftype", "not found")

  if bufType == "terminal"
    " close existing terminal
    execute "q"
  else
    " open terminal
    execute "vsp term://PowerShell"

    " turn off numbers
    execute "set nonu"
    execute "set nornu"

    " toggle insert on enter/exit
    silent au BufLeave <buffer> stopinsert!
    silent au BufWinEnter,WinEnter <buffer> startinsert!

    " set maps inside terminal buffer
    execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
    execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"
    execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

    startinsert!
  endif
endfunction

"*------------------------ COC -----------------------*
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=1

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" fugitive always vertical diffing
set diffopt+=vertical

"*-------------------------------------------------------------------*

" Highlight symbol under cursor on CursorHold

let $FZF_DEFAULT_OPTS='--layout=reverse'
"let g:fzf_layout = { 'window': 'call FloatingFZF()' }
"function! FloatingFZF()
  "let buf = nvim_create_buf(v:false, v:true)
  "call setbufvar(buf, '&signcolumn', 'no')
  "let height = float2nr((&lines - 3) / 2)
  "let width = float2nr(&columns - (&columns * 2 / 10))
  "let col = float2nr((&columns - width) / 2)
  "let row = float2nr((&lines - height) / 2)
  "let opts = {
        "\ 'relative': 'editor',
        "\ 'row': row,
        "\ 'col': col,
        "\ 'width': width,
        "\ 'height': height
        "\ }
  "call nvim_open_win(buf, v:true, opts)
"endfunction

"function! SearchPatternInFile(pattern)
    "" Save cursor position.
    "let save_cursor = getcurpos()

    "" Set cursor position to beginning of file.
    "call cursor(0, 0)

    "" Search for the string 'hello' with a flag c.  The c flag means that a
    "" match at the cursor position will be accepted.
    "let search_result = search(a:pattern, "c")

    "" Set the cursor back at the saved position.  The setpos function was
    "" used here because the return value of getcurpos can be used directly
    "" with it, unlike the cursor function.
    "call setpos('.', save_cursor)

    "" If the search function didn't find the pattern, it will have
    "" returned 0, thus it wasn't found.  Any other number means that an instance
    "" has been found.
    "return search_result
"endfunction
