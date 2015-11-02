let g:lightline = {
  \   'colorscheme': 'wombat',
  \   'active': {
  \     'left': [ ['mode', 'paste'], ['filename'], ['modified'] ],
  \     'right': [ ['syntastic', 'cursor'], ['percent'], ['filetype', 'branch'] ]
  \   },
  \   'inactive': {
  \     'left': [ ['bufnum', 'filename'], ['modified'] ],
  \     'right': [ ['cursor'], ['percent'], ['filetype', 'branch'] ]
  \   },
  \   'tabline': {
  \     'left': [ ['session', 'cd'], ['curfile'], ['fileencoding', 'fileformat'] ],
  \     'right': [ ['date'], ['spell'], ['alternate'] ]
  \   },
  \   'component': {
  \     'alternate': "%{bufname(0)?'# '.expand('#:p:.'):'no alternate'}",
  \     'cd': "%{'cd '.fnamemodify(getcwd(), ':~')}",
  \     'date': "%{strftime('%a %d %b %H:%M')}",
  \   },
  \   'component_function': {
  \     'branch': 'LLBranch',
  \     'curfile': 'LLCurrentFile',
  \     'cursor': 'LLBufferCursor',
  \     'fileencoding': 'LLFileEncoding',
  \     'fileformat': 'LLFileFormat',
  \     'filename': 'LLFileName',
  \     'filetype': 'LLFileType',
  \     'mode': 'LLBufferMode',
  \     'modified': 'LLBufferModified',
  \     'percent': 'LLBufferPercent',
  \     'readonly': 'LLFileReadOnly',
  \     'session': 'LLSession',
  \   },
  \   'component_expand': {
  \     'syntastic': 'SyntasticStatuslineFlag',
  \   },
  \   'component_type': {
  \     'syntastic': 'error',
  \   },
  \   'separator': { 'left': '', 'right': '' },
  \   'subseparator': { 'left': '', 'right': '' },
  \ }

let g:lightline.mode_map = {
  \   'n': 'N',
  \   'i': 'I',
  \   'R': 'R',
  \   'v': 'V',
  \   'V': 'VL',
  \   'c': 'C',
  \   "\<C-v>": 'VB',
  \   's': 'S',
  \   'S': 'SL',
  \   "\<C-s>": 'SB',
  \   '?': ' '
  \ }

let s:special_filetypes = {
  \   'gitcommit': 'Git',
  \   'help': 'Help',
  \   'startify': 'Startify',
  \   'unite': 'Unite',
  \   'vimfiler': 'VimFiler',
  \ }

function! LLBranch()
  let s = get(s:special_filetypes, &ft, '')
  if (s == '' || s == 'Git') && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

function! LLCurrentFile()
  let s = get(s:special_filetypes, &ft, '')
  return s == '' ? '% '.expand('%:p:.') : s
endfunction

function! LLBufferCursor()
  if &ft == 'vimfiler' | return '' | endif
  return printf('%3d:%-2d', line('.'), col('.'))
endfunction

function! LLBufferMode()
  let s = get(s:special_filetypes, &ft, '')
  return s == '' ? lightline#mode() : s
endfunction

function! LLBufferModified()
  return &ft =~ 'help\|unite\|vimfiler' ? '' : &modified ? '●' : ''
endfunction

function! LLBufferPercent()
  if &ft == 'vimfiler' | return '' | endif
  return printf('%3.0f%%', line('.') * 100.0 / line('$'))
endfunction

function! LLFileEncoding()
  let enc = (strlen(&fenc) ? &fenc : &enc)
  return enc == 'utf-8' ? '' : enc
endfunction

function! LLFileFormat()
  return &fileformat == 'unix' ? '' : &fileformat
endfunction

function! LLFileName()
  let s = get(s:special_filetypes, &ft, '')
  if s != '' && s != 'Help'
    return  s == 'Unite' ? unite#get_status_string() :
          \ s == 'VimFiler' ? vimfiler#get_status_string() :
          \ ''
  endif
  let fname = expand('%:t')
  return LLFileReadOnly() . (fname != '' ? fname : '[No Name]')
endfunction

function! LLFileReadOnly()
  return &readonly ? ' '  : ''
endfunction

function! LLFileType()
  let is_special = get(s:special_filetypes, &ft, '')
  return is_special == '' ? (&ft == '' ? 'no ft' : &ft) : ''
endfunction

function! LLSession()
  return fnamemodify(v:this_session, ':t:r')
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
