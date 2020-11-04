"        .--'''''''''--.
"     .'      .---.      '.
"    /    .-----------.    \
"   /        .-----.        \
"   |       .-.   .-.       |
"   |      /   \ /   \      |
"    \    | .-. | .-. |    /
"     '-._| | | | | | |_.-'
"         | '-' | '-' |
"          \___/ \___/
"       _.-'  /   \  `-._
"     .' _.--|     |--._ '.
"     ' _...-|     |-..._ '
"            |     |
"            '.___.'

" ----------------------------------------------------------------------------
" Auto-Update Setting in init.vim
" ----------------------------------------------------------------------------
augroup vimrc                " Source vim configuration upon save
	autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
	autocmd! BufWritePost $VIMINIT if has('gui_running') | so % | echom "Reloaded " . $VIMINIT | endif | redraw
augroup END

source ~/AppData/Local/nvim/viml/plugin.vim
source ~/AppData/Local/nvim/viml/integration.vim
source ~/AppData/Local/nvim/viml/appearance.vim
source ~/AppData/Local/nvim/viml/line.vim
source ~/AppData/Local/nvim/viml/editing.vim
source ~/AppData/Local/nvim/viml/navigation.vim
source ~/AppData/Local/nvim/viml/lsp.vim
source ~/AppData/Local/nvim/viml/linter.vim
source ~/AppData/Local/nvim/viml/keymapping.vim

lua require 'init'