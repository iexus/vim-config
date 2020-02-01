set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" UI
Plug 'airblade/vim-gitgutter'                                 " Show the column of changes to the file against git
Plug 'vim-airline/vim-airline'                                " Add a nicer status line
Plug 'vim-airline/vim-airline-themes'                         " Themes for Airline
Plug 'mhinz/vim-startify'                                     " Start Vim with a more useful start screen

" " Search and file exploring
Plug 'jlanzarotta/bufexplorer'                                " Show a sortable list of open buffers
Plug 'ctrlpvim/ctrlp.vim'                                     " Really powerful fuzzy finder for file names
Plug 'rking/ag.vim'                                           " Really fast search for text in all files
Plug 'scrooloose/nerdtree'                                    " Visualise the project directory and make it easy to navigate
Plug 'scrooloose/nerdcommenter'                               " Handy commenting!
Plug 'ludovicchabant/vim-gutentags'                           " Better automated generation and update of ctags files
Plug 'tpope/vim-projectionist'                                " Map tools and actions based on the project

" Snippets and autocomplete
Plug 'tpope/vim-endwise', {'for': 'ruby'}                     " Automatically insert programming block endings (ie. `end` in Ruby, `endif` in VimL)
Plug 'tpope/vim-ragtag'                                       " Provide bindings for closing HTML/XML tags
Plug 'ajh17/VimCompletesMe'                                   " Very lightweight completion helper
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Extra syntax highlighting and language support
Plug 'scrooloose/syntastic'                                   " The Godfather of all syntax highlighting and checking
Plug 'sheerun/vim-polyglot'                                   " Currated group of other excellent plugins

" Go
Plug 'fatih/vim-go'

" Plug 'andyl/vim-projectionist-elixir'
" Plug 'gregsexton/MatchTag'                                    " Highlight the matching opening or closing tag in HTML/XML
" Plug 'AdamWhittingham/projector_mode'                         " Toggle between colourschemes for work & projection or screensharing
" Plug 'lilydjwg/colorizer'
" Plug 'tpope/vim-unimpaired'                                   " Extra bindings for common buffer navigation
" Plug 'timakro/vim-searchant'                                  " Better highlighting when searching in file
" Plug 'tpope/vim-commentary'                                   " Quick toggle for code commenting
" Plug 'tpope/vim-speeddating'                                  " Extend vim increment/decrement to work on dates
" Plug 'tpope/vim-surround'                                     " Quick editing or insertion for surrounding characters (ie. quickly add quotes around a line)
" Plug 'tpope/vim-rbenv'                                        " Use rbenv for Ruby tools
" Plug 'ecomba/vim-ruby-refactoring',    {'for': 'ruby'}        " Extra Ruby refactoring tools
" Plug 'cakebaker/scss-syntax.vim'                              " SCSS syntax highlighting

call plug#end()

syntax on
filetype plugin indent on
set re=1

" Setup the leader key
let mapleader = ","

colorscheme Tomorrow-Night-Eighties

set t_ut=     " Disable deleted colouring
set t_Co=256    " force 256 Colours
syn sync fromstart

hi Normal guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE

set visualbell
set t_vb=

" airline config
let g:airline_theme = "kalisi"

let g:airline_left_sep = ""
let g:airline_left_alt_sep = ""
let g:airline_right_sep = ""
let g:airline_right_alt_sep = ""
let g:airline_section_z = '%c, %l/%L'

let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#tagbar#enabled = 0

" ---------------- Indentation and formatting ------------------------
set autoindent                          " Automatically indent based on syntax detection
set smarttab                            " tabs depend on the width set
set expandtab                           " Convert tabs to spaces
set shiftround
set nowrap                              " Line wrapping off
set scrolloff=3                         " More context around cursor
set tabstop=2                           " Number of spaces a tab is
set softtabstop=2                       " Number of spaces a tab is while editing
set shiftwidth=2

