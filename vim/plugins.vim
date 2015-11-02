" Boilerplate
if neobundle#tap('')
  function! neobundle#hooks.on_source(bundle)
  endfunction
  call neobundle#untap()
endif

" Airline
if neobundle#tap('vim-airline')
  function! neobundle#hooks.on_source(bundle)
    " let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts=1
  endfunction
  call neobundle#untap()
endif

" ChooseWin - jump to another window (with visual selection)
if neobundle#tap('vim-choosewin')
  nmap - <Plug>(choosewin)
  call neobundle#untap()
endif

" ClangFormat
if neobundle#tap('vim-clang-format')
  function! neobundle#hooks.on_source(bundle)
    let g:clang_format#auto_formatexpr = 1
    let g:clang_format#auto_format_on_insert_leave = 1

    let g:clang_format#code_style = "LLVM"
    let g:clang_format#style_options = {
          \ "Language" : "Cpp",
          \ "Standard" : "Cpp11",
          \ "TabWidth" : 2,
          \ "DerivePointerBinding" : "false",
          \ "PointerBindsToType" : "true",
          \ }
  endfunction
  augroup ClangFormat
    au!
    au FileType c,cpp,objc map <buffer><Leader>cf <Plug>(operator-clang-format)
  augroup END
  call neobundle#untap()
endif

" DelimitMate
if neobundle#tap('delimitMate')
  function! neobundle#hooks.on_source(bundle)
    let delimitMate_balance_matchpairs = 1
  endfunction
  call neobundle#untap()
endif

" EasyAlign
if neobundle#tap('vim-easy-align')
  vmap <Enter> <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
  call neobundle#untap()
endif

" Fugitive
if neobundle#tap('vim-fugitive')
  function! neobundle#hooks.on_post_source(bundle)
    doautoall fugitive BufNewFile
    if exists('*lightline#update')
      call lightline#update()
    endif
  endfunction
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
  call neobundle#untap()
endif

