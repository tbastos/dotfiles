let g:lightline = {
  \   'colorscheme': 'wombat',
  \   'active': {
  \     'left': [ ['mode', 'paste'], ['filename'], ['modified'] ],
  \     'right': [ ['syntastic', 'cursor'], ['percent'], ['pomodoro', 'branch'] ]
  \   },
  \   'inactive': {
  \     'left': [ ['bufnum', 'filename'], ['modified'] ],
  \     'right': [ ['cursor'], ['percent'], ['branch'] ]
  \   },
  \   'tabline': {
  \     'left': [ ['session', 'cd'], ['curfile']],
  \     'right': [ ['date'], ['spell'], ['fileencoding', 'fileformat'] ]
  \   },
  \   'component': {
  \     'cd': "%{'cd '.fnamemodify(getcwd(), ':~').'/'}",
  \     'date': "%{strftime('%a %d %b %H:%M')}",
  \   },
  \   'component_function': {
  \     'branch': 'LLBranch',
  \     'bufnum': 'LLBufferNumber',
  \     'curfile': 'LLCurrentFile',
  \     'cursor': 'LLBufferCursor',
  \     'fileencoding': 'LLFileEncoding',
  \     'fileformat': 'LLFileFormat',
  \     'filename': 'LLFileName',
  \     'mode': 'LLBufferMode',
  \     'modified': 'LLBufferModified',
  \     'percent': 'LLBufferPercent',
  \     'pomodoro': 'LLPomodoro',
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
  \   'qf': 'QuickFix',
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
  return s == '' ? expand('%:p:.').' ['.&ft.']' : s
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

function! LLBufferNumber()
  let s = get(s:special_filetypes, &ft, '')
  return s == '' ? bufnr('%') : s
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

function! LLSession()
  return fnamemodify(v:this_session, ':t:r')
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A pomodoro timer built into the tab bar

let s:pomodoro_work_mins = 25
let s:pomodoro_rest_mins = 5
let s:pomodoro_work_secs = s:pomodoro_work_mins * 60
let s:pomodoro_rest_secs = s:pomodoro_rest_mins * 60
let s:pomodoro_total_secs = s:pomodoro_work_secs + s:pomodoro_rest_secs
let s:pomodoro_work_file = expand("~/.cache/vim/pomodoro")
let s:pomodoro_rest_file = expand("~/.cache/vim/pomodoro_break")
let s:pomodoro_log_file = expand("~/CloudDocs/Notes/Pomodoro.txt")
let s:pomodoro_alarm_file = "/System/Library/PrivateFrameworks/ToneLibrary.framework/Versions/A/Resources/AlertTones/alarm.caf"

function! PomodoroGet()
  if filereadable(s:pomodoro_work_file)
    let elapsed = localtime() - getftime(s:pomodoro_work_file)
    if elapsed > s:pomodoro_work_secs && !filereadable(s:pomodoro_rest_file)
      silent exe "!touch" s:pomodoro_rest_file
      silent exe "Start! afplay" s:pomodoro_alarm_file
      silent exe "!echo 'Pomodoro completed at ".strftime("%F %T")." (".elapsed/60.":".elapsed%60.")' >> ".s:pomodoro_log_file
    endif
    if elapsed < s:pomodoro_total_secs
      return elapsed
    endif
    call PomodoroStop()
  endif
  return -1
endfunction

function! PomodoroStart()
  call PomodoroStop()
  silent exe "!touch" s:pomodoro_work_file
endfunction

function! PomodoroStop()
  silent exe "!rm -f" s:pomodoro_work_file s:pomodoro_rest_file
endfunction

function! PomodoroToggle()
  if PomodoroGet() < 0
    call PomodoroStart()
  else
    call PomodoroStop()
  end
endfunction

function! LLPomodoro()
  let icon = '☕'
  let left = 0
  let elapsed = PomodoroGet()
  if elapsed != -1
    if elapsed > s:pomodoro_work_secs
      let left = s:pomodoro_total_secs - elapsed
    else
      let icon = '❤ '
      let left = s:pomodoro_work_secs - elapsed
    endif
  endif
  return printf("%s %.2d:%.2d", icon, left/60, left%60)
endfunction

command Pomodoro call PomodoroToggle()
