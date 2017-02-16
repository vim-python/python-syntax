" For version 5.x: Clear all syntax items
" For versions greater than 6.x: Quit when a syntax file was already loaded
if v:version < 600
  syntax clear
elseif exists('b:current_syntax')
  finish
endif

"
" Commands
"
command! -buffer Python2Syntax let b:python_version_2 = 1 | let &syntax=&syntax
command! -buffer Python3Syntax let b:python_version_2 = 0 | let &syntax=&syntax

" Enable option if it's not defined
function! s:EnableByDefault(name)
  if !exists(a:name)
    let {a:name} = 1
  endif
endfunction

" Check if option is enabled
function! s:Enabled(name)
  return exists(a:name) && {a:name}
endfunction

" Is it Python 2 syntax?
function! s:Python2Syntax()
  if exists('b:python_version_2')
      return b:python_version_2
  endif
  return s:Enabled('g:python_version_2')
endfunction

"
" Default options
"

call s:EnableByDefault('g:python_slow_sync')

if s:Enabled('g:python_highlight_all')
  call s:EnableByDefault('g:python_highlight_builtins')
  if s:Enabled('g:python_highlight_builtins')
    call s:EnableByDefault('g:python_highlight_builtin_objs')
    call s:EnableByDefault('g:python_highlight_builtin_funcs')
  endif
  call s:EnableByDefault('g:python_highlight_exceptions')
  call s:EnableByDefault('g:python_highlight_string_formatting')
  call s:EnableByDefault('g:python_highlight_string_format')
  call s:EnableByDefault('g:python_highlight_string_templates')
  call s:EnableByDefault('g:python_highlight_indent_errors')
  call s:EnableByDefault('g:python_highlight_space_errors')
  call s:EnableByDefault('g:python_highlight_doctests')
  call s:EnableByDefault('g:python_print_as_function')
endif

"
" Keywords
"

syn keyword pythonInstanceVariable self
syn keyword pythonClassVaraible cls
syn keyword pythonStatement     break continue del
syn keyword pythonStatement     exec return
syn keyword pythonStatement     pass yield
syn keyword pythonStatement     raise nextgroup=pythonIdentifier,pythonExClass skipwhite
syn keyword pythonStatement     global assert
syn keyword pythonStatement     lambda
syn keyword pythonStatement     with
syn keyword pythonStatement     def class nextgroup=pythonFunction skipwhite
syn keyword pythonRepeat        for while
syn keyword pythonConditional   if elif else
" The standard pyrex.vim unconditionally removes the pythonInclude group, so
" we provide a dummy group here to avoid crashing pyrex.vim.
syn keyword pythonException     try except finally
syn keyword pythonOperator      and in is not or
syn match pythonStatement       '\s*\([.,]\)\@<!\<yield\>'
syn keyword pythonInclude       import
syn keyword pythonImport        import
syn match pythonIdentifier      '\v[a-zA-Z_][a-zA-Z0-9_]*' nextgroup=FunctionParameters
syn match pythonRaiseFromStatement      'from\>'
syn match pythonImport          '^\s*\zsfrom\>'



if s:Python2Syntax()
  if !s:Enabled('g:python_print_as_function')
    syn keyword pythonStatement  print
  endif
  syn keyword pythonImport      as
  syn match   pythonFunction    '[a-zA-Z_][a-zA-Z0-9_]*' nextgroup=FunctionParameters display contained
else
  syn keyword pythonStatement   as nonlocal
  syn match   pythonStatement   '\v(\.)@<!<await>'
  syn match   pythonFunction    '[a-zA-Z_][a-zA-Z0-9_]*' nextgroup=FunctionParameters display contained
  syn match   pythonStatement   '\<async\s\+def\>' nextgroup=pythonFunction skipwhite
  syn match   pythonStatement   '\<async\s\+with\>'
  syn match   pythonStatement   '\<async\s\+for\>'
endif

