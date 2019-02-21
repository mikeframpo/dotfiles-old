"TODO
"draw tabs,spaces and newlines all the time (optionally).
"allow ctrl-j/k to work in insert mode
"allow a grep-path to be specified, if the path hasn't been specified
"	then `pwd` should be used.
"	look at function RenderSyntax() in minibufexpl for example
"allow smart-completion to match words in latex files that are joined by -,_
"stop bold font when using in terminal mode
"
"The filetype grep path is kinda sucky at the moment, it uses the register
"@g to define the search paths. The variable path doesn't change when
"switching back and forth between already loaded buffers, an alternative
"is to use a buffer specific variable and perform an execute command within
"the mapping, however the downside of this is that the programmer doesn't get
"to see the contents of the variable before execution.
"
"grepping automatically opens the cope window
"
"fuf replacement commands?
"
"	search/find and replace:
"		:%s/foo/bar/g		normal search and replace
"		:%s/foo/bar/gc		ask for confirmation
"		:%s/\<foo\>/bar/g	only replace whole word
"	ack:
"		:cope/:ccl	open/close quickfix
"		Ack term	case sensitive search for term
"		<leader>gg	Ack grep for a word.
"		<leader>gw	Ack grep for the word under the cursor.
"	buffers:
"		:Ctrl-h		previous buffer
"		:Ctrl-l		next buffer
"		:bN		change to buffer number N
"		:bn/:bp		next prev
"		:ls		list buffers
"		:bd[N]		close the current buffer, or buf N, doesn't
"		seem to work with minibuf
"	navigating:
"		Ctrl-j/k	scroll one line up/down
"		zz		center screen on cursor
"		Ctrl-o		back edit location
"		Ctrl-i		forward edit location
"		<Leader>	mapped to \ by default
"	navigating the changelist
"		`.			go to last change location
"		g;			go backward in changelist
"		g,			go forward in changelist
"	comment block:
"		1. Ctrl-v
"		2. Shift-I
"		3. # Esc
"	Regenerate Help files:
"		:helptags ~/.vim/doc	
"	fuzzyfinder:
"		Ctrl-f open FufFile
"		:FufFile
"		**/filename	recursively searches the directory for a file.
"	registers:
"		v mode (text selected):
"			"<reg>y			yank into register
"							similarly, can d into <reg>
"		insert mode:
"			ctrl-R<reg>		pastes contents at cursor.
"			ctrl-R/			pastes the last search
"								this works in command mode too.
"		append to reg
"			if reg name is 'a'
"			"Ayy	will append the current line to a
"	hexdump:
"		to view the current file in hex format:
"			:%!xxd	-passes the entire file through the xxd utility
"	reload vimrc:
"		:so $MYVIMRC
"	difftool:
"		]c	next change
"		[c	previous change
"		do	take from other file
"		dp	put these changes into other file
"	folding:
"		zo	open fold under cursor
"		zc	close fold under cursor
"
"		zr	reduce fold level
"		zm	more (increase) fold level
"
"		zf	fold the selected text
"		zd	unfold selected lines
"	case-insensitive-pattern matching
"		:set ignorecase	and,
"		:set noignorecase
"
"Useful commands
"	@:		Last colon command
"	@@			repeat again

" run the pathogen runtime loader
execute pathogen#infect()

set nocompatible

"removes all autocommands from the group, prevents double ups on resourcing of vimrc
autocmd!

colorscheme evening

"show row/column
set ruler

"enable syntax highlighting
syntax on

" uncomment this line to enable wrapping in diffs, note that this
" will break the lock-stepped lines which is a nice feature.
"autocmd FilterWritePre * if &diff | setlocal wrap< | endif

" move temp files into a different directory, swap files were causing
" angular to reload all the time
set dir=$HOME/.vim/tmp/swap
if !isdirectory(&dir) | call mkdir(&dir, 'p', 0700) | endif

" autosave when a buffer is modified
let g:auto_save = 1

"line numbering
set number

"search highlighting on
set hlsearch

"by default, replace all instances of a substitution in a line
set gdefault

set ignorecase

"smart indenting
filetype indent plugin on

"indentation quick guide
" tabstop		the number of columns used to display a <tab>
" expandtab		use spaces instead of tabs
" shiftwidth=n	n columns are used when << or >> is used
" softtabstop=n	n columns are displayed when tab is pressed in insert mode,
" 					this will only apply if expandtab is not set, if sts is
" 					less than tabstop a mix of tabs and spaces will be used
" 					to reach the desired spacing.

