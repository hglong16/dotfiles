" Plugins
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/wil/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/wil/.config/nvim/dein')
  call dein#begin('/home/wil/.config/nvim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/wil/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

  " Utilities
  call dein#add('SirVer/ultisnips')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('honza/vim-snippets')
  call dein#add('luochen1990/rainbow')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('tpope/vim-surround')
  call dein#add('flazz/vim-colorschemes')
  call dein#add('yggdroot/indentLine')
  call dein#add('tpope/vim-obsession')
  call dein#add('haya14busa/dein-command.vim')
  call dein#add('Shougo/denite.nvim', {'merged': 0, 'loadconf': 1})
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  call dein#add('Shougo/vimfiler.vim')
  call dein#add('Shougo/echodoc.vim')
  call dein#add('thinca/vim-ref')
  call dein#add('thinca/vim-quickrun')
  call dein#add('mbbill/undotree')
  call dein#add('haya14busa/incsearch.vim')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('wellle/targets.vim')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('ludovicchabant/vim-gutentags')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('majutsushi/tagbar', {'on_cmd': 'TagbarToggle'})

  " Unite
  call dein#add('Shougo/unite.vim', {'merged': 0 , 'loadconf': 1})
  call dein#add('Shougo/unite-outline')
  call dein#add('Shougo/neomru.vim')
  call dein#add('osyo-manga/unite-quickfix')
  call dein#add('Shougo/unite-build')
  call dein#add('thinca/vim-unite-history')
  call dein#add('osyo-manga/unite-filetype')
  
  " Git
  call dein#add('tpope/vim-fugitive')

  " Completion
  call dein#add('Valloric/YouCompleteMe', {'merged': 0})
  call dein#add('rdnetto/YCM-Generator', {'rev': 'stable'})


  " Checkers
  call dein#add('benekastah/neomake')
  call dein#add('vim-syntastic/syntastic', {'on_ft': ['ocaml', 'clojure', 'lua']})

  " Rust
  call dein#add('rust-lang/rust.vim', {'on_ft': 'rust'})
  call dein#add('racer-rust/vim-racer', {'on_ft': 'rust'})

  " Clojure
  call dein#add('venantius/vim-eastwood', {'on_ft': 'clojure'})
  call dein#add('venantius/vim-cljfmt', {'on_ft': 'clojure'})
  call dein#add('tpope/vim-fireplace', {'on_ft': 'clojure'})
  call dein#add('guns/vim-clojure-static', {'on_ft': 'clojure'})
  call dein#add('tpope/vim-salve', {'on_ft': 'clojure'})
  call dein#add('guns/vim-sexp', {'on_ft': 'clojure'})
  call dein#add('tpope/vim-sexp-mappings-for-regular-people', {'on_ft': 'clojure'})
  call dein#add('guns/vim-clojure-highlight', {'on_ft': 'clojure'})
  call dein#add('hkupty/acid.nvim', {'on_ft': 'clojure'})

  " Pandoc/Markdown
  call dein#add('vim-pandoc/vim-pandoc', {'on_ft': 'markdown'})
  call dein#add('vim-pandoc/vim-pandoc-syntax', {'on_ft': 'markdown'})
  call dein#add('vim-pandoc/vim-pandoc-after', {'on_ft': 'markdown'})

  " TOML
  call dein#add('cespare/vim-toml', {'on_ft': 'toml'})

  " Yaml
  call dein#add('stephpy/vim-yaml', {'on_ft': 'yaml'})

  " JS
  call dein#add('marijnh/tern_for_vim', {'on_ft': 'javascript'})
  call dein#add('pangloss/vim-javascript', {'on_ft': 'javascript'})
  call dein#add('wookiehangover/jshint.vim', {'on_ft': 'javascript'})

  " Idris
  call dein#add('idris-hackers/idris-vim', {'on_ft': 'idris'})

  " Haskell
  call dein#add('neovimhaskell/haskell-vim', {'on_ft': 'haskell'})
  call dein#add('eagletmt/neco-ghc', {'on_ft': 'haskell'})
  call dein#add('eagletmt/ghcmod-vim', {'on_ft': 'haskell'})

  " Coffeescript
  call dein#add('kchmck/vim-coffee-script', {'on_ft': 'coffeescript'})

  " Jade
  call dein#add('digitaltoad/vim-jade', {'on_ft': 'jade'})

  " Less
  call dein#add('groenewege/vim-less', {'on_ft': 'less'})

  " Elm
  call dein#add('lambdatoast/elm.vim', {'on_ft': 'elm'})

  " OCaml
  call dein#add('the-lambda-church/merlin', {'on_ft': 'ocaml'})
  call dein#add('OCamlPro/ocp-indent', {'on_ft': 'ocaml'})
  call dein#add('rgrinberg/vim-ocaml', {'on_ft': 'ocaml'})

  " LaTeX
  call dein#add('lervag/vimtex', {'on_ft': 'tex'})

  " Torch
  call dein#add('jakezhaojb/vim-torch-snipmate', {'on_ft': 'lua'})

  " Elixir
  call dein#add('elixir-lang/vim-elixir', {'on_ft': 'elixir'})
  call dein#add('slashmili/alchemist.vim', { 'on_ft': 'elixir'})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" General settings
