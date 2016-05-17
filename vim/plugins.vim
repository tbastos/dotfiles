" Colors
Plug 'jwhitley/vim-colors-solarized' " solarized fork that fixes sign column bg
Plug 'reedes/vim-colors-pencil'

" General
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'ciaranm/securemodelines'

" Shell
Plug 'tpope/vim-eunuch', {'on': ['Remove', 'Move', 'Rename', 'Mkdir']}
Plug 'tpope/vim-dispatch', {'on': ['Dispatch', 'Dispatch!', 'Make', 'Make!', 'Start', 'Start!','Copen', 'Copen!', 'FocusDispatch']}
Plug 'tyru/open-browser.vim'

" UI
Plug 'moll/vim-bbye', {'on': 'Bdelete'}
Plug 't9md/vim-choosewin', {'on': '<Plug>(choosewin)'}
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'regedarek/ZoomWin' " zoom in/out a split with <C-w>o
Plug 'kergoth/vim-hilinks', {'on': ['HLT', 'HLT!']} " debug syntax highlighting

" Search and Navigation
Plug 'matchit.zip'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite-help'
Plug 'Shougo/unite-outline'
Plug 'tsukkee/unite-tag'

" Text Objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line' " al, il (line)
Plug 'kana/vim-textobj-entire' " ae, ie (whole buffer)
Plug 'saaguero/vim-textobj-pastedtext' " gb (last pasted text)
Plug 'kana/vim-textobj-lastpat' " a/, i/, a?, i? (last search pattern, fwd/backwars)
Plug 'kana/vim-textobj-indent' " ai, ii, aI, iI (lines with indent >= cur line)
Plug 'beloglazov/vim-textobj-quotes' " aq, iq (nearest quotes of any kind)
Plug 'rhysd/vim-textobj-anyblock' " ab  ib  (quotes, (), {}, [] and <>)
Plug 'kana/vim-textobj-function' " af, if (function in C, Java, VimL, JS)
Plug 'thinca/vim-textobj-function-javascript' "
Plug 'sgur/vim-textobj-parameter' " a, i (parameter in a comma-delimited lists)
Plug 'glts/vim-textobj-comment' " ac, ic (comment)
Plug 'Julian/vim-textobj-variable-segment' " av, iv (a_segment_of anyVarName)

" Editing and Formatting
Plug 'godlygeek/tabular', {'on': 'Tabularize'}
Plug 'tpope/vim-endwise' " auto-closes control blocks in insert mode
Plug 'tpope/vim-commentary' " toggle comments with gc{textobj}
Plug 'tpope/vim-abolish', {'on': ['Abolish', 'Subvert']} " search/replace text transforms
" VarName transforms: crs to_snake, crm ToMixed, crc toCamel, cru TO_UPPERCASE

Plug 'kana/vim-operator-user'
Plug 'terryma/vim-multiple-cursors' " <C-n> creates multiple cursors in normal mode

" C, C++
Plug 'jeaye/color_coded', {'do': 'cmake . && make && make install'}

" JavaScript
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'marijnh/tern_for_vim', {'for': 'javascript', 'do': 'npm install'}
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}
Plug 'elzr/vim-json', {'for': ['javascript', 'json']}

" Lua
Plug 'tbastos/vim-lua', {'for': 'lua', 'frozen': 1}

" OpenGL
Plug 'tikhomirov/vim-glsl', {'for': 'glsl'}

" Text / Markup / Web
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'kannokanno/previm', {'on': 'PrevimOpen'}
Plug 'othree/html5.vim', {'for': 'html'}
Plug 'ap/vim-css-color', {'for': ['css','scss','sass','less']}
Plug 'hail2u/vim-css3-syntax', {'for': ['css','scss','sass']}

"
" More plugins, with configs, in alphabetical order
"

" ClangFormat
Plug 'rhysd/vim-clang-format', {'for': ['c', 'cpp'],
      \ 'on': ['ClangFormat', 'ClangFormatAutoToggle', '<Plug>(operator-clang-format)']}
