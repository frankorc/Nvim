 " Leader Key Maps 

" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100

" Coc Search & Replace
nnoremap <leader>? :CocSearch -C 1 <C-R>=expand("<cword>")<CR><CR>
let g:which_key_map['?'] = 'Search and Replace'

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map[','] = [ ':Commands'                          , 'Commands' ]
let g:which_key_map['e'] = [ ':NERDTreeFind'                     , 'NERDTreeFind' ]
let g:which_key_map['i'] = [ ':BLines'                            , 'Search Word In' ]
let g:which_key_map['p'] = [ ':FloatermNew --wintype=normal --height=6'       , 'Terminal' ]
let g:which_key_map['f'] = [ ':FloatermNew lf'                                , 'Lf' ]
let g:which_key_map['h'] = [ '<C-W>s'                             , 'Split Horizontal']
let g:which_key_map['u'] = [ ':Files'                             , 'Search Files']
let g:which_key_map['o'] = [ 'Rg'                                  , 'Search Word Out' ]
let g:which_key_map['v'] = [ '<C-W>v'                             , 'Split Vertical']


" s is for startify
let g:which_key_map.s = {
      \ 'name' : '+Startify' ,
      \ 'c' : [':SClose'          , 'Close Session']  ,
      \ 'd' : [':SDelete'         , 'Delete Session'] ,
      \ 'r' : [':SLoad'           , 'Load Session']     ,
      \ 's' : [':SSave'           , 'Save Session']   ,
      \ 'a' : [':Startify'        , 'Start Page']     ,
      \ }

" q is for quit 
let g:which_key_map.q = {
      \ 'name' : '+Exit' ,
      \ 'q' : ['q'        , 'Quit'],
      \ 'w' : [':wq'    , 'Quit w/ changes'],
      \ 'e' : [':q!'                 , 'Quit w/o changes'],
      \ 's' : ['w'                 , 'Save changes w/o quit'],
      \ }

" c is for comment 
let g:which_key_map.c = {
      \ 'name' : '+Comment' ,
      \ 'c' : ['gcc'        , 'Comment Line'],
      \ 's' : ['gcap'    , 'Comment Paragraph'],
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+Git' ,
      \ 'A' : [':Git add .'                        , 'add all'],
      \ 'a' : [':Git add %'                        , 'add current'],
      \ 'c' : [':Git commit'                       , 'commit'],
      \ 'd' : [':Git diff'                         , 'diff'],
      \ 's' : [':Gstatus'                          , 'status'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'o' : [':Git show'                          , 'show'],
      \ }


call which_key#register('<Space>', "g:which_key_map")