syn region FunctionParameters start='(\zs' end='\ze)' display contains=
            \ FunctionParameters,
            \ OptionalParameters,
            \ pythonRepeat,
            \ pythonInstanceVariable,
            \ pythonClassVaraible,
            \ pythonConditional,
            \ pythonComment,
            \ pythonOperator,
            \ pythonNumber,
            \ pythonNumberError,
            \ pythonFloat,
            \ pythonHexNumber,
            \ pythonStatement,
            \ pythonOctNumber,
            \ pythonString,
            \ pythonRawString,
            \ pythonUniString,
            \ pythonExClass,
            \ pythonUniRawString,
            \ pythonNumber,
            \ pythonRawString,
            \ pythonBytes,
            \ pythonBuiltinObj,
            \ pythonNone,
            \ pythonBuiltinFunc,
            \ pythonBoolean nextgroup=pythonRaiseFromStatement display contained
syn match OptionalParameters /\i*\ze=/ display contained
"
" Decorators (new in Python 2.4)
"

syn match   pythonDecorator    '@' display nextgroup=pythonDottedName skipwhite
if s:Python2Syntax()
  syn match   pythonDottedName '[a-zA-Z_][a-zA-Z0-9_]*\%(\.[a-zA-Z_][a-zA-Z0-9_]*\)*' display contained nextgroup=FunctionParameters
else
  syn match   pythonDottedName '\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\%(\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\)*' display contained nextgroup=FunctionParameters
endif
syn match   pythonDot        '\.' display containedin=pythonDottedName

"
" Comments
"

syn match   pythonComment       '#.*$' display contains=pythonTodo,@Spell
if !s:Enabled('g:python_highlight_file_headers_as_comments')
  syn match   pythonRun         '\%^#!.*$'
  syn match   pythonCoding      '\%^.*\%(\n.*\)\?#.*coding[:=]\s*[0-9A-Za-z-_.]\+.*$'
endif
syn keyword pythonTodo          TODO FIXME XXX contained

"
" Errors
"

syn match pythonError           '\<\d\+\D\+\>' display
syn match pythonError           '[$?]' display
syn match pythonError           '[&|]\{2,}' display
syn match pythonError           '[=]\{3,}' display

" Mixing spaces and tabs also may be used for pretty formatting multiline
" statements
if s:Enabled('g:python_highlight_indent_errors')
  syn match pythonIndentError   '^\s*\%( \t\|\t \)\s*\S'me=e-1 display
endif

" Trailing space errors
if s:Enabled('g:python_highlight_space_errors')
  syn match pythonSpaceError    '\s\+$' display
endif

"
" Strings
"

if s:Python2Syntax()
  " Python 2 strings
  syn region pythonString   start=+[bB]\='+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
  syn region pythonString   start=+[bB]\='+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
  syn region pythonString   start=+[bB]\="+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
  syn region pythonString   start=+[bB]\="""+ end=+"""+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest2,pythonSpaceError,@Spell
  syn region pythonString   start=+[bB]\='''+ end=+'''+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest,pythonSpaceError,@Spell
else
  " Python 3 byte strings
  syn region pythonBytes    start=+[bB]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonBytesError,pythonBytesContent,@Spell
  syn region pythonBytes    start=+[bB]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonBytesError,pythonBytesContent,@Spell
  syn region pythonBytes    start=+[bB]"""+ end=+"""+ keepend contains=pythonBytesError,pythonBytesContent,pythonDocTest2,pythonSpaceError,@Spell
  syn region pythonBytes    start=+[bB]'''+ end=+'''+ keepend contains=pythonBytesError,pythonBytesContent,pythonDocTest,pythonSpaceError,@Spell

  syn match pythonBytesError    '.\+' display contained
  syn match pythonBytesContent  '[\u0000-\u00ff]\+' display contained contains=pythonBytesEscape,pythonBytesEscapeError
endif

