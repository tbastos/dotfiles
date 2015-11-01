let g:lightline = {
  \   'colorscheme': 'wombat',
  \   'active': {
  \     'left': [ ['mode', 'paste'], ['filename'], ['modified'] ],
  \     'right': [ ['syntastic', 'cursor'], ['percent'], ['fugitive'], ['filetype'] ]
  \   },
  \   'inactive': {
  \     'left': [ ['bufnum', 'filename'], ['modified'] ],
  \     'right': [ ['cursor'], ['percent'], ['fugitive'], ['filetype'] ]
  \   },
  \   'tabline': {
  \     'left': [ ['cd'], ['relativepath'], ['fileencoding', 'fileformat'] ],
  \     'right': [ ['date'], ['spell'] ]
  \   },
  \   'component_function': {
  \     'cd': 'LLCurrentDir',
  \     'cursor': 'LLBufferCursor',
  \     'date': 'LLDate',
  \     'fileencoding': 'LLFileEncoding',
  \     'fileformat': 'LLFileFormat',
  \     'filename': 'LLFileName',
  \     'filetype': 'LLFileType',
  \     'fugitive': 'LLFugitive',
  \     'mode': 'LLBufferMode',
  \     'modified': 'LLBufferModified',
  \     'percent': 'LLBufferPercent',
  \     'readonly': 'LLFileReadOnly',
  \   },
  \   'component_expand': {
  \     'syntastic': 'SyntasticStatuslineFlag',
  \   },
  \   'component_type': {
  \     'syntastic': 'error',
  \   },
  \   'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
  \   'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
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

function! LLCurrentDir()
  return fnamemodify(getcwd(), ":~")
endfunction

function! LLDate()
  return strftime("%a %d %b %H:%M")
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
  return &ft =~ 'help\|unite\|vimfiler' ? '' : &modified ? "\u25CF" : ''
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
  return &readonly ? "\ue0a2 " : ''
endfunction

function! LLFileType()
  let is_special = get(s:special_filetypes, &ft, '')
  return is_special == '' ? (&ft == '' ? 'no ft' : &ft) : ''
endfunction

function! LLFugitive()
  let s = get(s:special_filetypes, &ft, '')
  if (s == '' || s == 'Git') && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? _." \ue0a0" : ''
  endif
  return ''
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
