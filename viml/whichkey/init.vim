" Change Mapleader
let mapleader = "\<space>"

" Timeout
let g:which_key_timeout = 100

let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆', " ": 'SPC'}

" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

let g:which_key_use_floating_win = 0
let g:which_key_fallback_to_native_key = 1

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
\| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler


" Define prefix dictionary
let g:leader_map =  {}
let g:leader_map['name'] = 'root'

for s:i in range(1, 9)
  let g:leader_map[s:i] = 'window-'.s:i
endfor
unlet s:i

let g:leader_map['b'] = {
      \ 'name': '+buffer',
      \ 'd':    ['bdelete',             'delete-buffer'],
      \ 'n':    ['BufferLineCyclePrev', 'next-buffer'],
      \ 'p':    ['BufferLineCyclePrev', 'previous-buffer'],
      \ 't':    ['BufferLinePick',      'select-tab']
      \ }

let g:leader_map['c'] = {
      \ 'name' : '+kommentary',
      \ 'c' : ['<Plug>kommentary_line_default', 'comment'],
      \ 'd' :{
        \ 'name' : '+decrease',
        \ 'l' : ['<Plug>kommentary_line_decrease', 'line-decrease'],
        \ 'm' : ['<Plug>kommentary_motion_decrease', 'motion-decrease']
        \ },
      \ 'i' :{
        \ 'name' : '+increase',
        \ 'l' : ['<Plug>kommentary_line_increase', 'line-increase'],
        \ 'm' : ['<Plug>kommentary_motion_increase', 'motion-increase']
      \ }
      \ }

let g:leader_map['d'] = {
      \ 'name' : '+debug' ,
      \ 'b' : ['DebugToggleBreakpoint '        , 'toggle breakpoint'],
      \ 'c' : ['DebugContinue'                 , 'continue'],
      \ 'i' : ['DebugStepInto'                 , 'step into'],
      \ 'o' : ['DebugStepOver'                 , 'step over'],
      \ 'r' : ['DebugToggleRepl'               , 'toggle repl'],
      \ 's' : ['DebugStart'                    , 'start'],
      \ }

let g:leader_map['e'] = {
      \ 'name': '+edit',
      \ ''  : ['edit!','edit file']
      \ }

let g:leader_map['F'] = {
      \ 'name': '+fold',
      \ 'O' : [':set foldlevel=20'  , 'open all'],
      \ 'C' : [':set foldlevel=0'   , 'close all'],
      \ 'c' : [':foldclose'         , 'close'],
      \ 'o' : [':foldopen'          , 'open'],
      \ '1' : [':set foldlevel=1'   , 'level1'],
      \ '2' : [':set foldlevel=2'   , 'level2'],
      \ '3' : [':set foldlevel=3'   , 'level3'],
      \ '4' : [':set foldlevel=4'   , 'level4'],
      \ '5' : [':set foldlevel=5'   , 'level5'],
      \ '6' : [':set foldlevel=6'   , 'level6']
      \ }