"the default settings
set tabstop=4
set noexpandtab
set shiftwidth=4
set softtabstop=4

"enable backspace
set backspace=indent,eol,start

"wrap text in the buffer without inserting linebreaks,
set wrap
"only wrap after characters in the breakat variable
set linebreak

set display=lastline

set nomodeline

"don't jump to the start of line when switching buffers
set nostartofline

"tab completion when opening a file, the first tab completes as much as
"possible, the second provides a list of possible matches, subsequent tabs
"cycle a list of possible matches.
set wildmode=longest,list,full
set wildmenu

"when using autocomplete, only complete up to the typed character
set completeopt=longest,menuone

" the default filetype is all-files
au BufEnter * let b:grep_filetype = "**/*"

"let g:typescript_indent_disable = 1

"filetype specific settings
au FileType c,cpp,python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
au FileType c,cpp,java setlocal colorcolumn=79
au FileType python setlocal colorcolumn=79
au FileType tex setlocal colorcolumn=99
au FileType tex setlocal iskeyword=@,48-57,:,192-255
au BufEnter *.c,*.cpp,*.h let b:grep_filetype='**/*.c **/*.cpp **/*.h'
au BufEnter *.py let b:grep_filetype='**/*.py'
au Filetype html setlocal filetype=htmldjango
au BufEnter *.ts setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
" this is from the google style guide -
" https://google.github.io/styleguide/cppguide.html#Spaces_vs._Tabs
au Filetype c,cpp setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

"javascript files
au FileType javascript setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
au FileType javascript setlocal colorcolumn=79

"java files
au BufEnter *.java let b:grep_filetype = "**/*.java"

"gradle build files are groovy code
au BufRead,BufNewFile *.gradle setfiletype groovy

"scons SContruct files are python code
au BufRead,BufNewFile SConstruct,SConscript setfiletype python

"Let vim know we're using Latex, not one of the other tex's
let g:tex_flavor = "latex"

"Custom latex mappings
nmap <leader>mi a\(\)<left><left>
nmap <leader>me a\[<Enter>\]<Esc>O

"ctrl+arrows navigates between windows
map <C-Down>  <C-W>j
map <C-Up>    <C-W>k
map <C-Left>  <C-W>h
map <C-Right> <C-W>l

"close the current buffer without losing window split
map <leader>bd :bp\|bd #<CR>
nmap <C-x> :bp\|bd #<CR>

" FZF plugin bindings
nmap <C-f> :Files<CR>
nmap <C-b> :Buffers<CR>

"don't display whitespace by default, listchars displays pretty much everything
set nolist
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

"turn on spell checking - why not?
set spell

"buffers we aren't editing aren't on the screen
set hidden

"the number of lines to scroll with ctrl-U/ctrl-D
set scroll=5

"sets the number of lines that must be on-screen
set scrolloff=6

"key mappings
map <C-j> <C-e>
map <C-k> <C-y>
map <C-h> :bprevious<CR>
map <C-l> :bnext<CR>

"moving up and down moves visual lines, not actual lines.
noremap j gj
noremap k gk

"vimgrep, useful for systems that don't have Ack
map <leader>gg :vimgrep! //j <c-r>=b:grep_filetype<CR> <Bar> cw <Home><Right><Right><Right><Right><Right><Right><Right><Right><Right><Right>
map <leader>gt :vimgrep! //j *.tex <Bar> cw <Home><Right><Right><Right><Right><Right><Right><Right><Right><Right><Right>
map <leader>gw :execute "vimgrep! /" . expand("<cword>") . "/j <c-r>=b:grep_filetype<CR>" <Bar> cw <CR>

"find and replace in this file
map <leader>ss :%s/<c-r><c-w>//g<Left><Left>

nmap <C-n> :NERDTreeToggle <CR>

"run make, makeshift plugin will automatically try to figure out which command
"to run
nnoremap <F5> :write<CR> :make<CR>
nnoremap <F6> :write<CR> :make --tex="%:t"<CR>

set guifont=Droid\ Sans\ Mono\ 11
"font settings
if has("win32")
	set guifont=Consolas:h11:cANSI
endif

