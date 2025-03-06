" Better indenting
vnoremap < <gv
vnoremap > >gv

" remap $ & ^
nmap gh ^
nmap gl $

" Yank to system clipboard
set clipboard=unnamed

" Remap for copy and paste from system clipboard
" CTRL-X is Cut
map <C-X> "+x

" CTRL-V is Paste
map <C-V>  "+gp