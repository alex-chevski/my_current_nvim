"" Options
:set number
:set autoindent
:set hidden
:set ruler
:set title "" show title file
:set ttimeoutlen=0
:set wildmenu
:set mouse=a
:set mousehide
:set splitbelow splitright
:set ignorecase
:set smartcase
:set nowrap

"" Windows Stuff
filetype plugin indent on
syntax on

"" Enable 256 colors on the terminal
" set t_Co=256
set termguicolors

" Switch off .swp files
:set nobackup
:set noswapfile
:set encoding=utf-8
:set fileencodings=utf-8,cp1251

"" Tabs size
:set smartindent
:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
:set smarttab
:set scroll=7
" :set foldlevel=100
" :set foldenable
" :set foldmethod=manual
:set wrap
:set linebreak

"" History
:set history=100

filetype plugin on

"" My function
function! SuperCleverTab()
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-R>=SuperCleverTab()<cr>

" " " editor size
"  set lines=60
"  set columns=120

"" MyBuilding keys
if has('nvim')
  tnoremap <a-h> <c-\><c-n><c-w>h
  tnoremap <a-j> <c-\><c-n><c-w>j
  tnoremap <a-k> <c-\><c-n><c-w>k
  tnoremap <a-l> <c-\><c-n><c-w>l
endif
nnoremap <a-h> <c-w>h
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l

map gn :bn<cr>
map gp :bp<cr>
map gw :Bclose<cr>

" &&
nnoremap & :&&<CR>
xnoremap & :&&<CR>

let g:fzf_buffers_jump = 1
noremap <C-a> :File<CR>
noremap <C-p> :Buffers<CR>

" map-history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" buffer-navigation
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Current path
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" mode normal
inoremap jk <esc>
" move Insert mode
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-e> <End>
imap <C-a> <Home>

" cycle through completion entries with tab/shift+tab
inoremap <expr> <TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<TAB>"

" underline delete
nnoremap ,<space> :nohlsearch<CR>

" Save
nnoremap zz :update<cr>

" find file
let &path.="src/include,/usr/include/AL,"

" myplug
call plug#begin()

"" Visual
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'ap/vim-css-color'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'akinsho/bufferline.nvim', {'tag': 'v2.*' }
Plug 'nvim-tree/nvim-web-devicons'

"" Colorchemes
Plug 'nikolvs/vim-sunbather'
Plug 'cseelus/vim-colors-lucid'

"" Additional
Plug 'preservim/tagbar'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-swap'
Plug 'tpope/vim-abolish'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kevinhwang91/promise-async'
Plug 'kevinhwang91/nvim-ufo'

"" Local server for php js python
" Coc nvim
Plug 'neoclide/coc.nvim'
:set completeopt-=preview

" Lsp
Plug 'neovim/nvim-lspconfig'
Plug 'dense-analysis/ale'

"" Languages

" Php
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'phpactor/ncm2-phpactor'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'algotech/ultisnips-php'
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'

" Data Base
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

" HTML CSS
Plug 'mattn/emmet-vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'nelsyeung/twig.vim'

" Python Yapf
Plug 'mindriot101/vim-yapf'


call plug#end()

"" Colorschemes
set background=dark
colorscheme	lucid
let g:airline_theme='violet'

"" NerdTree config
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

"" Tagbar option
nmap <F2> :TagbarToggle<cr>
let g:tagbar_compact = 1
let g:tagbar_sort = 0
cnoremap @ <c-r>=expand("%:h")<cr>

" Twig
let g:neosnippet#snippets_directory='~/.vim/bundle/twig.vim/neosnippets'

" buferline
lua << EOF
	require("bufferline").setup{}
EOF

noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
" noremap <Leader><Tab> :Bw<CR>
" noremap <Leader><S-Tab> :Bw!<CR>
" noremap <C-t> :tabnew split<CR>

