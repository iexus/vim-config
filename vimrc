set nocompatible
call plug#begin('~/.vim/plugged')

" ----------------------------------------------
" Define all the plugins!
" ----------------------------------------------

" UI
Plug 'AdamWhittingham/projector_mode'                         " Toggle between colourschemes for work & projection or screensharing
Plug 'airblade/vim-gitgutter'                                 " Show the column of changes to the file against git
Plug 'vim-airline/vim-airline'                                " Add a nicer status line
Plug 'vim-airline/vim-airline-themes'                         " Themes for Airline
Plug 'christoomey/vim-tmux-navigator'                         " Move between Vim panes & Tmux panes easily
Plug 'lilydjwg/colorizer'                                              " Show the colour off Hex colour codes
Plug 'luochen1990/rainbow'                                    " Colour in brachets in matching pairs
Plug 'mhinz/vim-startify'                                     " Start Vim with a more useful start screen
Plug 'nathanaelkane/vim-indent-guides'                        " Show indentation level guides
Plug 'regedarek/ZoomWin'                                      " Enable one pane to be fullscreened temporarily
Plug 'sjl/gundo.vim'                                          " Visualise the undo tree and make it easy to navigate
Plug 'tpope/vim-repeat'                                       " Make many more operations repeatable with `.`

" Tooling
Plug 'tpope/vim-dispatch'                                     " Enable async running of tasks

" Search and file exploring
Plug 'jlanzarotta/bufexplorer'                                " Show a sortable list of open buffers
Plug 'ctrlpvim/ctrlp.vim'                                     " Really powerful fuzzy finder for file names
Plug 'rking/ag.vim'                                           " Really fast search for text in all files
Plug 'scrooloose/nerdtree'                                    " Visualise the project directory and make it easy to navigate
Plug 'scrooloose/nerdcommenter'                               " Handy commenting!
Plug 'tpope/vim-unimpaired'                                   " Extra bindings for common buffer navigation
Plug 'timakro/vim-searchant'                                  " Better highlighting when searching in file

" Additional contextual information
Plug 'AdamWhittingham/vim-copy-filename'                      " Quick shortcuts for copying the file name, path and/or line number
Plug 'gregsexton/MatchTag'                                    " Highlight the matching opening or closing tag in HTML/XML
Plug 'ludovicchabant/vim-gutentags'                           " Better automated generation and update of ctags files
Plug 'tpope/vim-projectionist'                                " Map tools and actions based on the project

" Extra text manipulation and movement
Plug 'AndrewRadev/splitjoin.vim'                              " Quick joining or splitting of programming constructs (ie. `if...else...` to `? ... : ...`)
Plug 'AndrewRadev/switch.vim'                                 " Quickly switch programming constructs between alternate version (ie. Ruby string to symbol)
Plug 'godlygeek/tabular'                                      " Format lines into a table
Plug 'junegunn/vim-easy-align'                                " Fast alignment of lines based on preset rules
Plug 'kana/vim-textobj-user'                                  " Extend Vims text object
Plug 'adelarsq/vim-matchit'                                            " Extend % to match more text objects
Plug 'maxbrunsfeld/vim-yankstack'                             " Paste text, then rotate though things yanked before/after
Plug 'tpope/vim-commentary'                                   " Quick toggle for code commenting
Plug 'tpope/vim-abolish'                                      " Allow smartcase substitution and search
Plug 'tpope/vim-speeddating'                                  " Extend vim increment/decrement to work on dates
Plug 'tpope/vim-surround'                                     " Quick editing or insertion for surrounding characters (ie. quickly add quotes around a line)
Plug 'wellle/targets.vim'                                     " Add lots of extra text objects for brachets, quotes, args and more

" Snippets and autocomplete
Plug 'SirVer/ultisnips'                                       " Add snippet expantion for all kinds of template formats
Plug 'honza/vim-snippets'                                     " Add many popular shared snippets
Plug 'tpope/vim-endwise'                                      " Automatically insert programming block endings (ie. `end` in Ruby, `endif` in VimL)
Plug 'tpope/vim-ragtag'                                       " Provide bindings for closing HTML/XML tags
Plug 'ajh17/VimCompletesMe'                                   " Very lightweight completion helper