" GitGutter
if neobundle#tap('vim-gitgutter')
  function! neobundle#hooks.on_source(bundle)
    let g:gitgutter_enabled = 0
    let g:gitgutter_max_signs = 2048
    let g:gitgutter_sign_column_always = 1
    nmap ]h <Plug>GitGutterNextHunk
    nmap [h <Plug>GitGutterPrevHunk
  endfunction
  nnoremap <LocalLeader>g :GitGutterToggle<CR>
  call neobundle#untap()
endif

" Goyo - Distraction-Free Text Editing
if neobundle#tap('goyo.vim')
  function! neobundle#hooks.on_source(bundle)
    " let g:limelight_default_coefficient = 0.3

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
  endfunction

  nmap <LocalLeader>f :Goyo<CR>
  nmap <LocalLeader>l :Limelight!!<CR>
  nmap <LocalLeader>t :call SetTheme(g:theme_pencil)<CR>:Goyo<CR>

  call neobundle#untap()
endif

" Lightline
if neobundle#tap('lightline.vim')
  let neobundle#hooks.on_source = '~/.vim/lightline.vim'
  call neobundle#untap()
endif

" Markdown
if neobundle#tap('vim-markdown')
  function! neobundle#hooks.on_source(bundle)
    let g:vim_markdown_no_default_key_mappings=1
    let g:vim_markdown_frontmatter=1
  endfunction
  call neobundle#untap()
endif

" Replace
if neobundle#tap('vim-operator-replace')
  " Paste over a text-obj (register 0)
  map <C-p> "0<Plug>(operator-replace)
  call neobundle#untap()
endif

" Sneak
if neobundle#tap('vim-sneak')
  function! neobundle#hooks.on_source(bundle)
    let g:sneak#f_reset = 1
    let g:sneak#t_reset = 1
    let g:sneak#s_next = 1
    let g:sneak#textobject_z = 0
    let g:sneak#use_ic_scs = 0
    let g:sneak#prompt = 'sneak>'
  endfunction
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
  call neobundle#untap()
endif

" Startify
if neobundle#tap('vim-startify')
  function! neobundle#hooks.on_source(bundle)
    let g:startify_enable_special         = 0
    let g:startify_files_number           = 15
    let g:startify_relative_path          = 1
    let g:startify_change_to_vcs_root     = 1
    let g:startify_session_persistence    = 1
    let g:startify_session_delete_buffers = 1

    let g:startify_session_dir = '~/.vim/.session'
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
  endfunction
  call neobundle#untap()
endif

" Surround
if neobundle#tap('vim-operator-surround')
  " Surround operators
  map <silent><C-s><C-a> <Plug>(operator-surround-append)
  map <silent><C-s><C-d> <Plug>(operator-surround-delete)
  map <silent><C-s><C-c> <Plug>(operator-surround-replace)
  " Delete/Change inner-most surround (among quotes, (), {}, [], <>, etc.)
  nmap <silent><C-s><C-d><C-d> <Plug>(operator-surround-delete)<Plug>(textobj-anyblock-a)
  nmap <silent><C-s><C-s> <Plug>(operator-surround-replace)<Plug>(textobj-anyblock-a)
  call neobundle#untap()
endif

" Syntastic
if neobundle#tap('syntastic')
  function! neobundle#hooks.on_source(bundle)
    let g:syntastic_mode_map = {'mode': 'passive'} " we'll call syntastic
    let g:syntastic_check_on_open = 0 " checks are always on write

    let g:syntastic_error_symbol = '✗'
    let g:syntastic_style_error_symbol = '✠'
    let g:syntastic_warning_symbol = '⚠'
    let g:syntastic_style_warning_symbol = '≈'

    " C++ (currently not used; handled by YCM)
    let g:syntastic_cpp_compiler = 'clang'
    let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'

    " Lua
    let g:syntastic_lua_checkers = ["luac", "luacheck"]
    let g:syntastic_lua_luacheck_args = "--no-unused-args"
  endfunction
  augroup AutoSyntastic
    au!
    au BufWritePost *.lua call s:syntastic()
  augroup END
  function! s:syntastic()
    SyntasticCheck
    call lightline#update()
  endfunction
  call neobundle#untap()
endif

" Test
if neobundle#tap('vim-test')
  function! neobundle#hooks.on_source(bundle)
    let test#strategy = "dispatch"
    let test#lua#busted#options = '--output=plainterminal --suppress-pending'
  endfunction
  nmap <silent> <Leader>tn :TestNearest<CR>
  nmap <silent> <Leader>tf :TestFile<CR>
  nmap <silent> <Leader>tt :TestSuite<CR>
  nmap <silent> <Leader>l :TestLast<CR>
  nmap <silent> <Leader>te :TestVisit<CR>
  call neobundle#untap()
endif

" UltiSnips
if neobundle#tap('ultisnips')
  function! neobundle#hooks.on_source(bundle)
    let g:UltiSnipsEditSplit = 'vertical'
    let g:UltiSnipsSnippetsDir = $HOME.'/.vim/ultisnips'
    let g:UltiSnipsSnippetDirectories = [g:UltiSnipsSnippetsDir]
    let g:UltiSnipsEnableSnipMate = 0

    let g:UltiSnipsExpandTrigger = '<C-l>'
    let g:UltiSnipsJumpForwardTrigger = '<C-l>'
    let g:UltiSnipsJumpBackwardTrigger = '<C-h>'
  endfunction
  nnoremap <LocalLeader>s :UltiSnipsEdit<CR>
  call neobundle#untap()
endif

" Unite
if neobundle#tap('unite.vim')
  function! neobundle#hooks.on_source(bundle)
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
      let g:unite_source_grep_default_opts = '--line-numbers --nocolor --nogroup'
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
    let g:neomru#file_mru_path = GetCacheDir('neomru/file')
    let g:neomru#directory_mru_path = GetCacheDir('neomru/directory')
  endfunction

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
endif

" VimFiler
if neobundle#tap('vimfiler.vim')
  function! neobundle#hooks.on_source(bundle)
    let g:vimfiler_as_default_explorer = 1
    let g:vimfiler_data_directory = GetCacheDir('vimfiler')
    let g:vimfiler_time_format = "%Y-%m-%d  %H:%M:%S"
    let g:vimfiler_tree_leaf_icon = ' '
    let g:vimfiler_tree_opened_icon = '▾'
    let g:vimfiler_tree_closed_icon = '▸'
    let g:vimfiler_marked_file_icon = '*'
  endfunction
  nnoremap <silent> <S-Tab> :VimFilerExplorer -no-toggle<CR>
  call neobundle#untap()
endif

" YouCompleteMe
if neobundle#tap('YouCompleteMe')
  function! neobundle#hooks.on_source(bundle)
    let g:ycm_allow_changing_updatetime = 0
    let g:ycm_key_list_select_completion   = ['<Tab>', '<C-J>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-Tab>', '<C-K>', '<Up>']
    let g:ycm_key_detailed_diagnostics = '<LocalLeader>y'
  endfunction
  " Jump to definition or declaration of symbol under cursor
  nnoremap <silent> <Leader>j :YcmCompleter GoTo<CR>
  " Inspect type of var under cursor
  nnoremap <silent> <Leader>i :YcmCompleter GetType<CR>
  " Display help about the identifier under the cursor
  nnoremap <silent> <Leader>h :YcmCompleter GetDoc<CR>
  call neobundle#untap()
endif