let g:clang_format#auto_format = 1
let g:clang_format#auto_formatexpr = 1
let g:clang_format#auto_format_on_insert_leave = 0 " interferes with indenting of {<CR>
let g:clang_format#code_style = "LLVM"
let g:clang_format#style_options = {
      \ "AlwaysBreakTemplateDeclarations" : "true",
      \ "AllowShortFunctionsOnASingleLine": "Inline",
      \ "DerivePointerBinding" : "false",
      \ "Language" : "Cpp",
      \ "PointerBindsToType" : "true",
      \ "Standard" : "C++11",
      \ "TabWidth" : 2,
      \ }
augroup ClangFormat
  au!
  au FileType c,cpp
        \ setlocal textwidth=0 |
        \ map <buffer><Leader>F <Plug>(operator-clang-format)
augroup END


" DelimitMate - auto-closes quotes, parens, etc. in insert mode
Plug 'Raimondi/delimitMate'
let g:delimitMate_balance_matchpairs = 1
let g:delimitMate_expand_cr = 1


" EasyAlign
Plug 'junegunn/vim-easy-align', {'on': '<Plug>(EasyAlign)'}
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


" Fugitive
Plug 'tpope/vim-fugitive'
doautoall fugitive BufNewFile
if exists('*lightline#update')
  call lightline#update()
endif
nnoremap <Leader>ga :Git add %:p<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit -v -q<CR>
nnoremap <Leader>gt :Gcommit -v -q %:p<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR><CR>
nnoremap <Leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <Leader>gg :Ggrep<Space>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>go :Git checkout<Space>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gP :Gpull<CR>
nnoremap <Leader>gh :Gbrowse<CR>


" GitGutter
Plug 'airblade/vim-gitgutter', {'on': ['GitGutterToggle']}
let g:gitgutter_enabled = 0
let g:gitgutter_max_signs = 2048
let g:gitgutter_sign_column_always = 1
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nnoremap <LocalLeader>g :GitGutterToggle<CR>


" Goyo - distraction-free text editing
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
function! s:goyo_enter()
  " Limelight
endfunction
function! s:goyo_leave()
  " Limelight!
  call SetTheme(g:theme_default)
endfunction
autocmd! User GoyoEnter
autocmd  User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave
autocmd  User GoyoLeave nested call <SID>goyo_leave()
nmap <LocalLeader>f :Goyo<CR>
nmap <LocalLeader>t :call SetTheme(g:theme_pencil)<CR>:Goyo<CR>


" Lightline - status bar
Plug 'itchyny/lightline.vim'
source ~/.vim/lightline.vim


" Limelight - focused writing
Plug 'junegunn/limelight.vim', {'on': 'Limelight'}
nmap <LocalLeader>l :Limelight!!<CR>


" Markdown
Plug 'rcmdnk/vim-markdown', {'for': 'markdown'}
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_frontmatter=1


" Replace - <C-p> pastes register 0 over a text-obj
Plug 'kana/vim-operator-replace'
map <C-p> "0<Plug>(operator-replace)


" Sneak
Plug 'justinmk/vim-sneak', {'on': '<Plug>Sneak'}
let g:sneak#f_reset = 1
let g:sneak#t_reset = 1
let g:sneak#s_next = 1
let g:sneak#textobject_z = 0
let g:sneak#use_ic_scs = 0
let g:sneak#prompt = 'sneak>'
" 2-character Sneak
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S
xmap s <Plug>Sneak_s
xmap S <Plug>Sneak_S
omap s <Plug>Sneak_s
omap S <Plug>Sneak_S
" 1-character enhanced f (renders ; unnecessary)
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
" 1-character enhanced t (renders ; unnecessary)
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T


" Startify
Plug 'mhinz/vim-startify'
let g:startify_enable_special         = 0
let g:startify_enable_unsafe          = 1
let g:startify_files_number           = 15
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 1
let g:startify_change_to_vcs_root     = 1
let g:startify_session_persistence    = 1
let g:startify_session_delete_buffers = 1

let g:startify_session_dir = '~/.local/share/vim/session'
let g:startify_bookmarks = [ '~/.dotfiles/vim/vimrc' ]

let g:startify_list_order = [
      \ ['  Bookmarks:'],
      \ 'bookmarks',
      \ ['  Sessions:'],
      \ 'sessions',
      \ ['  Recent files:'],
      \ 'files',
      \ ]

let g:startify_custom_indices =
      \ map(range(0,9), 'string(v:val)') +
      \ map(range(char2nr('A'),char2nr('Z')), 'nr2char(v:val)')