" ---------------- General Settings ----------------------------------
set number
set ruler
set mouse=a
set nobackup
set statusline=%<%f\ %h%m%r%=%-20.(line=%l\ of\ %L,col=%c%V%)\%h%m%r%=%-40(,%n%Y%)\%P%#warningmsg#%{SyntasticStatuslineFlag()}%*
" set statusline+=%F
set laststatus=2
set directory=/var/tmp,~/.tmp,.
set fdm=marker
set backspace=start,indent,eol
set textwidth=100

set mousehide                           " Hide the mouse cursor when typing
set hidden                              " Allow buffer switching without saving
set sidescrolloff=0
set cursorline                          " Hilight the line the cursor is on

set background=dark
set nofoldenable                        " Disable all folding of content
set nojoinspaces                        " Use only 1 space after "." when joining lines instead of 2

set history=1000                        " Remember a decent way back
set spelllang=en_gb

map <ScrollWheelLeft> <nop>
map <S-ScrollWheelLeft> <nop>
map <C-ScrollWheelLeft> <nop>
map <ScrollWheelRight> <nop>
map <S-ScrollWheelRight> <nop>
map <C-ScrollWheelRight> <nop>

" -----------------------------------
" Search Options
" -----------------------------------
set hlsearch        " highlight search matches...
set incsearch       " ...as you type
set ignorecase      " Generally ignore case
set smartcase       " Care about case when capital letters show up

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


" Enable omni completion.
autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" Setup autocompletion lookups for VimCompletesMe
autocmd FileType text,markdown let b:vcm_tab_complete = 'dict'
autocmd FileType ruby,elixir let b:vcm_tab_complete = 'tags'


" -----------------------------------
" GUI Vim Options
" -----------------------------------
set guifont=Menlo:h12
" set guioptions-=T     " no toolbar
" set guioptions-=m     " no menu
set guioptions+=LlRrb " Hack which adds all scrollbars so that they can be removed, line below breaks without this
set guioptions-=LlRrb " Remove all scrollbars

" Disable Ex Mode to remove confusion
nnoremap Q <Nop>

" make W and Q act like w and q
command! W :w
command! Q :q
command! Qa :qa

" <leader>. to view all document buffers
nmap <silent> <unique> <Leader>. :BufExplorer<CR>

" Double leader to switch to the previous buffer
map <silent> <Leader><Leader> :b#<CR>

"  <Leader>f to fuzzy search files
map <silent> <leader>f :CtrlP<cr>

"  <Leader>F to fuzzy search files in the same directory as the current file
map <silent> <leader>F :CtrlPCurFile<cr>

"  <Leader>} to Search for a tag in the current project
map <silent> <leader>} :CtrlPTag<cr>

"  <Leader>h to dismiss search result highlighting until next search or press of 'n'
:noremap <silent> <leader>h :noh<CR>

"  <Leader>H to show hidden characters
nmap <silent> <leader>H :set nolist!<CR>