syn match pythonBytesEscape       +\\[abfnrtv'"\\]+ display contained
syn match pythonBytesEscape       '\\\o\o\=\o\=' display contained
syn match pythonBytesEscapeError  '\\\o\{,2}[89]' display contained
syn match pythonBytesEscape       '\\x\x\{2}' display contained
syn match pythonBytesEscapeError  '\\x\x\=\X' display contained
syn match pythonBytesEscape       '\\$'

syn match pythonUniEscape         '\\u\x\{4}' display contained
syn match pythonUniEscapeError    '\\u\x\{,3}\X' display contained
syn match pythonUniEscape         '\\U\x\{8}' display contained
syn match pythonUniEscapeError    '\\U\x\{,7}\X' display contained
syn match pythonUniEscape         '\\N{[A-Z ]\+}' display contained
syn match pythonUniEscapeError    '\\N{[^A-Z ]\+}' display contained

if s:Python2Syntax()
  " Python 2 Unicode strings
  syn region pythonUniString  start=+[uU]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
  syn region pythonUniString  start=+[uU]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
  syn region pythonUniString  start=+[uU]"""+ end=+"""+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest2,pythonSpaceError,@Spell
  syn region pythonUniString  start=+[uU]'''+ end=+'''+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest,pythonSpaceError,@Spell
else
  " Python 3 strings
  syn region pythonString   start=+f\?'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
  syn region pythonString   start=+f\?"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
  syn region pythonString   start=+f\?"""+ end=+"""+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest2,pythonSpaceError,@Spell
  syn region pythonString   start=+f\?'''+ end=+'''+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest,pythonSpaceError,@Spell
endif

if s:Python2Syntax()
  " Python 2 Unicode raw strings
  syn region pythonUniRawString start=+[uU][rR]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,pythonUniRawEscape,pythonUniRawEscapeError,@Spell
  syn region pythonUniRawString start=+[uU][rR]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,pythonUniRawEscape,pythonUniRawEscapeError,@Spell
  syn region pythonUniRawString start=+[uU][rR]"""+ end=+"""+ keepend contains=pythonUniRawEscape,pythonUniRawEscapeError,pythonDocTest2,pythonSpaceError,@Spell
  syn region pythonUniRawString start=+[uU][rR]'''+ end=+'''+ keepend contains=pythonUniRawEscape,pythonUniRawEscapeError,pythonDocTest,pythonSpaceError,@Spell

  syn match  pythonUniRawEscape       '\([^\\]\(\\\\\)*\)\@<=\\u\x\{4}' display contained
  syn match  pythonUniRawEscapeError  '\([^\\]\(\\\\\)*\)\@<=\\u\x\{,3}\X' display contained
endif

" Python 2/3 raw strings
if s:Python2Syntax()
  syn region pythonRawString  start=+[bB]\=[rR]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,@Spell
  syn region pythonRawString  start=+[bB]\=[rR]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,@Spell
  syn region pythonRawString  start=+[bB]\=[rR]"""+ end=+"""+ keepend contains=pythonDocTest2,pythonSpaceError,@Spell
  syn region pythonRawString  start=+[bB]\=[rR]'''+ end=+'''+ keepend contains=pythonDocTest,pythonSpaceError,@Spell
else
  syn region pythonRawString  start=+[rR]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,@Spell
  syn region pythonRawString  start=+[rR]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,@Spell
  syn region pythonRawString  start=+[rR]"""+ end=+"""+ keepend contains=pythonDocTest2,pythonSpaceError,@Spell
  syn region pythonRawString  start=+[rR]'''+ end=+'''+ keepend contains=pythonDocTest,pythonSpaceError,@Spell

  syn region pythonRawBytes  start=+[bB][rR]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,@Spell
  syn region pythonRawBytes  start=+[bB][rR]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,@Spell
  syn region pythonRawBytes  start=+[bB][rR]"""+ end=+"""+ keepend contains=pythonDocTest2,pythonSpaceError,@Spell
  syn region pythonRawBytes  start=+[bB][rR]'''+ end=+'''+ keepend contains=pythonDocTest,pythonSpaceError,@Spell
endif

syn match pythonRawEscape +\\['"]+ display transparent contained

if s:Enabled('g:python_highlight_string_formatting')
  " % operator string formatting
  if s:Python2Syntax()
    syn match pythonStrFormatting '%\%(([^)]\+)\)\=[-#0 +]*\d*\%(\.\d\+\)\=[hlL]\=[diouxXeEfFgGcrs%]' contained containedin=pythonString,pythonUniString,pythonUniRawString,pythonRawString
    syn match pythonStrFormatting '%[-#0 +]*\%(\*\|\d\+\)\=\%(\.\%(\*\|\d\+\)\)\=[hlL]\=[diouxXeEfFgGcrs%]' contained containedin=pythonString,pythonUniString,pythonUniRawString,pythonRawString
  else
    syn match pythonStrFormatting '%\%(([^)]\+)\)\=[-#0 +]*\d*\%(\.\d\+\)\=[hlL]\=[diouxXeEfFgGcrs%]' contained containedin=pythonString,pythonRawString
    syn match pythonStrFormatting '%[-#0 +]*\%(\*\|\d\+\)\=\%(\.\%(\*\|\d\+\)\)\=[hlL]\=[diouxXeEfFgGcrs%]' contained containedin=pythonString,pythonRawString
  endif
endif

if s:Enabled('g:python_highlight_string_format')
  " str.format syntax
  if s:Python2Syntax()
    syn match pythonStrFormat '{{\|}}' contained containedin=pythonString,pythonUniString,pythonUniRawString,pythonRawString
    syn match pythonStrFormat '{\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)\=\%(\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\[\%(\d\+\|[^!:\}]\+\)\]\)*\%(![rsa]\)\=\%(:\%({\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)}\|\%([^}]\=[<>=^]\)\=[ +-]\=#\=0\=\d*,\=\%(\.\d\+\)\=[bcdeEfFgGnosxX%]\=\)\=\)\=}' contained containedin=pythonString,pythonUniString,pythonUniRawString,pythonRawString
  else
    syn match pythonStrFormat '{{\|}}' contained containedin=pythonString,pythonRawString
    syn match pythonStrFormat '{\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)\=\%(\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\[\%(\d\+\|[^!:\}]\+\)\]\)*\%(![rsa]\)\=\%(:\%({\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)}\|\%([^}]\=[<>=^]\)\=[ +-]\=#\=0\=\d*,\=\%(\.\d\+\)\=[bcdeEfFgGnosxX%]\=\)\=\)\=}' contained containedin=pythonString,pythonRawString
  endif
endif

if s:Enabled('g:python_highlight_string_templates')
  " string.Template format
  if s:Python2Syntax()
    syn match pythonStrTemplate '\$\$' contained containedin=pythonString,pythonUniString,pythonUniRawString,pythonRawString
    syn match pythonStrTemplate '\${[a-zA-Z_][a-zA-Z0-9_]*}' contained containedin=pythonString,pythonUniString,pythonUniRawString,pythonRawString
    syn match pythonStrTemplate '\$[a-zA-Z_][a-zA-Z0-9_]*' contained containedin=pythonString,pythonUniString,pythonUniRawString,pythonRawString
  else
    syn match pythonStrTemplate '\$\$' contained containedin=pythonString,pythonRawString
    syn match pythonStrTemplate '\${[a-zA-Z_][a-zA-Z0-9_]*}' contained containedin=pythonString,pythonRawString
    syn match pythonStrTemplate '\$[a-zA-Z_][a-zA-Z0-9_]*' contained containedin=pythonString,pythonRawString
  endif
endif

if s:Enabled('g:python_highlight_doctests')
  " DocTests
  syn region pythonDocTest   start='^\s*>>>' end=+'''+he=s-1 end='^\s*$' contained
  syn region pythonDocTest2  start='^\s*>>>' end=+"""+he=s-1 end='^\s*$' contained
endif

"
" Numbers (ints, longs, floats, complex)
"

if s:Python2Syntax()
  syn match   pythonHexError '\<0[xX]\x*[g-zG-Z]\+\x*[lL]\=\>' display
  syn match   pythonOctError '\<0[oO]\=\o*\D\+\d*[lL]\=\>' display
  syn match   pythonBinError '\<0[bB][01]*\D\+\d*[lL]\=\>' display

  syn match   pythonHexNumber '\<0[xX]\x\+[lL]\=\>' display
  syn match   pythonOctNumber '\<0[oO]\o\+[lL]\=\>' display
  syn match   pythonBinNumber '\<0[bB][01]\+[lL]\=\>' display

  syn match   pythonNumberError '\<\d\+\D[lL]\=\>' display
  syn match   pythonNumber      '\<\d[lL]\=\>' display
  syn match   pythonNumber      '\<[0-9]\d\+[lL]\=\>' display
  syn match   pythonNumber      '\<\d\+[lLjJ]\>' display

  syn match   pythonOctError '\<0[oO]\=\o*[8-9]\d*[lL]\=\>' display
  syn match   pythonBinError '\<0[bB][01]*[2-9]\d*[lL]\=\>' display
else
  syn match   pythonHexError '\<0[xX]\x*[g-zG-Z]\x*\>' display
  syn match   pythonOctError '\<0[oO]\=\o*\D\+\d*\>' display
  syn match   pythonBinError '\<0[bB][01]*\D\+\d*\>' display

  syn match   pythonHexNumber '\<0[xX]\x\+\>' display
  syn match   pythonOctNumber '\<0[oO]\o\+\>' display
  syn match   pythonBinNumber '\<0[bB][01]\+\>' display

  syn match   pythonNumberError '\<\d\+\D\>' display
  syn match   pythonNumberError '\<0\d\+\>' display
  syn match   pythonNumber      '\<\d\>' display
  syn match   pythonNumber      '\<[1-9]\d\+\>' display
  syn match   pythonNumber      '\<\d\+[jJ]\>' display

  syn match   pythonOctError '\<0[oO]\=\o*[8-9]\d*\>' display
  syn match   pythonBinError '\<0[bB][01]*[2-9]\d*\>' display
endif

syn match   pythonFloat '\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>' display
syn match   pythonFloat '\<\d\+[eE][+-]\=\d\+[jJ]\=\>' display
syn match   pythonFloat '\<\d\+\.\d*\%([eE][+-]\=\d\+\)\=[jJ]\=' display

"
" Builtin objects and types
"

if s:Enabled('g:python_highlight_builtin_objs')
  syn keyword pythonNone        None
  syn keyword pythonBoolean     True False
  syn keyword pythonBuiltinObj  Ellipsis NotImplemented
  syn match pythonBuiltinObj    '\v(\.)@<!<(object|bool|int|float|tuple|str|list|dict|set|frozenset|bytearray|bytes)>' nextgroup=FunctionParameters
  syn keyword pythonBuiltinObj  __debug__ __doc__ __file__ __name__ __package__
  syn keyword pythonBuiltinObj  __loader__ __spec__ __path__ __cached__
endif

"
" Builtin functions
"

if s:Enabled('g:python_highlight_builtin_funcs')
  if s:Python2Syntax()
    syn match pythonBuiltinFunc  '\v(\.)@<!\zs<(apply|basestring|buffer|callable|coerce)>\ze\(' nextgroup=FunctionParameters
    syn match pythonBuiltinFunc  '\v(\.)@<!\zs<(execfile|file|help|intern|long|raw_input)>\ze\(' nextgroup=FunctionParameters
    syn match pythonBuiltinFunc  '\v(\.)@<!\zs<(reduce|reload|unichr|unicode|xrange)>\ze\(' nextgroup=FunctionParameters
    if s:Enabled('g:python_print_as_function')
      syn match pythonBuiltinFunc '\v(\.)@<!\zs<(print)>\ze\(' nextgroup=FunctionParameters
    endif
  else
    syn match pythonBuiltinFunc  '\v(\.)@<!\zs<(ascii|exec|memoryview|print)>\ze\(' nextgroup=FunctionParameters
  endif
  syn match pythonBuiltinFunc    '\v(\.)@<!\zs<(__import__|abs|all|any)>\ze\(' nextgroup=FunctionParameters
  syn match pythonBuiltinFunc    '\v(\.)@<!\zs<(bin|chr|classmethod|cmp|compile|complex)>\ze\(' nextgroup=FunctionParameters
  syn match pythonBuiltinFunc    '\v(\.)@<!\zs<(delattr|dir|divmod|enumerate|eval)>\ze\(' nextgroup=FunctionParameters
  syn match pythonBuiltinFunc    '\v(\.)@<!\zs<(filter|format|getattr)>\ze\(' nextgroup=FunctionParameters
  syn match pythonBuiltinFunc    '\v(\.)@<!\zs<(globals|hasattr|hash|hex|id)>\ze\(' nextgroup=FunctionParameters
  syn match pythonBuiltinFunc    '\v(\.)@<!\zs<(input|isinstance)>\ze\(' nextgroup=FunctionParameters
  syn match pythonBuiltinFunc    '\v(\.)@<!\zs<(issubclass|iter|len|locals|map|max)>\ze\(' nextgroup=FunctionParameters
  syn match pythonBuiltinFunc    '\v(\.)@<!\zs<(min|next|oct|open|ord)>\ze\(' nextgroup=FunctionParameters
  syn match pythonBuiltinFunc    '\v(\.)@<!\zs<(pow|property|range)>\ze\(' nextgroup=FunctionParameters
  syn match pythonBuiltinFunc    '\v(\.)@<!\zs<(repr|reversed|round|setattr)>\ze\(' nextgroup=FunctionParameters
  syn match pythonBuiltinFunc    '\v(\.)@<!\zs<(slice|sorted|staticmethod|sum|super)>\ze\(' nextgroup=FunctionParameters
  syn match pythonBuiltinFunc    '\v(\.)@<!\zs<(type|vars|zip)>\ze\(' nextgroup=FunctionParameters
endif

"
" Builtin exceptions and warnings
"

if s:Enabled('g:python_highlight_exceptions')
  if s:Python2Syntax()
      syn match pythonExClass   '\v(\.)@<!\zs<(StandardError)>' nextgroup=FunctionParameters
  else
      syn match pythonExClass   '\v(\.)@<!\zs<(BlockingIOError|ChildProcessError)>' nextgroup=FunctionParameters
      syn match pythonExClass   '\v(\.)@<!\zs<(ConnectionError|BrokenPipeError)>' nextgroup=FunctionParameters
      syn match pythonExClass   '\v(\.)@<!\zs<(ConnectionAbortedError|ConnectionRefusedError)>' nextgroup=FunctionParameters
      syn match pythonExClass   '\v(\.)@<!\zs<(ConnectionResetError|FileExistsError)>' nextgroup=FunctionParameters
      syn match pythonExClass   '\v(\.)@<!\zs<(FileNotFoundError|InterruptedError)>' nextgroup=FunctionParameters
      syn match pythonExClass   '\v(\.)@<!\zs<(IsADirectoryError|NotADirectoryError)>' nextgroup=FunctionParameters
      syn match pythonExClass   '\v(\.)@<!\zs<(PermissionError|ProcessLookupError TimeoutError)>' nextgroup=FunctionParameters
      syn match pythonExClass   '\v(\.)@<!\zs<(StopAsyncIteration|ResourceWarning)>' nextgroup=FunctionParameters
  endif

  syn match pythonExClass   '\v(\.)@<!<(BaseException|Exception|ArithmeticError)>' nextgroup=FunctionParameters
  syn match pythonExClass   '\v(\.)@<!\zs<(LookupError|EnvironmentError|AssertionError)>' nextgroup=FunctionParameters
  syn match pythonExClass   '\v(\.)@<!\zs<(AttributeError|BufferError|EOFError)>' nextgroup=FunctionParameters
  syn match pythonExClass   '\v(\.)@<!\zs<(FloatingPointError|GeneratorExit|IOError)>' nextgroup=FunctionParameters
  syn match pythonExClass   '\v(\.)@<!\zs<(ImportError|IndexError|KeyError)>' nextgroup=FunctionParameters
  syn match pythonExClass   '\v(\.)@<!\zs<(KeyboardInterrupt|MemoryError|NameError)>' nextgroup=FunctionParameters
  syn match pythonExClass   '\v(\.)@<!\zs<(NotImplementedError|OSError|OverflowError)>' nextgroup=FunctionParameters
  syn match pythonExClass   '\v(\.)@<!\zs<(ReferenceError|RuntimeError|StopIteration)>' nextgroup=FunctionParameters
  syn match pythonExClass   '\v(\.)@<!\zs<(SyntaxError|IndentationError|TabError)>' nextgroup=FunctionParameters
  syn match pythonExClass   '\v(\.)@<!\zs<(SystemError|SystemExit|TypeError)>' nextgroup=FunctionParameters
  syn match pythonExClass   '\v(\.)@<!\zs<(UnboundLocalError|UnicodeError)>' nextgroup=FunctionParameters
  syn match pythonExClass   '\v(\.)@<!\zs<(UnicodeEncodeError|UnicodeDecodeError)>' nextgroup=FunctionParameters
  syn match pythonExClass   '\v(\.)@<!\zs<(UnicodeTranslateError|ValueError|VMSError)>' nextgroup=FunctionParameters
  syn match pythonExClass   '\v(\.)@<!\zs<(WindowsError|ZeroDivisionError)>' nextgroup=FunctionParameters
  syn match pythonExClass   '\v(\.)@<!\zs<(Warning|UserWarning|BytesWarning|DeprecationWarning)>' nextgroup=FunctionParameters
  syn match pythonExClass   '\v(\.)@<!\zs<(PendingDepricationWarning|SyntaxWarning)>' nextgroup=FunctionParameters
  syn match pythonExClass   '\v(\.)@<!\zs<(RuntimeWarning|FutureWarning)>' nextgroup=FunctionParameters
  syn match pythonExClass   '\v(\.)@<!\zs<(ImportWarning|UnicodeWarning)>' nextgroup=FunctionParameters
endif

if s:Enabled('g:python_slow_sync')
  syn sync minlines=2000
else
  " This is fast but code inside triple quoted strings screws it up. It
  " is impossible to fix because the only way to know if you are inside a
  " triple quoted string is to start from the beginning of the file.
  syn sync match pythonSync grouphere NONE '):$'
  syn sync maxlines=200
endif

if v:version >= 508 || !exists('did_python_syn_inits')
  if v:version <= 508
    let did_python_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink pythonStatement        Statement
  HiLink pythonRaiseFromStatement   Statement
  HiLink pythonImport           Include
  HiLink pythonFunction         Function
  HiLink pythonConditional      Conditional
  HiLink pythonRepeat           Repeat
  HiLink pythonException        Exception
  HiLink pythonOperator         Operator

  HiLink pythonDecorator        Define
  HiLink pythonDottedName       Function
  HiLink pythonDot              Normal

  HiLink pythonComment          Comment
  if !s:Enabled('g:python_highlight_file_headers_as_comments')
    HiLink pythonCoding           Special
    HiLink pythonRun              Special
  endif
  HiLink pythonTodo             Todo

  HiLink pythonError            Error
  HiLink pythonIndentError      Error
  HiLink pythonSpaceError       Error

  HiLink pythonString           String
  HiLink pythonRawString        String

  HiLink pythonUniEscape        Special
  HiLink pythonUniEscapeError   Error

  if s:Python2Syntax()
    HiLink pythonUniString          String
    HiLink pythonUniRawString       String
    HiLink pythonUniRawEscape       Special
    HiLink pythonUniRawEscapeError  Error
  else
    HiLink pythonBytes              String
    HiLink pythonRawBytes           String
    HiLink pythonBytesContent       String
    HiLink pythonBytesError         Error
    HiLink pythonBytesEscape        Special
    HiLink pythonBytesEscapeError   Error
  endif

  HiLink pythonStrFormatting    Special
  HiLink pythonStrFormat        Special
  HiLink pythonStrTemplate      Special

  HiLink pythonDocTest          Special
  HiLink pythonDocTest2         Special

  HiLink pythonNumber           Number
  HiLink pythonHexNumber        Number
  HiLink pythonOctNumber        Number
  HiLink pythonBinNumber        Number
  HiLink pythonFloat            Float
  HiLink pythonNumberError      Error
  HiLink pythonOctError         Error
  HiLink pythonHexError         Error
  HiLink pythonBinError         Error

  HiLink pythonBoolean          Boolean
  HiLink pythonNone             Constant

  HiLink pythonBuiltinObj       Structure
  HiLink pythonBuiltinFunc      Function

  HiLink pythonExClass          Structure
  HiLink pythonInstanceVariable htmlTagN
  HiLink pythonClassVaraible htmlTagN
  HiLink OptionalParameters htmlTagN

  delcommand HiLink
endif

let b:current_syntax = 'python'
