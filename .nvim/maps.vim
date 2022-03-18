" He tomado la tecla lider como > space
let mapleader = " "

" desabilito el uso de las feclas del teclado
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" salir del modo INSERT con > Esc o jk
imap jk <Esc>

" desplazamiento vertical rápido con (hacia abajo -> ctrl+e) (hacia arriba -> ctrl+y)
nnoremap <C-k> 10 <C-e>
nnoremap <C-j> 10 <C-y>

" coloca un punto y coma al final de línea situada usando (space+,)
nnoremap <Leader>, $a;<Esc>

" ejecutar archivos .js & .ts con nodejs
nnoremap <Leader>dn :!node %<CR>
" ejecutar archivos .py
nnoremap <Leader>dp :!python %<CR>
" ejecutar archivos .java
nnoremap <Leader>dj :!javac %<CR>
nnoremap <Leader>djj :!java %<CR>

" con space+t abre la terminal PowerShell
nnoremap <C-t>t :call OpenTerminal()<CR>
nnoremap <Leader>t :terminal<CR>

" para guardar archivos
nnoremap <Leader>w :w<CR>
" para cerrar algun búfer o pestaña
nnoremap <Leader>q :q!<CR>
" para salir rápidamente de nvim
nnoremap <Leader>x :qa!<CR>
tnoremap <C-c> :q!<CR>

" abrir el árbol, side bar o NERDTree
map <Leader>e :NERDTreeToggle<CR>
map <Leader>p :Explore<CR>

" shorter commands
cnoreabbrev tree NERDTreeToggle
cnoreabbrev blame Gblame
cnoreabbrev find NERDTreeFind
cnoreabbrev diff Gdiff

" tmux navigator
nnoremap <silent> <Leader><C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <Leader><C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <Leader><C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <Leader><C-l> :TmuxNavigateRight<cr>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" encuentra archivos usando el azúcar de línea de comandos Telescope.
nnoremap <Leader>f <cmd>Telescope find_files<CR>
nnoremap <Leader>fl <cmd>Telescope live_grep<CR>
nnoremap <Leader>fb <cmd>Telescope buffers<CR>
nnoremap <Leader>fh <cmd>Telescope help_tags<CR>
nnoremap <Leader>fg <cmd>Telescope git_status<CR>
nnoremap <Leader>fc <cmd>Telescope command_history<CR>

" Remap surround to lowercase s so it does not add an empty space
xmap s <Plug>VSurround
" diagnostics
nnoremap <leader>P :let @*=expand("%")<CR>

" tabs navigation
map <TAB> :bnext<CR>
map <S-TAB> :bprevious<CR>
map <Leader>dl :bdelete<CR>

" keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" indentar líneas y bloques en cualquier modo VISUAL
vnoremap < <gv
vnoremap > >gv

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" subir la posición de la línea
nnoremap n :m .-2<CR>==
" bajar de posición de la línea
nnoremap m :m .+1<CR>==

" dividir pantalla en dos [vertical] con space+i
nnoremap <Leader>i :vsp<CR>
" dividir pantalla en dos [horizontal] con space+o
nnoremap <Leader>o :sp<CR>

" F3 - elimina todos los espacios vacíos que hayan en el archivo
nnoremap <F3> :g/^\s\+$/s/\s\+//<CR>
" Ctrl+n - crea un nuevo archivo en la ruta posicionada
nnoremap <C-n> :tabnew 
" Ctrl+r - actualiza la configuración de neovim (o lo reinicia)
nmap <C-r> :source ~/AppData/Local/nvim/init.vim<CR>
" Space+init - abre el archivo de configuración global
nnoremap <Leader>init :e $MYVIMRC<CR>

" faster scrolling
nnoremap <C-j> 10<C-e>
nnoremap <C-k> 10<C-y>
" buscar carácter
nmap <Leader>s <Plug>(easymotion-s2)

" git
nnoremap <Leader>G :G<cr>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gl :Gpull<CR>

" run current file
nnoremap <Leader>d :!node %<CR>
" abrir terminal al lado
nnoremap <C-t> :call OpenTerminal()<CR>
" abrir terminal - toda la pestaña
nnoremap <Leader>t :terminal<CR>