" Extra syntax highlighting and language support
Plug 'scrooloose/syntastic'                                   " The Godfather of all syntax highlighting and checking
Plug 'sheerun/vim-polyglot'                                   " Currated group of other excellent plugins
Plug 'niquola/vim-hl7'                                        " HL7 syntax highlighting
Plug 'slashmili/alchemist.vim'                                " Hook into Elixir Alchemist server for better completions'
Plug 'janko-m/vim-test'                                       " Add test running support for lots of languages & test frameworks
Plug 'elixir-editors/vim-elixir'

" Ruby
Plug 'tpope/vim-rbenv'                                        " Use rbenv for Ruby tools
Plug 'ecomba/vim-ruby-refactoring',    {'for': 'ruby'}        " Extra Ruby refactoring tools
Plug 'nelstrom/vim-textobj-rubyblock', {'for': 'ruby'}        " Extend % to match Ruby syntax
Plug 't9md/vim-ruby-xmpfilter',        {'for': 'ruby'}        " Run the current line of Ruby inside Vim

" Elixir
Plug 'avdgaag/vim-phoenix',            {'for': 'elixir'}      " Add Projectionist, Dispatch and Mix integrations for Phoenix projects

" JS, CSS & HTML
Plug 'cakebaker/scss-syntax.vim'                              " SCSS syntax highlighting
Plug 'adamwhittingham/vim-comb',       {'do': './install.sh'} " Organise and format CSS selectors like a proper human
Plug 'digitaltoad/vim-jade',           {'for': 'jade'}        " Jade syntax highlighting
Plug 'moll/vim-node'                                          " NodeJS syntax support


" Load any extra plugins specified in the home directory
if filereadable(expand("~/.vim.plugins.local"))
  source ~/.vim.plugins.local
endif

" No More plugins after here thanks!

call plug#end()
syntax on
filetype on
filetype indent on
filetype plugin on


" ----------------------------------------------
" Setup basic Vim behaviour
" ----------------------------------------------

" Setup the leader key, used for triggering all kinds of awesome things
let mapleader = ","

" Comma has been the leader key for so long, emulate it being the leader still
" for the sake of muscle memory
"nmap , <leader>
"nmap ,, <leader><leader>


" Set our primary colorscheme. Override this in ~/.vim.local if you want.
colorscheme adCode

set autoindent                          " Automatically indent based on syntax detection
set autowrite                           " Writes on make/shell commands
set backspace=start,indent,eol
set backupdir=/var/tmp,~/.tmp,.         " Don't clutter project dirs up with swap files
set background=dark
set directory=/var/tmp,~/.tmp,.
set cf                                  " Enable error files & error jumping.
set complete+=kspell
set cursorline                          " Hilight the line the cursor is on
set expandtab                           " Convert tabs to spaces AS IS RIGHT AND PROPER
set hidden                              " Allow buffer switching without saving
set history=1000                        " Remember a decent way back
set laststatus=2                        " Always show status line.
set listchars=nbsp:█,eol:¶,tab:>-,extends:»,precedes:«,trail:•
set mousehide                           " Hide the mouse cursor when typing
set nofoldenable                        " Disable all folding of content
set nowrap                              " Line wrapping off
set number                              " line numbers
set ruler                               " Ruler on
set scrolloff=3                         " More context around cursor
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
set shiftwidth=2
set shortmess+=A
set smarttab
set spelllang=en_gb
set statusline=%<%f\ %h%m%r%=%-20.(line=%l\ of\ %L,col=%c%V%)\%h%m%r%=%-40(,%n%Y%)\%P%#warningmsg#%{SyntasticStatuslineFlag()}%*
set tabstop=2
set timeoutlen=500                      " Milliseconds to wait for another key press when evaluating commands
set wildmode=list:longest               " Shell-like behaviour for command autocompletion
set fillchars+=vert:\                   " Set the window borders to not have | chars in them
set nojoinspaces                        " Use only 1 space after "." when joining lines instead of 2