set title
set wildmenu
set autoread
set tw=100
set formatoptions+=t
set so=7
set wildignore=*.o,*~,*.pyc
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set incsearch
set lazyredraw
set magic
set showmatch
set noerrorbells
set novisualbell
set ignorecase
set smartcase
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme colorsbox-material
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set number
set relativenumber
set ai
set si
set wrap
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set viminfo^=%
set hidden
set bg=dark

" Autocommands
au BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\ exe "normal! g`\"" |
	\ endif
au BufWinEnter * checktime
au BufWritePost * Neomake
au BufRead * Neomake
au CompleteDone * pclose
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
au BufNewFile,BufFilePre,BufRead *.md set makeprg=make\ %:t:r
au BufNewFile,BufFilePre,BufRead *.tex set makeprg=make
au BufWritePost *.md Neomake!
au BufNewFile,BufFilePre,BufRead *.rs,Cargo.toml set makeprg=cargo\ build
au FileType haskell set omnifunc=necoghc#omnifunc

" Custom sequence bindings
let mapleader = "\<space>"
nnoremap <Leader>hh :nohl<CR>
nnoremap <Leader>o :CtrlPMixed<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>g :bn<CR>
nnoremap <Leader>t :bp<CR>
nnoremap <Leader>z :TagbarToggle<CR>
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>m :Neomake!<CR>
nnoremap <Leader>e :enew<CR>:CtrlPMixed<CR>
nnoremap <leader>f 1z=
nnoremap <leader>s :set spell!
nnoremap <leader>l <C-^>
nnoremap <leader>u :Unite<CR>

let maplocalleader = "\<cr>"

" Incsearch settings
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Haskell settings
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_indent_disable = 1

" Eclim settings
let g:EclimCompletionMethod = 'omnifunc'

" Rainbow parens settings
let g:rainbow_active = 1

" Airline settings
let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Denite settings
call denite#custom#var('file_rec', 'command',
	\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

" Dein settings
let g:dein#enable_notification = 1
let g:dein#install_message_type = 'echo'

" Opam/OCaml settings
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
set rtp^="/usr/local/share/ocp-indent/vim"

" Neomake settings
let g:neomake_cpp_clang_args = ['-std=c++14']
let g:neomake_python_enabled_makers = ['flake8', 'pyflakes', 'vulture']

" IndentLine settings
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'

" Pandoc settings
let g:pandoc#syntax#conceal#use = 1
let g:pandoc#after#modules#enabled = ['ultisnips']
let g:pandoc#formatting#mode = 'haA'
let g:pandoc#formatting#textwidth = 100
let g:pandoc#biblio#use_bibtool = 1
let g:pandoc#completion#bib#use_preview = 1
let g:pandoc#command#autoexec_on_writes = 0
let g:pandoc#command#autoexec_command = 'make'

" Vimtex settings
let g:tex_conceal = ""
let g:tex_flavor = "latex"

" Ultisnips settings
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" Syntastic settings
let g:syntastic_ocaml_checkers=['merlin','caml4po']

" YouCompleteMe settings
let g:ycm_semantic_triggers =  {
                        \   'c' : ['->', '.'],
                        \   'objc' : ['->', '.'],
                        \   'ocaml' : ['.', '#'],
                        \   'cpp,objcpp' : ['->', '.', '::'],
                        \   'perl' : ['->'],
                        \   'php' : ['->', '::'],
                        \   'cs,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
                        \   'java,jsp' : ['.'],
                        \   'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
                        \   'ruby' : ['.', '::'],
                        \   'lua' : ['.', ':'],
                        \   'erlang' : [':'],
                        \   'tex': [
                                    \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
                                    \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
                                    \ 're!\\hyperref\[[^]]*',
                                    \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
                                    \ 're!\\(include(only)?|input){[^}]*',
                                    \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
                                    \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
                                    \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
                                \ ],
                        \  'markdown': ['@'],
                        \  'haskell': ['.']
                        \ }
let g:ycm_confirm_extra_conf = 0

" VimFiler settings
let g:vimfiler_as_default_explorer = 1

" Undotree settings
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" Easy-Align settings
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Tagbar settings
let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }

let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits,traits',
        \'i:impls,trait implementations',
    \]
    \}

let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records'
    \ ]
\ }

" Racer settings
let g:racer_cmd = "/usr/bin/racer"