let g:startify_custom_header =
      \ map(split(system('figlet Welcome'), '\n'), '"   ". v:val') + ['','']


" Surround
Plug 'rhysd/vim-operator-surround'
" Surround operators
map <silent><C-s><C-a> <Plug>(operator-surround-append)
map <silent><C-s><C-d> <Plug>(operator-surround-delete)
map <silent><C-s><C-c> <Plug>(operator-surround-replace)
" Delete/Change inner-most surround (among quotes, (), {}, [], <>, etc.)
nmap <silent><C-s><C-d><C-d> <Plug>(operator-surround-delete)<Plug>(textobj-anyblock-a)
nmap <silent><C-s><C-s> <Plug>(operator-surround-replace)<Plug>(textobj-anyblock-a)

" Syntastic
Plug 'scrooloose/syntastic', {'on': ['SyntasticCheck', 'SyntasticStatuslineFlag', 'SyntasticToggleMode', 'SyntasticInfo']}
let g:syntastic_mode_map = {'mode': 'passive'} " we'll call syntastic
let g:syntastic_check_on_open = 0 " checks are always on write
let g:syntastic_auto_loc_list = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_stl_format = '%E{Error(%e)  %fe}%B{, }%W{Warning(%w)  %fw}'
let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '✠'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '≈'
" Lua
let g:syntastic_lua_checkers = ["luac", "luacheck"]
let g:syntastic_lua_luacheck_args = "--no-unused-args"
augroup AutoSyntastic
  au!
  au BufWritePost *.lua call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

" Test
Plug 'janko-m/vim-test', {'on': ['TestNearest', 'TestFile', 'TestSuite', 'TestLast', 'TestVisit']}
let g:test#strategy = "dispatch"
let g:test#lua#busted#options = '--output=plainterminal --suppress-pending'
nmap <silent> <Leader>tn :TestNearest<CR>
nmap <silent> <Leader>tf :TestFile<CR>
nmap <silent> <Leader>tt :TestSuite<CR>
nmap <silent> <Leader>l :TestLast<CR>
nmap <silent> <Leader>te :TestVisit<CR>

" UltiSnips
Plug 'SirVer/ultisnips'
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetsDir = $HOME.'/.vim/ultisnips'
let g:UltiSnipsSnippetDirectories = [g:UltiSnipsSnippetsDir]
let g:UltiSnipsEnableSnipMate = 0
let g:UltiSnipsExpandTrigger = '<C-l>'
let g:UltiSnipsJumpForwardTrigger = '<C-l>'
let g:UltiSnipsJumpBackwardTrigger = '<C-h>'
" Helper functions for snippets
function! CurrentLuaClass()
  let pattern = '^local \zs\i*\ze ='
  let line = search(pattern, 'bnW')
  return line == 0 ? '' : matchstr(getline(line), pattern).':'
endfunction
augroup UltiSnipsFileType
  au!
  au FileType * call UltiSnips#FileTypeChanged()
augroup END
nnoremap <LocalLeader>s :UltiSnipsEdit<CR>

" Unite
" Fuzzy match by default
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
" Fuzzy matching for plugins not using matcher_default as filter
call unite#custom#source('outline,line,grep', 'matchers', ['matcher_fuzzy'])
call unite#custom#source('outline,line,grep', 'sorters', ['sorter_rank'])
" Prettier prompt
call unite#custom#profile('default', 'context', {
      \   'start_insert': 1,
      \   'direction': 'botright',
      \   'prompt': '» ',
      \   'prompt_direction': 'top',
      \   'auto_resize': 0,
      \ })
" Better time formats
let g:unite_source_buffer_time_format = "%Y-%m-%d  %H:%M:%S "
let g:unite_data_directory=GetCacheDir('unite')
let g:unite_source_history_yank_enable=1
let g:unite_source_rec_max_cache_files=5000
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--line-numbers --nocolor --nogroup --hidden'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_rec_async_command =
        \ ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