" Display soft column limit in modern versions of vim
if version >= 730
  au WinEnter,FileType * set cc=
  au WinEnter,FileType ruby,eruby,rspec,cucumber set cc=140
endif

" Show lines which have been break-indented with a special character
if v:version > 704 || v:version == 704 && has("patch338")
  set breakindent
  set showbreak=↪
endif

" Delete comment character when joining commented lines
 if v:version > 703 || v:version == 703 && has("patch541")
   set formatoptions+=j
 endif

" -----------------------------------
" Setup file wildcard ignored names
" -----------------------------------

set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem          " Disable output and VCS files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.jar                " Disable archive files
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/* " Ignore bundler and sass caches
set wildignore+=*/tmp/cache/*                                                " Ignore rails temporary asset caches
set wildignore+=node_modules/*                                               " Ignore node modules
set wildignore+=*.swp,*.swo,*~,._*                                           " Disable temp and backup files
set wildignore+=_build/*                                                     " Ignore elixirs build folder

" ----------------------------------------------
" Configure font & colourscheme
" ----------------------------------------------
" Setup the projector toggle plugin
let g:default_colorscheme = 'adCode'
let g:projector_colorscheme = 'mac-classic'

" Setup Font
if has('win32')
  set guifont=Consolas\ 10
elseif has('mac')
  set guifont=Menlo:h12
elseif has("unix")
  set guifont=DejaVu\ Sans\ Mono\ 10
endif
" if you don't have these fonts or want something else,
" set one in your ~/vim.local file like this:
"   set guifont=fontname\ 12


" -----------------------------------
" Search Options
" -----------------------------------
set hlsearch        " highlight search matches...
set incsearch       " ...as you type
set ignorecase      " Generally ignore case
set smartcase       " Care about case when capital letters show up


" -----------------------------------
" GUI Vim Options
" -----------------------------------
set guioptions-=T     " no toolbar
set guioptions-=m     " no menu
set guioptions+=LlRrb " Hack which adds all scrollbars so that they can be removed, line below breaks without this
set guioptions-=LlRrb " Remove all scrollbars


" ----------------------------------------------
" Setup highlighting
" ----------------------------------------------

" Show current line highlighting only in the active pane
augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END


" Highlight trailing whitespace
highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted

" Highlight Non-breaking spaces
highlight BadSpaces term=standout ctermbg=red guibg=red
match BadSpaces / \+/


" -----------------------------------
" Initialise Plugins
" -----------------------------------

call yankstack#setup()

" ----------------------------------------------
" Command Shortcuts
" ----------------------------------------------

" Disable Ex Mode to remove confusion
nnoremap Q <Nop>

" make W and Q act like w and q
command! W :w
command! Q :q
command! Qa :qa

" make Y consistent with C and D
nnoremap Y y$

" <leader>. to view all document buffers
nmap <silent> <unique> <Leader>. :BufExplorer<CR>

" Double leader to switch to the previous buffer
map <silent> <Leader><Leader> :b#<CR>

" <leader>a<?> to align visually selected lines on <something>
vnoremap <silent> <Leader>a= :Tabularize /=<CR>
vnoremap <silent> <Leader>a=> :Tabularize /=>/l1c1r1<CR>
vnoremap <silent> <Leader>a, :Tabularize /,\@<=/l0r1<CR>
vnoremap <silent> <Leader>a{ :Tabularize /{<CR>
vnoremap <silent> <Leader>a\| :Tabularize /\|<CR>
vnoremap <silent> <Leader>a: :Tabularize /\w:\zs/l0l1<CR>
vnoremap <silent> <Leader>a<space> :Tabularize /[^ ] \+\zs/l0r1<CR>

" Start interactive EasyAlign in visual mode (e.g. vipa)
vmap a <Plug>(LiveEasyAlign)

"  <Leader>f to fuzzy search files
map <silent> <leader>f :CtrlP<cr>

"  <Leader>F to fuzzy search files in the same directory as the current file
map <silent> <leader>F :CtrlPCurFile<cr>

"  <Leader>} to Search for a tag in the current project
map <silent> <leader>} :CtrlPTag<cr>

"  <Leader>g to jump to the next change since git commit
nmap <leader>g <Plug>GitGutterNextHunk

"  <Leader>G to jump to the last change since git commit
nmap <leader>G <Plug>GitGutterPrevHunk

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"  <Leader>gt to toggle the gutter
nmap <leader>gt :GitGutterToggle<CR>

"  <Leader>gh highlight changed lines
nmap <leader>gh :GitGutterLineHighlightsToggle<CR>

" <Leager>ga to add the current git hunk to git staging
nmap <Leader>ga <Plug>GitGutterStageHunk

" <Leader>gu to undo the current changed hunk
nmap <Leader>gu <Plug>GitGutterUndoHunk

"  <Leader>h to dismiss search result highlighting until next search or press of 'n'
:noremap <silent> <leader>h :noh<CR>

"  <Leader>H to show hidden characters
nmap <silent> <leader>H :set nolist!<CR>

" <Leader>i to reindent the current file
map <silent> <leader>i  mzgg=G`z

" <Leader>I to reindent the current file
map <silent> <leader>I  gggqG

" Rainbow colour parens and brachets to see what matches and which levels
map <silent> <leader>) :RainbowToggle<CR>

"  <Leader>m to toggle file tree (,M to select the current file in the tree)
nmap <silent> <Leader>m :NERDTreeToggle<CR>

"  <Leader>M to toggle file tree, selecting the current file
map <silent> <Leader>M :NERDTreeFind<CR>

"  <Leader>rt to run ctags on the current directory
map <leader>rt :!ctags -R .<CR><CR>

"  <Leader>s to split/expand lines
nmap <silent> <leader>s :SplitjoinSplit<cr>

"  <Leader>S to join/condense lines
nmap <silent> <leader>S :SplitjoinJoin<cr>

"  <Leader>sp to toggle spelling highlighting
nmap <silent> <Leader>sp :setlocal spell!<CR>

"  <Leader>sw to strip whitespace off the ends
nmap <silent> <Leader>sw :call StripTrailingWhitespace()<CR>

"  <Leader>t to run all tests in the current file if it is a test, otherwise
"  run the last test file
map <silent> <leader>t :TestFile<CR>

"  <Leader>t to run the tests in the scope nearest the cursor
map <silent> <leader>T :TestNearest<CR>

"  <Leader>u to toggle undo history browser
nnoremap <Leader>u :GundoToggle<CR>

" Replace the default U (undo last line) to Redo for speedyness
nmap U <c-r>

" Add :w!! to save the current file with sudo
cmap w!! w !sudo tee > /dev/null %

"  <Leader>z to zoom pane when using splits
map <Leader>z :ZoomWin<CR>

"  <Leader>= to switch to better style for projecting
noremap <silent> <leader>= :ToggleProjectorMode<CR>

"  <Leader>$ to toggle line wrap
map <silent> <leader>$ :set wrap!<CR>

if has("gui_running")
  " Ctrl+s to write the file (would scroll-lock Vim in the terminal!)
  map <C-s> <esc>:w<CR>
  imap <C-s> <esc>:w<CR>
endif

" Replace the default U (undo last line) to Redo for speedyness
nmap U <c-r>

nmap <leader>* :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" F5 to reload doc
map <silent> <F5> <esc>:e %<CR>

" F6 to view the Vim style of the text under the cursor
nmap <F6> :call VimSyntaxGroups()<CR>


" ----------------------------------------------
" Insert Mode Abbreviations
" ----------------------------------------------

" Try to auto-complete xml tags on typing '</'
iabbrev </ </<C-X><C-O>


" ----------------------------------------------
" Window split & size shortcuts
" ----------------------------------------------

" <leader> w for window commands
map <leader>w <c-w>w
map <leader>ws :vsplit<CR>
map <leader>wS :split<CR>
nnoremap <silent> <Leader>w+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>w- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>w> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>w< :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" C-w s to vertical split
map <C-w>s :vsplit<CR>

" C-w S to horizontal split
map <C-w>S :split<CR>

" C-H and C-L to jump left and right between splits
map <C-h> <C-w>h
map <C-l> <C-w>l
"
" C-J and C-K to jump down and up between splits
map <C-j> <C-w>j
map <C-k> <C-w>k

let g:yankstack_map_keys = 0
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste


" ----------------------------------------------
" Map Uncommon Filetype for Syntax Highlighting
" ----------------------------------------------

au BufRead,BufNewFile *.scss set filetype=scss.css
au BufRead,BufNewFile *.jade.html set filetype=jade
au BufRead,BufNewFile *.palette set filetype=ruby
au BufNewFile,BufRead *.hl7 set filetype=hl7


" ----------------------------------------------
" Setup filetype specific settings
" ----------------------------------------------

" Automatically turn on colorizers highlighting for some filetypes
let g:colorizer_auto_filetype='css,haml,html,less,scss,vim'

" MARKDOWN -------------------------------------
" Enable spell-check & wrapping when editing text documents (eg Markdown)
autocmd BufNewFile,BufRead *.md :setlocal wrap
autocmd BufNewFile,BufRead *.md :setlocal spell
let g:vim_markdown_folding_disabled=1

" YAML -------------------------------------
" Ignore blank lines when calculating indentaiton on ansible yml configs
let g:ansible_options = {'ignore_blank_lines': 0}

" MAKE -------------------------------------
" Leave tabs as tabs in Makefiles
autocmd FileType make set noexpandtab

" RUBY -------------------------------------
" xmp-filter mappings
autocmd FileType ruby nmap <buffer> <Leader>X <Plug>(xmpfilter-mark)
autocmd FileType ruby xmap <buffer> <Leader>X <Plug>(xmpfilter-mark)
autocmd FileType ruby imap <buffer> <Leader>X <Plug>(xmpfilter-mark)

autocmd FileType ruby nmap <buffer> <Leader>x <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> <Leader>x <Plug>(xmpfilter-run)
autocmd FileType ruby imap <buffer> <Leader>x <Plug>(xmpfilter-run)

" Extend % to do/end etc
runtime! plugin/matchit.vim

" Fix supertab/endwise incompatibility
let g:SuperTabCrMapping = 0

" HTML & XML -------------------------------------
" Don't report Angular ng-* attributes as errors in HTML
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

" Enable ragtag XML tag mappings
let g:ragtag_global_maps = 1


" ----------------------------------------------
" Auto-complete shortcuts
" ----------------------------------------------

" Enable omni completion.
autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType c setlocal omnifunc=ccomplete#CompleteCpp

" Setup autocompletion lookups for VimCompletesMe
autocmd FileType text,markdown let b:vcm_tab_complete = 'dict'
autocmd FileType ruby,elixir let b:vcm_tab_complete = 'tags'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


" ----------------------------------------------
" Copy file path details to the system clipboard
" ----------------------------------------------

nmap <leader>cp :CopyRelativePath<CR>
nmap <leader>cP :CopyAbsolutePath<CR>
nmap <leader>cf :CopyFileName<CR>
nmap <leader>cd :CopyDirectoryPath<CR>
nmap <leader>cr :CopyRelativePathAndLine<CR>


" ----------------------------------------------
" Toggle line numbers between absolute and relative
" ----------------------------------------------

" Setup relative number toggle on Ctrl+n
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
  set number
endfunc

nnoremap <C-n> :call NumberToggle()<cr>


" ----------------------------------------------
" Setup Startify
" ----------------------------------------------

" Setup vim-startify's start screen
let g:startify_change_to_vcs_root = 1
let g:startify_files_number = 6
let g:startify_custom_header = [
      \ '   __      __            ',
      \ '   \ \    / (_)          ',
      \ '    \ \  / / _ _ __ ___  ',
      \ '     \ \/ / | | `_ ` _ \ ',
      \ '      \  /  | | | | | | |',
      \ '       \/   |_|_| |_| |_|',
      \ '                         ',
      \ ]

let g:startify_custom_footer = [
      \'',
      \"   Adam's Vim Config: https://github.com/adamwhittingham/vim-config",
      \"   Vim is charityware. Please read ':help uganda'",
      \]

let g:startify_list_order = [
      \ ['   Recent files in this directory:'],
      \ 'dir',
      \ ['   Bookmarks:'],
      \ 'bookmarks',
      \ ['   Sessions:'],
      \ 'sessions',
      \ ]

let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ ]

let g:startify_bookmarks = [
      \ { 'v': '~/.vim/vimrc' },
      \ { 't': '/tmp/foo.txt' },
      \ ]

" Stop things splitting with Startify and replace it instead
autocmd User Startified setlocal buftype=


" ----------------------------------------------
" Setup CtrlP File Finder
" ----------------------------------------------

let g:ctrlp_show_hidden = 1

" Use Ag for search if its available on this system
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif



" ----------------------------------------------
" Setup SplitJoin
" ----------------------------------------------

" Attempt alignment of keys when splitting a hash
let g:splitjoin_align = 1


" ----------------------------------------------
" Configure GitGutter
" ----------------------------------------------
" Set the git gutter colors to be the same as the number column
hi clear SignColumn

" Set the Gutter to show all the time, avoiding the column 'pop' when saving
set signcolumn=yes
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified_removed = '~'
let g:gitgutter_max_signs = 1000


" ----------------------------------------------
" Configure Testing tools
" ----------------------------------------------

if !empty($TMUX)
  let test#strategy = "dispatch"
end

" ----------------------------------------------
" Configure Rainbow Parentheses
" ----------------------------------------------

let g:rainbow_active = 0

let g:rainbow_conf = {
    \   'guifgs':   ['white', '#005fff', '#8700ff', '#af00af', '#af005f'],
    \   'ctermfgs': ['white', '27',      '93',      '127',     '125'],
    \   'separately':{
    \     'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/'],
    \     'vim': {
    \        'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \      },
    \      'xml': {
    \        'parentheses': ['start=/\v\<\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'))?)*\>/ end=#</\z1># fold'],
    \      },
    \      'xhtml': {
    \        'parentheses': ['start=/\v\<\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'))?)*\>/ end=#</\z1># fold'],
    \      },
    \      'html': {
    \        'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \      },
    \      'ruby': {
    \        'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold' ],
    \      },
    \      '*': {}
    \   }
    \ }


" ----------------------------------------------
" Configure dynamic code execution tools
" ----------------------------------------------

" Projectionist defaults
let g:projectionist_heuristics ={
      \  "spec/*.rb": {
      \     "app/*.rb":       {"alternate": "spec/{}_spec.rb",         "type": "source"},
      \     "lib/*.rb":       {"alternate": "spec/{}_spec.rb",         "type": "source"},
      \     "spec/*_spec.rb": {"alternate": ["app/{}.rb","lib/{}.rb"], "type": "test"}
      \  }
      \}


" ----------------------------------------------
" Setup the status bar
" ----------------------------------------------

let g:airline_left_sep = ""
let g:airline_left_alt_sep = ""
let g:airline_right_sep = ""
let g:airline_right_alt_sep = ""
let g:airline_section_z = '%c, %l/%L'

let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#tagbar#enabled = 0

let g:airline_theme = "kalisi"


" ----------------------------------------------
" Configure Buffer Explorer
" ----------------------------------------------
let g:bufExplorerDefaultHelp=1
let g:bufExplorerDisableDefaultKeyMapping=1


" ----------------------------------------------
" Setup Syntastic
" ----------------------------------------------
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

if executable('eslint')
  let g:syntastic_javascript_checkers = ['eslint']
endif


" ----------------------------------------------
" Setup ctags
" ----------------------------------------------

" Tell Gutentags to store tags in .tags by default
let g:gutentags_tagfile = '.tags'

" ----------------------------------------------
" Setup NERDCommenter
" ----------------------------------------------
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" ----------------------------------------------
" Setup NERDTree
" ----------------------------------------------
" A whole bunch of NERDTree configuration stolen from carlhuda's janus
let NERDTreeIgnore=['\.rbc$', '\~$']

" Make NERDTree close when you open a file from it. Helps recover screen space!
let NERDTreeQuitOnOpen=1

" Disable netrw's autocmd, since we're ALWAYS using NERDTree
runtime plugin/netRwPlugin.vim
augroup FileExplorer
  au!
augroup END

let g:NERDTreeHijackNetrw = 0

" If the parameter is a directory (or there was no parameter), open NERDTree
function s:NERDTreeIfDirectory(directory)
  if isdirectory(a:directory) || a:directory == ""
    NERDTree
  endif
endfunction

" If the parameter is a directory, cd into it
function s:CdIfDirectory(directory)
  if isdirectory(a:directory)
    call ChangeDirectory(a:directory)
  endif
endfunction

" NERDTree utility function
function s:UpdateNERDTree(stay)
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      NERDTree
      if !a:stay
        wincmd p
      end
    endif
  endif
endfunction

" Utility functions to create file commands
function s:CommandCabbr(abbreviation, expansion)
  execute 'cabbrev ' . a:abbreviation . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' . a:expansion . '" : "' . a:abbreviation . '"<CR>'
endfunction

function s:FileCommand(name, ...)
  if exists("a:1")
    let funcname = a:1
  else
    let funcname = a:name
  endif

  execute 'command -nargs=1 -complete=file ' . a:name . ' :call ' . funcname . '(<f-args>)'
endfunction

function s:DefineCommand(name, destination)
  call s:FileCommand(a:destination)
  call s:CommandCabbr(a:name, a:destination)
endfunction

" Public NERDTree-aware versions of builtin functions
function ChangeDirectory(dir, ...)
  execute "cd " . a:dir
  let stay = exists("a:1") ? a:1 : 1
  call s:UpdateNERDTree(stay)
endfunction

function Touch(file)
  execute "!touch " . a:file
  call s:UpdateNERDTree(1)
endfunction

function Remove(file)
  let current_path = expand("%")
  let removed_path = fnamemodify(a:file, ":p")

  if (current_path == removed_path) && (getbufvar("%", "&modified"))
    echo "You are trying to remove the file you are editing. Please close the buffer first."
  else
    execute "!rm " . a:file
  endif
endfunction

function Edit(file)
  if exists("b:NERDTreeRoot")
    wincmd p
  endif

  execute "e " . a:file

ruby << RUBY
  destination = File.expand_path(VIM.evaluate(%{system("dirname " . a:file)}))
  pwd         = File.expand_path(Dir.pwd)
  home        = pwd == File.expand_path("~")

  if home || Regexp.new("^" + Regexp.escape(pwd)) !~ destination
    VIM.command(%{call ChangeDirectory(system("dirname " . a:file), 0)})
  end
RUBY
endfunction

" Define the NERDTree-aware aliases
call s:DefineCommand("cd", "ChangeDirectory")
call s:DefineCommand("touch", "Touch")
call s:DefineCommand("rm", "Remove")


" ----------------------------------------------
" Setup filetype specific settings
" ----------------------------------------------

" Enable spell-check & wrapping when editing text documents (eg Markdown)
autocmd BufNewFile,BufRead *.md :setlocal wrap
autocmd BufNewFile,BufRead *.md :setlocal spell

" Ignore blank lines when calculating indentaiton on ansible yml configs
let g:ansible_options = {'ignore_blank_lines': 0}

let g:javascript_enable_domhtmlcss = 1

" ----------------------------------------------
" Configure GitGutter
" ----------------------------------------------
" Set the git gutter colors to be the same as the number column
hi clear SignColumn

" Set the Gutter to show all the time, avoiding the column 'pop' when saving
set signcolumn=yes
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified_removed = '~'
let g:gitgutter_max_signs = 1000


" ----------------------------------------------
" Configure Testing tools
" ----------------------------------------------

" Vroom (Ruby) settings
let g:vroom_write_all = 1
let g:vroom_cucumber_path = 'cucumber '
let g:vroom_map_keys = 0


" ----------------------------------------------
" Configure dynamic code execution tools
" ----------------------------------------------

" xmp-filter mappings
autocmd FileType ruby nmap <buffer> <Leader>X <Plug>(xmpfilter-mark)
autocmd FileType ruby xmap <buffer> <Leader>X <Plug>(xmpfilter-mark)
autocmd FileType ruby imap <buffer> <Leader>X <Plug>(xmpfilter-mark)

autocmd FileType ruby nmap <buffer> <Leader>x <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> <Leader>x <Plug>(xmpfilter-run)
autocmd FileType ruby imap <buffer> <Leader>x <Plug>(xmpfilter-run)

" Disable Markdown folding
let g:vim_markdown_folding_disabled=1

" Don't report Angular ng-* attributes as errors in HTML
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

" Projectionist defaults
let g:projectionist_heuristics ={
      \  "spec/*.rb": {
      \     "app/*.rb":       {"alternate": "spec/{}_spec.rb",         "type": "source"},
      \     "lib/*.rb":       {"alternate": "spec/{}_spec.rb",         "type": "source"},
      \     "spec/*_spec.rb": {"alternate": ["app/{}.rb","lib/{}.rb"], "type": "test"}
      \  }
      \}

" Show current line highlighting only in the active pane
augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

" Enable ragtag XML tag mappings
let g:ragtag_global_maps = 1


" ----------------------------------------------
" Add Misc helpful functions
" ----------------------------------------------

" Jump to last cursor position when opening a file
" Don't do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
  if &filetype !~ 'commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$")
      exe "normal g`\""
    endif
  end
endfunction

" strip trailing whitespace
function! StripTrailingWhitespace()
	normal mz
	normal Hmy
	exec '%s/\s*$//g'
	normal 'yz<cr>
	normal `z
endfunction

" Display Vim syntax groups under the cursor
function! VimSyntaxGroups()
  for id in synstack(line("."), col("."))
    echo synIDattr(id, "name")
  endfor
endfunction

" Add function for showing the syntax tag for the selected text
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"define :Lorem command to dump in a paragraph of lorem ipsum
command! -nargs=0 Lorem :normal iLorem ipsum dolor sit amet, consectetur
      \ adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
      \ magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
      \ ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
      \ irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
      \ fugiat nulla pariatur.  Excepteur sint occaecat cupidatat non
      \ proident, sunt in culpa qui officia deserunt mollit anim id est
      \ laborum

"define :Hipster command to dump in a paragraph of Hipster ipsum
command! -nargs=0 Hipster :normal iTrust fund fashion axe bitters art party
      \ raw denim. XOXO distillery tofu, letterpress cred literally gluten-free
      \ flexitarian fap. VHS fashion axe gluten-free 90's church-key, kogi
      \ hashtag Marfa. Kogi Tumblr Brooklyn chambray. Flannel pickled YOLO
      \ semiotics. Mlkshk keffiyeh narwhal, mumblecore gentrify raw denim food
      \ truck DIY. Craft beer chia readymade ethnic, hella kogi Vice jean shorts
      \ cliche cray mlkshk ugh cornhole kitsch quinoa


" ----------------------------------------------
"  Source any local config
"  Keep this last to make sure local config overrides global!
" ----------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