" Data Base
nnoremap <silent> <leader>du :DBUIToggle<CR>
nnoremap <silent> <leader>df :DBUIFindBuffer<CR>
nnoremap <silent> <leader>dr :DBUIRenameBuffer<CR>
nnoremap <silent> <leader>dl :DBUILastQueryInfo< CR>
let g:db_ui_save_location = '~/.config/db_ui'

" Namespace php
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

set tags+=tags,tags.vendors

" PHP-doc
let g:pdv_template_dir = $HOME ."/.local/share/nvim/plugged/pdv/templates_snip"
nmap <Leader>d :call pdv#DocumentWithSnip()<CR>


" Сворачивание кода
lua << EOF

vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = -1
vim.o.foldenable = true

require('ufo').setup({
	provider_selector = function(bufnr, filetype, buftype)
		return {'treesitter', 'indent'}
	end
})
EOF

" Telescope bildings
nnoremap ,ff <cmd>Telescope find_files<cr>
nnoremap ,fg <cmd>Telescope live_grep<cr>

" Telescope fzf plugin
lua << EOF
require('telescope').load_extension('fzf')
EOF

"" JediVim
let g:jedi#environment_path = "/usr/bin/python3"

""autocomplete php ncm2/ncm2
augroup ncm2
  au!
  autocmd BufEnter * call ncm2#enable_for_buffer()
  au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
augroup END

set shortmess+=c

inoremap <c-c> <ESC>
inoremap <silent> <expr> <CR> (pumvisible() ? ncm2_ultisnips#expand_or("\<CR>", 'n') : "\<CR>")
inoremap <expr> <TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<TAB>"

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:ultisnips_php_scalar_types = 1

"" Lsp configure
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'phpactor', 'intelephense', 'ccls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

let g:LanguageClient_serverCommands = {
  \ 'typescript': ['typescript-language-server', '--stdio', '--tsserver-path', '~/usr/local/lib/node/tsserver'],
\ }


" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != btarget
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call <SID>Bclose(<q-bang>, <q-args>)
nnoremap <silent> <Leader>bd :Bclose<CR>


""PHPActor
" context-aware menu with all functions (ALT-m)
nnoremap <m-m> :call phpactor#ContextMenu()<cr>

nnoremap gd :call phpactor#GotoDefinition()<CR>
nnoremap gr :call phpactor#FindReferences()<CR>

" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>
" extract variable
vnoremap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>
nnoremap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>
" extract interface
nnoremap <silent><Leader>rei :call phpactor#ClassInflect()<CR>

let g:phpactor_executable = '~/.local/share/nvim/plugged/phpactor/bin/phpactor'
let g:phpactorPhpBin = "/usr/bin/php8.1"


""Ale
let g:ale_fixers = {
\ 'css': ['stylelint'],
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'php': ['php_cs_fixer'],
\ 'html':['prettier'],
\ 'python':['yapf'],
\}

let g:ale_linters = {
\ 'html': ['htmlhint'],
\ 'css': ['stylelint'],
\ 'javascript':['eslint'],
\ 'scss': ['stylelint'],
\}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

" python-fixer-yapf
" autocmd BufWritePre *.py 0,$!yapf
:nnoremap <leader>y :call Yapf()<cr>

" php-cs-fixer config
command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'
map <c-s> <esc>:w<cr>:Silent php-cs-fixer fix %:p --level=symfony<cr>

let g:ale_php_php_cs_fixer_executable='./vendor/bin/php-cs-fixer'
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

"" HTML CSS
" Emmet
let g:user_emmet_install_global = 1
" autocmd FileType html,css,phtml EmmetInstall

" Emmet Leader Keys
autocmd FileType html,css,phtml,blade.php EmmetInstall

let g:user_emmet_leader_key=','

" Tagalong
let g:tagalong_verbose = 1


"" Coc-Prettier
" Language server stuff
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

"" VimSpector
set packpath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
let g:vimspector_enable_mappings = 'HUMAN'
packadd! vimspector