inoremap <expr> <CR> ParensIndent()

function! ParensIndent()
  let prev = col('.') - 1
  let after = col('.')
  let prevChar = matchstr(getline('.'), '\%' . prev . 'c.')
  let afterChar = matchstr(getline('.'), '\%' . after . 'c.')
  if (prevChar == '"' && afterChar == '"') ||
\    (prevChar == "'" && afterChar == "'") ||
\    (prevChar == "(" && afterChar == ")") ||
\    (prevChar == "{" && afterChar == "}") ||
\    (prevChar == "[" && afterChar == "]")
    return "\<CR>\<ESC>O"
  endif
  
  return "\<CR>"
endfunction

inoremap <expr> <space> ParensSpacing()

function! ParensSpacing()
  let prev = col('.') - 1
  let after = col('.')
  let prevChar = matchstr(getline('.'), '\%' . prev . 'c.')
  let afterChar = matchstr(getline('.'), '\%' . after . 'c.')
  if (prevChar == '"' && afterChar == '"') ||
\    (prevChar == "'" && afterChar == "'") ||
\    (prevChar == "(" && afterChar == ")") ||
\    (prevChar == "{" && afterChar == "}") ||
\    (prevChar == "[" && afterChar == "]")
    return "\<space>\<space>\<left>"
  endif
  
  return "\<space>"
endfunction

inoremap <expr> <BS> ParensRemoveSpacing()

function! ParensRemoveSpacing()
  let prev = col('.') - 1
  let after = col('.')
  let prevChar = matchstr(getline('.'), '\%' . prev . 'c.')
  let afterChar = matchstr(getline('.'), '\%' . after . 'c.')

  if (prevChar == '"' && afterChar == '"') ||
\    (prevChar == "'" && afterChar == "'") ||
\    (prevChar == "(" && afterChar == ")") ||
\    (prevChar == "{" && afterChar == "}") ||
\    (prevChar == "[" && afterChar == "]")
    return "\<bs>\<right>\<bs>"
  endif
  
  if (prevChar == ' ' && afterChar == ' ')
    let prev = col('.') - 2
    let after = col('.') + 1
    let prevChar = matchstr(getline('.'), '\%' . prev . 'c.')
    let afterChar = matchstr(getline('.'), '\%' . after . 'c.')
    if (prevChar == '"' && afterChar == '"') ||
  \    (prevChar == "'" && afterChar == "'") ||
  \    (prevChar == "(" && afterChar == ")") ||
  \    (prevChar == "{" && afterChar == "}") ||
  \    (prevChar == "[" && afterChar == "]")
      return "\<bs>\<right>\<bs>"
    endif
  endif
  
  return "\<bs>"
endfunction

inoremap { {}<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap ' ''<left>
inoremap " ""<left>

let curly = "}"
inoremap <expr> } CheckNextParens(curly)

let bracket = "]"
inoremap <expr> ] CheckNextParens(bracket)

let parens = ")"
inoremap <expr> ) CheckNextParens(parens)

let quote = "'"
inoremap <expr> ' CheckNextQuote(quote)

let dquote = '"'
inoremap <expr> " CheckNextQuote(dquote)

let bticks = '`'
inoremap <expr> ` CheckNextQuote(bticks)

function CheckNextQuote(c)
  let after = col('.')
  let afterChar = matchstr(getline('.'), '\%' . after . 'c.')
  
  if (afterChar == a:c)
    return "\<right>"
  endif
  if (afterChar == ' ' || afterChar == '' || afterChar == ')' || afterChar== '}' || afterChar == ']')
    return a:c . a:c . "\<left>"
  endif
  if (afterChar != a:c)
    let bticks = '`'
    let dquote = '"'
    let quote = "'"
    if(afterChar == dquote || afterChar == quote || afterChar == bticks)
      return a:c . a:c . "\<left>"
    endif
  endif
  return a:c
endfunction

function CheckNextParens(c)
  let after = col('.')
  let afterChar = matchstr(getline('.'), '\%' . after . 'c.')
  if (afterChar == a:c)

    return "\<right>"
  endif
  return a:c
endfunction
