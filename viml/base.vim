" tjdevries inspiration
set wildignore+=*.o,*~,*.pyc,*pycache* " Ignore compiled files
set wildignore+=__pycache__

if has('nvim-0.4')
    " Use cool floating wildmenu options
    set pumblend=17

    set wildmode-=list
    set wildmode+=longest
    set wildmode+=full

    " Makes floating PopUpMenu for completing stuff on the command line.
    "     Very similar to completing in insert mode.
    set wildoptions+=pum
else
    set wildmode=longest,list,full
end

set formatoptions-=a    " Auto formatting is BAD.
set formatoptions-=t    " Don't auto format my code. I got linters for that.
set formatoptions+=c    " In general, I like it when comments respect textwidth
set formatoptions+=q    " Allow formatting comments w/ gq
set formatoptions-=o    " O and o, don't continue comments
set formatoptions+=r    " But do continue when pressing enter.
set formatoptions+=n    " Indent past the formatlistpat, not underneath it.
set formatoptions+=j    " Auto-remove comments if possible.
set formatoptions-=2    " I'm not in gradeschool anymore
set nojoinspaces        " Two spaces and grade school, we're done

set incsearch                         " Makes search act like search in modern browsers