" <Leader>i to reindent the current file
map <silent> <leader>i  mzgg=G`z

"  <Leader>m to toggle file tree (,M to select the current file in the tree)
nmap <silent> <Leader>m :NERDTreeToggle<CR>

"  <Leader>M to toggle file tree, selecting the current file
map <silent> <Leader>M :NERDTreeFind<CR>

"  <Leader>rt to run ctags on the current directory
map <leader>rt :!ctags -R .<CR><CR>

"  <Leader>sp to toggle spelling highlighting
nmap <silent> <Leader>sp :setlocal spell!<CR>

"  <Leader>sw to strip whitespace off the ends
nmap <silent> <Leader>sw :call StripTrailingWhitespace()<CR>

" Add :w!! to save the current file with sudo
cmap w!! w !sudo tee > /dev/null %

" ----------------------------------------------
" Setup vim-go and bindings
" ----------------------------------------------

" let g:go_fmt_autosave = 0

let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang G call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang GV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang GS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang GT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" " Make our git commits wrap so we don't be a douche
autocmd Filetype gitcommit setlocal spell textwidth=72

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
      \"   Rob's Stolen Vim Config: https://github.com/iexus/vim-config",
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
" Configure Buffer Explorer
" ----------------------------------------------
let g:bufExplorerDefaultHelp=1
let g:bufExplorerDisableDefaultKeyMapping=1

" ----------------------------------------------
" Setup ctags
" ----------------------------------------------

" " Tell Gutentags to store tags in .tags by default
let g:gutentags_ctags_tagfile = '.tags'

" ----------------------------------------------
" Setup NERDCommenter
" ----------------------------------------------
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" " ----------------------------------------------
" " Setup NERDTree
" " ----------------------------------------------
" " A whole bunch of NERDTree configuration stolen from carlhuda's janus
" let NERDTreeIgnore=['\.rbc$', '\~$']

" Make NERDTree close when you open a file from it. Helps recover screen space!
let NERDTreeQuitOnOpen=1

" strip trailing whitespace
function! StripTrailingWhitespace()
  normal mz
  normal Hmy
  exec '%s/\s*$//g'
  normal 'yz<cr>
  normal `z
endfunction

" " Display Vim syntax groups under the cursor
" function! VimSyntaxGroups()
"   for id in synstack(line("."), col("."))
"     echo synIDattr(id, "name")
"   endfor
" endfunction

" " Add function for showing the syntax tag for the selected text
" function! <SID>SynStack()
"   if !exists("*synstack")
"     return
"   endif
"   echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
" endfunc
"
"
" ----------------------------------------------
" Setup Syntastic
" ----------------------------------------------
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_always_populate_loc_list=1

let g:syntastic_python_checker = ['flake8']
let g:syntastic_python_flake8_args = '--ignore=E,W,F403,F401'
let g:syntastic_python_python_exec = '~/.pyenv/shims/python3'


" ----------------------------------------------
" Disable unhelpful polyglot plugins
" ----------------------------------------------
let g:polyglot_disabled = ['csv']

" if executable('eslint')
"   let g:syntastic_javascript_checkers = ['eslint']
" endif

" set backupdir=/var/tmp,~/.tmp,.         " Don't clutter project dirs up with swap files
" set autowrite                           " Writes on make/shell commands
" set cf                                  " Enable error files & error jumping.
" set complete+=kspell
" set listchars=nbsp:█,eol:¶,tab:>-,extends:»,precedes:«,trail:•
" set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
" set shortmess+=A
" set timeoutlen=500                      " Milliseconds to wait for another key press when evaluating commands
" set wildmode=list:longest               " Shell-like behaviour for command autocompletion
" set fillchars+=vert:\                   " Set the window borders to not have | chars in them

" " Setup the projector toggle plugin
" let g:default_colorscheme = 'Tomorrow-Night-Eighties'
" let g:projector_colorscheme = 'mac-classic'

" ----------------------------------------------
" Setup highlighting
" ----------------------------------------------

" " Show current line highlighting only in the active pane
" augroup BgHighlight
"   autocmd!
"   autocmd WinEnter * set cul
"   autocmd WinLeave * set nocul
" augroup END


" " Highlight trailing whitespace
" highlight RedundantSpaces term=standout ctermbg=red guibg=red
" match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted

" " Highlight Non-breaking spaces
" highlight BadSpaces term=standout ctermbg=red guibg=red
" match BadSpaces / \+/

" " ----------------------------------------------
" " Command Shortcuts
" " ----------------------------------------------

" " Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" " quickfix window with <leader>a

" map <C-n> :cnext<CR>
" map <C-m> :cprevious<CR>
" nnoremap <leader>a :cclose<CR>

"  <Leader>z to zoom pane when using splits
" map <Leader>z :ZoomWin<CR>

"  <Leader>= to switch to better style for projecting
" noremap <silent> <leader>= :ToggleProjectorMode<CR>