let g:leader_map['g'] = {
      \ 'name' : '+git/version-control' ,
      \ 'b' : ['Gblame'                 , 'fugitive-blame']             ,
      \ 'B' : ['Gitsigns blame_line'    , 'gitsigns-blame-line']        ,
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

let g:leader_map['h']={
      \ 'name': '+hop/jump',
      \ 'c':    ['HopChar1',   'char mode 1'],
      \ 'd':    ['HopChar2',   'char mode 2'],
      \ 'l':    ['HopLine',    'line mode'],
      \ 'p':    ['HopPattern', 'pattern mode'],
      \ 'w':    ['HopWord',    'word mode']
      \ }

let g:leader_map['l'] = {
      \ 'name': '+lsp'                               ,
      \ 'a':    [':Lspsaga code_action'                , 'code action'],
      \ 'A':    [':Lspsaga range_code_action'          , 'selected action'],
      \ 'd':    [':Telescope lsp_document_diagnostics' , 'document diagnostics'],
      \ 'D':    [':Telescope lsp_workspace_diagnostics', 'workspace diagnostics'],
      \ 'f':    [':LspFormatting'                      , 'format'],
      \ 'I':    [':LspInfo'                            , 'lsp info'],
      \ 'v':    [':LspVirtualTextToggle'               , 'lsp toggle virtual text'],
      \ 'l':    [':Lspsaga lsp_finder'                 , 'lsp finder'],
      \ 'L':    [':Lspsaga show_line_diagnostics'      , 'line_diagnostics'],
      \ 'p':    [':Lspsaga preview_definition'         , 'preview definition'],
      \ 'q':    [':Telescope quickfix'                 , 'quickfix'],
      \ 'r':    [':Lspsaga rename'                     , 'rename'],
      \ 'T':    [':LspTypeDefinition'                  , 'type defintion'],
      \ 'x':    [':cclose'                             , 'close quickfix'],
      \ 's':    [':Telescope lsp_document_symbols'     , 'document symbols'],
      \ 'S':    [':Telescope lsp_workspace_symbols'    , 'workspace symbols'],
      \ }

let g:leader_map['m'] = {
      \ 'name': '+mark',
      \ 't' : [':BookmarkToggle'   , 'toggle'],
      \ 'j' : [':BookmarkNext'   , 'next mark'],
      \ 'k' : [':BookmarkPrev'   , 'prev mark']
      \ }

let g:leader_map['q'] = [ 'q', 'quit' ]

let g:leader_map['Q'] = [ 'qa!', 'quit-without-saving' ]

let g:leader_map['s'] = {
      \ 'name' : '+search/show'                        ,
      \ '.' : [':Telescope filetypes'                   , 'filetypes'],
      \ 'B' : [':Telescope git_branches'                , 'git branches'],
      \ 'c' : [':Telescope colorscheme'                 , 'colorschemes'],
      \ 'd' : [':Telescope lsp_document_diagnostics'    , 'document_diagnostics'],
      \ 'D' : [':Telescope lsp_workspace_diagnostics'   , 'workspace_diagnostics'],
      \ 'f' : [':Telescope find_files'                  , 'files'],
      \ 'h' : [':Telescope command_history'             , 'history'],
      \ 'i' : [':Telescope media_files'                 , 'media files'],
      \ 'm' : [':Telescope marks'                       , 'marks'],
      \ 'M' : [':Telescope man_pages'                   , 'man_pages'],
      \ 'o' : [':Telescope vim_options'                 , 'vim_options'],
      \ 't' : [':Telescope live_grep'                   , 'text'],
      \ 'z' : [':Telescope registers'                   , 'registers'],
      \ 'w' : [':Telescope file_browser'                , 'buf_fuz_find'],
      \ }

let g:leader_map['t'] = {
      \ 'name': '+terminal',
      \ ';':    [':FloatermNew --wintype=normal --height=6', 'terminal'],
      \ 'g':    [':FloatermNew lazygit',                     'git'],
      \ 'l':    [':FloatermNew lf',              'lf'],
      \ 'n':    [':FloatermNew node',                        'node'],
      \ 'p':    [':FloatermNew python',                      'python'],
      \ 'm':    [':FloatermNew lazynpm',                     'npm'],
      \ 't':    [':FloatermToggle',                          'toggle'],
      \ }

let g:leader_map['w'] = {
      \ 'name': '+window',
      \ 'w' :[':wincmd k<CR>','window-up'],
      \ 's' :[':wincmd j<CR>','window-bottom'],
      \ 'a' :[':wincmd h<CR>','window-left'],
      \ 'd' :[':wincmd l<CR>','window-right'],
      \ }

let g:leader_map['x'] = {
      \ 'name' : '+text'           ,
      \ 'd' : ['StripWhitespace'   , 'delete-trailing-whitespace'] ,
      \ }

call which_key#register('<Space>', "g:leader_map")