elseif executable('ack')
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a -w'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_rec_async_command = ['ack', '-f', '--nofilter']
endif
" Custom mappings unite buffers
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Backspace also closes in normal mode
  nmap <buffer> <BS> q
  " Use Ctrl-J/K to select row in insert mode
  imap <buffer> <C-j> <C-n>
  imap <buffer> <C-k> <C-p>
  nmap <buffer> <C-j> <C-n>
  nmap <buffer> <C-k> <C-p>
  " Clear cache / redraw
  imap <buffer> <C-a> <Plug>(unite_redraw)
  nmap <buffer> <C-a> <Plug>(unite_redraw)
endfunction
let g:neomru#file_mru_limit = 100
let g:neomru#file_mru_path = GetCacheDir('mru_files')
let g:neomru#directory_mru_path = GetCacheDir('mru_dirs')
" Map space to the prefix for Unite
nnoremap [unite] <Nop>
nmap <space> [unite]
" Resume the last Unite (in normal mode, to preserve selection)
nnoremap <silent> [unite]<space> :<C-u>UniteResume -no-start-insert<CR>
" Search everything (files)
nnoremap <silent> [unite]e :<C-u>Unite -buffer-name=files buffer file_mru bookmark file_rec/async<CR>
" Search registers
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
" Search files to Switch to (buffers, recent files)
nnoremap <silent> [unite]s :<C-u>Unite -buffer-name=files buffer file_mru<CR>
" Search snippets for insertion
nnoremap <silent> [unite]i :<C-u>Unite -buffer-name=ultisnips ultisnips<CR>
" Search the outline
nnoremap <silent> [unite]o :<C-u>Unite -buffer-name=outline -vertical -no-auto-resize outline<CR>
" Search tags
nnoremap <silent> [unite]t :<C-u>Unite -buffer-name=tags tag<CR>
" Search a directory to change to
nnoremap <silent> [unite]d :<C-u>Unite -buffer-name=change-cwd -default-action=cd directory_mru directory_rec/async<CR>
" Search files
nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file_rec/async<CR>
" Grep (using Ag) from the cwd
nnoremap <silent> [unite]g :<C-u>Unite -buffer-name=grep grep:.<CR>
" Search help contents
nnoremap <silent> [unite]h :<C-u>Unite -buffer-name=help help<CR>
" Search current buffer for a line to jump to
nnoremap <silent> [unite]j :<C-u>Unite -buffer-name=lines line<CR>
" Search bookmarks
nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=bookmarks bookmark<CR>
" Search commands
nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=command -default-action=edit command<CR>
" Search lazy plugins to be loaded
nnoremap <silent> [unite]l :<C-u>Unite -buffer-name=plugins neobundle/lazy<CR>
" Search all Unite sources
nnoremap <silent> [unite]u :<C-u>Unite -buffer-name=sources source<CR>

" VimFiler
Plug 'Shougo/vimfiler.vim', {'on': ['VimFiler', 'VimFilerExplorer']}
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_data_directory = GetCacheDir('vimfiler')
let g:vimfiler_time_format = "%Y-%m-%d  %H:%M:%S"
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_marked_file_icon = '*'
nnoremap <silent> <S-Tab> :VimFilerExplorer -no-toggle<CR>

" YouCompleteMe
Plug 'Valloric/YouCompleteMe', {'for': ['c', 'cpp'],
      \ 'do': './install.py --clang-completer --system-boost'}
autocmd! User YouCompleteMe if !has('vim_starting') | call youcompleteme#Enable() | endif
let g:ycm_allow_changing_updatetime = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_extra_conf_globlist = ['~/Work/*']
let g:ycm_key_list_select_completion   = ['<Tab>', '<C-J>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-Tab>', '<C-K>', '<Up>']
let g:ycm_key_detailed_diagnostics = '<LocalLeader>y'
let g:ycm_filetype_blacklist = {
      \ 'infolog' : 1,
      \ 'mail' : 1,
      \ 'notes' : 1,
      \ 'pandoc' : 1,
      \ 'qf' : 1,
      \ 'tagbar' : 1,
      \ 'unite' : 1,
      \ 'vimwiki' : 1,
      \}
" Jump to definition or declaration of symbol under cursor
nnoremap <silent> <Leader>j :YcmCompleter GoTo<CR>
" Inspect type of var under cursor
nnoremap <silent> <Leader>i :YcmCompleter GetType<CR>
" Display help about the identifier under the cursor
nnoremap <silent> <Leader>h :YcmCompleter GetDoc<CR>

