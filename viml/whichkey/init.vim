" Change Mapleader
let mapleader = "\<space>"
let maplocalleader="`"

" Timeout
let g:which_key_timeout = 100

let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆', " ": 'SPC'}

" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

let g:which_key_map =  {}
let g:which_key_sep = '→'

let g:which_key_disable_default_offset = 1
let g:which_key_max_size = 0

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
\| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler


" Define prefix dictionary
let g:leader_map =  {}

let g:leader_map['g'] = {
  \ 'name' : '+git/version-control' ,
  \ 'b' : ['Gblame'                 , 'fugitive-blame']             ,
  \ 'c' : ['BCommits'               , 'commits-for-current-buffer'] ,
  \ 'C' : ['Gcommit'                , 'fugitive-commit']            ,
  \ 'd' : ['Gdiff'                  , 'fugitive-diff']              ,
  \ 'e' : ['Gedit'                  , 'fugitive-edit']              ,
  \ 'l' : ['Glog'                   , 'fugitive-log']               ,
  \ 'r' : ['Gread'                  , 'fugitive-read']              ,
  \ 's' : ['Gstatus'                , 'fugitive-status']            ,
  \ 'w' : ['Gwrite'                 , 'fugitive-write']             ,
  \ 'p' : ['Git push'               , 'fugitive-push']              ,
  \ }

let g:leader_map['l'] = {
  \ 'name' : '+lsp'                               ,
  \ 'a' : [':Lspsaga code_action'                , 'code action'],
  \ 'A' : [':Lspsaga range_code_action'          , 'selected action'],
  \ 'd' : [':Telescope lsp_document_diagnostics' , 'document diagnostics'],
  \ 'D' : [':Telescope lsp_workspace_diagnostics', 'workspace diagnostics'],
  \ 'f': [':LspFormatting'                      , 'format'],
  \ 'I': [':LspInfo'                            , 'lsp info'],
  \ 'v' : [':LspVirtualTextToggle'               , 'lsp toggle virtual text'],
  \ 'l' : [':Lspsaga lsp_finder'                 , 'lsp finder'],
  \ 'L' : [':Lspsaga show_line_diagnostics'      , 'line_diagnostics'],
  \ 'p' : [':Lspsaga preview_definition'         , 'preview definition'],
  \ 'q' : [':Telescope quickfix'                 , 'quickfix'],
  \ 'r' : [':Lspsaga rename'                     , 'rename'],
  \ 'T' : [':LspTypeDefinition'                  , 'type defintion'],
  \ 'x' : [':cclose'                             , 'close quickfix'],
  \ 's' : [':Telescope lsp_document_symbols'     , 'document symbols'],
  \ 'S' : [':Telescope lsp_workspace_symbols'    , 'workspace symbols'],
  \ }
  " \ 'H' : [':Lspsaga signature_help'             , 'signature_help'],
  " \ 'o' : [':Vista!!'                            , 'outline'],
  " \ }


let g:leader_map['q'] = [ 'q', 'quit' ]

let g:leader_map['Q'] = [ 'qa!', 'quit-without-saving' ]

let g:leader_map['s'] = {
  \ 'name' : '+search/show'                        ,
  \ '.' : [':Telescope filetypes'                   , 'filetypes'],
  \ 'B' : [':Telescope git_branches'                , 'git branches'],
  \ 'd' : [':Telescope lsp_document_diagnostics'    , 'document_diagnostics'],
  \ 'D' : [':Telescope lsp_workspace_diagnostics'   , 'workspace_diagnostics'],
  \ 'f' : [':Telescope find_files'                  , 'files'],
  \ 'h' : [':Telescope command_history'             , 'history'],
  \ 'i' : [':Telescope media_files'                 , 'media files'],
  \ 'm' : [':Telescope marks'                       , 'marks'],
  \ 'M' : [':Telescope man_pages'                   , 'man_pages'],
  \ 'o' : [':Telescope vim_options'                 , 'vim_options'],
  \ 't' : [':Telescope live_grep'                   , 'text'],
  \ 'r' : [':Telescope registers'                   , 'registers'],
  \ 'w' : [':Telescope file_browser'                , 'buf_fuz_find'],
  \ 'u' : [':Telescope colorscheme'                 , 'colorschemes'],
  \ }

let g:leader_map['t'] = {
  \ 'name' : '+terminal' ,
  \ ';' : [':FloatermNew --wintype=normal --height=6'       , 'terminal'],
  \ 'g' : [':FloatermNew lazygit'                           , 'git'],
  \ 'n' : [':FloatermNew node'                              , 'node'],
  \ 'p' : [':FloatermNew python'                            , 'python'],
  \ 'm' : [':FloatermNew lazynpm'                           , 'npm'],
  \ 't' : [':FloatermToggle'                                , 'toggle'],
  \ }

let g:leader_map['x'] = {
  \ 'name' : '+text'           ,
  \ 'd' : ['StripWhitespace'   , 'delete-trailing-whitespace'] ,
  \ }

call which_key#register('<Space>', "g:leader_map")