"  <Leader>$ to toggle line wrap
" map <silent> <leader>$ :set wrap!<CR>

"  <Leader>gt to toggle the gutter
" nmap <leader>gt :GitGutterToggle<CR>

" make Y consistent with C and D
" nnoremap Y y$

"  <Leader>gh highlight changed lines
" nmap <leader>gh :GitGutterLineHighlightsToggle<CR>

" <Leader>I to reindent the current file
" map <silent> <leader>I  gggqG

" Rainbow colour parens and brachets to see what matches and which levels
" map <silent> <leader>) :RainbowToggle<CR>

"  <Leader>s to split/expand lines
" nmap <silent> <leader>s :SplitjoinSplit<cr>

"  <Leader>S to join/condense lines
" nmap <silent> <leader>S :SplitjoinJoin<cr>

" if has("gui_running")
"   " Ctrl+s to write the file (would scroll-lock Vim in the terminal!)
"   map <C-s> <esc>:w<CR>
"   imap <C-s> <esc>:w<CR>
" endif

" " ----------------------------------------------
" " Window split & size shortcuts
" " ----------------------------------------------

" " <leader> w for window commands
" map <leader>w <c-w>w
" map <leader>ws :vsplit<CR>
" map <leader>wS :split<CR>

" " C-H and C-L to jump left and right between splits
" map <C-h> <C-w>h
" map <C-l> <C-w>l
" "
" " C-J and C-K to jump down and up between splits
" map <C-j> <C-w>j
" map <C-k> <C-w>k

" " ----------------------------------------------
" " Map Uncommon Filetype for Syntax Highlighting
" " ----------------------------------------------

" au BufRead,BufNewFile *.scss set filetype=scss.css
" au BufRead,BufNewFile *.palette set filetype=ruby

" " ----------------------------------------------
" " Setup filetype specific settings
" " ----------------------------------------------

" " Automatically turn on colorizers highlighting for some filetypes
" let g:colorizer_auto_filetype='css,haml,html,less,scss,vim'

" " MARKDOWN -------------------------------------
" " Enable spell-check & wrapping when editing text documents (eg Markdown)
" autocmd BufNewFile,BufRead *.md :setlocal wrap
" autocmd BufNewFile,BufRead *.md :setlocal spell
" let g:vim_markdown_folding_disabled=1

" " MAKE -------------------------------------
" " Leave tabs as tabs in Makefiles
" autocmd FileType make set noexpandtab

" " Fix supertab/endwise incompatibility
" let g:SuperTabCrMapping = 0

" " HTML & XML -------------------------------------
" " Enable ragtag XML tag mappings
" let g:ragtag_global_maps = 1

" " ----------------------------------------------
" " Auto-complete shortcuts
" " ----------------------------------------------


" " ----------------------------------------------
" " Copy file path details to the system clipboard
" " ----------------------------------------------

" nmap <leader>cp :CopyRelativePath<CR>
" nmap <leader>cP :CopyAbsolutePath<CR>
" nmap <leader>cf :CopyFileName<CR>
" nmap <leader>cd :CopyDirectoryPath<CR>
" nmap <leader>cr :CopyRelativePathAndLine<CR>

" " Disable netrw's autocmd, since we're ALWAYS using NERDTree
" runtime plugin/netRwPlugin.vim
" augroup FileExplorer
"   au!
" augroup END

" let g:NERDTreeHijackNetrw = 0

" " If the parameter is a directory (or there was no parameter), open NERDTree
" function s:NERDTreeIfDirectory(directory)
"   if isdirectory(a:directory) || a:directory == ""
"     NERDTree
"   endif
" endfunction

" " If the parameter is a directory, cd into it
" function s:CdIfDirectory(directory)
"   if isdirectory(a:directory)
"     call ChangeDirectory(a:directory)
"   endif
" endfunction

