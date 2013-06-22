"TODO
"fix tabsize
"allow ctrl-j/k to work in insert mode
"
"	Ack:
"		:cope/:ccl	open/close quickfix
"		Ack term	case sensitive search for term
"		<leader>gg	Ack grep for a word.
"		<leader>gw	Ack grep for the word under the cursor.
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

"search highlighting on
set hlsearch

"smart indenting
filetype indent plugin on

"tabstop will default to 4
set tabstop=4

"python files
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
au FileType python setlocal colorcolumn=79

"c files
au FileType c,cpp setlocal expandtab
au FileType c,cpp setlocal colorcolumn=99

"don't display whitespace by default, listchars displays pretty much everything
set list
set listchars=tab:>-,trail:•,extends:#,nbsp:.,eol:%

"turn on spell checking - why not?
set spell

"buffers we aren't editing aren't on the screen
set hidden

"the number of lines to scroll with ctrl-U/ctrl-D
set scroll=5

"sets the number of lines that must be on-screen
set scrolloff=6

set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

"key mappings
map <C-j> <C-e>
map <C-k> <C-y>
map <C-f> :FufFile<CR>
map <C-h> :bprevious<CR>
map <C-l> :bnext<CR>

"moving up and down moves visual lines, not actual lines.
noremap j gj
noremap k gk

"Here comes the AckAck
map <leader>gg :Ack! "" **<left><left><left><left>
map <leader>gw :Ack! "\b<cword>\b"<CR>
