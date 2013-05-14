"TODO
"map ctrl-h/l to next/rev buffers
"figure out how to close a buffer with bd (if pos)
"
"	Ack:
"		:cope/:ccl	open/close quickfix
"		Ack term	case sensitive search for term
"	Buffers:
"		:Ctrl-h		previous buffer
"		:Ctrl-l		next buffer
"		:bN		change to buffer number N
"		:bn/:bp		next prev
"		:ls		list buffers
"		:bd[N]		close the current buffer, or buf N, doesn't
"		seem to work with minibuf
"	Navigating:
"		Ctrl-j/k	scroll one line up/down
"		zz		center screen on cursor
"		Ctrl-o		back edit location
"		Ctrl-i		forward edit location
"		<Leader>	mapped to \ by default
"	Comment Block:
"		1. Ctrl-v
"		2. Shift-I
"		3. # Esc
"	Regenerate Help files:
"		:helptags ~/.vim/doc	
"	FuzzyFinder:
"		Ctrl-f open FufFile
"		:FufFile
"		**/filename	recursively searches the directory for a file.
"

"initial window size
set lines=55 columns=130

colorscheme evening

"enable syntax highlighting
syntax on

"line numbering
set number

"smart indenting
filetype indent plugin on

"python files
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

"buffers we aren't editing aren't on the screen
set hidden

"the number of lines to scroll with ctrl-U/ctrl-D
set scroll=5

"sets the number of lines that must be on-screen
set scrolloff=6

"key mappings
map <C-j> <C-e>
map <C-k> <C-y>
map <C-f> :FufFile<CR>
map <C-h> :bprevious
map <C-l> :bnext