" " NERDTree utility function
" function s:UpdateNERDTree(stay)
"   if exists("t:NERDTreeBufName")
"     if bufwinnr(t:NERDTreeBufName) != -1
"       NERDTree
"       if !a:stay
"         wincmd p
"       end
"     endif
"   endif
" endfunction

" " Utility functions to create file commands
" function s:CommandCabbr(abbreviation, expansion)
"   execute 'cabbrev ' . a:abbreviation . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' . a:expansion . '" : "' . a:abbreviation . '"<CR>'
" endfunction

" function s:FileCommand(name, ...)
"   if exists("a:1")
"     let funcname = a:1
"   else
"     let funcname = a:name
"   endif

"   execute 'command -nargs=1 -complete=file ' . a:name . ' :call ' . funcname . '(<f-args>)'
" endfunction

" function s:DefineCommand(name, destination)
"   call s:FileCommand(a:destination)
"   call s:CommandCabbr(a:name, a:destination)
" endfunction

" " Public NERDTree-aware versions of builtin functions
" function ChangeDirectory(dir, ...)
"   execute "cd " . a:dir
"   let stay = exists("a:1") ? a:1 : 1
"   call s:UpdateNERDTree(stay)
" endfunction

" function Touch(file)
"   execute "!touch " . a:file
"   call s:UpdateNERDTree(1)
" endfunction

" function Remove(file)
"   let current_path = expand("%")
"   let removed_path = fnamemodify(a:file, ":p")

"   if (current_path == removed_path) && (getbufvar("%", "&modified"))
"     echo "You are trying to remove the file you are editing. Please close the buffer first."
"   else
"     execute "!rm " . a:file
"   endif
" endfunction

" function Edit(file)
"   if exists("b:NERDTreeRoot")
"     wincmd p
"   endif

"   execute "e " . a:file

" ruby << RUBY
"   destination = File.expand_path(VIM.evaluate(%{system("dirname " . a:file)}))
"   pwd         = File.expand_path(Dir.pwd)
"   home        = pwd == File.expand_path("~")

"   if home || Regexp.new("^" + Regexp.escape(pwd)) !~ destination
"     VIM.command(%{call ChangeDirectory(system("dirname " . a:file), 0)})
"   end
" RUBY
" endfunction

" " Define the NERDTree-aware aliases
" call s:DefineCommand("cd", "ChangeDirectory")
" call s:DefineCommand("touch", "Touch")
" call s:DefineCommand("rm", "Remove")

" let g:javascript_enable_domhtmlcss = 1
"
"
" " ----------------------------------------------
" " Configure GitGutter
" " ----------------------------------------------
" " Set the git gutter colors to be the same as the number column
" hi clear SignColumn

" " Set the Gutter to show all the time, avoiding the column 'pop' when saving
" set signcolumn=yes
" let g:gitgutter_sign_added = '+'
" let g:gitgutter_sign_modified = '~'
" let g:gitgutter_sign_removed = '-'
" let g:gitgutter_sign_modified_removed = '~'
" let g:gitgutter_max_signs = 1000


" " ----------------------------------------------
" " Configure Testing tools
" " ----------------------------------------------

" " Vroom (Ruby) settings
" let g:vroom_write_all = 1
" let g:vroom_cucumber_path = 'cucumber '
" let g:vroom_map_keys = 0

" if !empty($TMUX)
"   let test#strategy = "dispatch"
" end

" " Show current line highlighting only in the active pane
" augroup BgHighlight
"   autocmd!
"   autocmd WinEnter * set cul
"   autocmd WinLeave * set nocul
" augroup END


" " ----------------------------------------------
" " Add Misc helpful functions
" " ----------------------------------------------

" " Jump to last cursor position when opening a file
" " Don't do it when writing a commit log entry
" autocmd BufReadPost * call SetCursorPosition()
" function! SetCursorPosition()
"   if &filetype !~ 'commit\c'
"     if line("'\"") > 0 && line("'\"") <= line("$")
"       exe "normal g`\""
"     endif
"   end
" endfunction

