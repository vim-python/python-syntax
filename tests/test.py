#! /usr/bin/env python
# -*- coding: utf-8 -*-
# Above the run-comment and file encoding comment.

# Comments.

# TODO FIXME XXX

# Keywords.

with break continue del return pass raise global assert lambda yield
for while if elif else import as try except finally

self cls mcs

from test import var as name

raise Exception from ex

yield from

def functionname
functionname()
functionname ()
functionname    ()
test.functionname()
test.functionname ()
class Classname
class classname
class classname_cls
def функция
функция()
class Класс
class класс


# Keywords: Python 2

exec
print

# Keywords: Python 3

await
async def Test
async with
async for

# Builtin objects.

True False Ellipsis None NotImplemented

__debug__ __doc__ __file__ __name__ __package__ __loader__ __spec__ __path__ __cached__

# Bultin types

bool bytearray dict float frozenset int list object set str tuple

# Builtin functions

__import__()
abs()
all()
any()
bin()
bool()
breakpoint()
bytearray()
callable()
chr()
classmethod()
compile()
complex()
delattr()
dict()
dir()
divmod()
enumerate()
eval()
filter()
float()
format()
frozenset()
getattr()
globals()
hasattr()
hash()
help()
hex()
id()
input()
int()
isinstance()
issubclass()
iter()
len()
list()
locals()
map()
max()
memoryview()
min()
next()
object()
oct()
open()
ord()
pow()
property()
range()
repr()
reversed()
round()
set()
setattr()
slice()
sorted()
staticmethod()
str()
sum()
super()
tuple()
type()
vars()
zip()

# Builtin functions: Python 2

apply()
basestring()
buffer()
cmp()
coerce()
execfile()
file()
intern()
long()
raw_input()
reduce()
reload()
unichr()
unicode()
xrange()

print()

# Builtin functions: Python 3

ascii()
bytes()
exec()
print()

# Builtin exceptions and warnings.

BaseException Exception StandardError ArithmeticError LookupError
EnvironmentError

AssertionError AttributeError EOFError FloatingPointError GeneratorExit IOError
ImportError IndexError KeyError KeyboardInterrupt MemoryError NameError
NotImplementedError OSError OverflowError ReferenceError RuntimeError
StopIteration SyntaxError IndentationError TabError SystemError SystemExit
TypeError UnboundLocalError UnicodeError UnicodeEncodeError UnicodeDecodeError
UnicodeTranslateError ValueError WindowsError ZeroDivisionError

Warning UserWarning DeprecationWarning PendingDeprecationWarning SyntaxWarning
RuntimeWarning FutureWarning ImportWarning UnicodeWarning

# Decorators.

@ decoratorname
@ object.__init__(arg1, arg2)
@ декоратор
@ декоратор.décorateur

# Operators

and or in is not

- + * ** **- **+ **~ @ / // %
& | ^ ~ << >>
< <= == != >= >

= =- =+ =~
-= += *= **= @= /= //= %= :=
&= |= ^= ~= <<= >>=

->

# Erroneous operators

$ ?
===
-- ++ *** @@ /// %%
&& || ^^ ~~ <<< >>>
<== !== !!= >==
%- +- -+

# Numbers

0 1 2 9 10 0x1f 1. .3 12.34 0j 124j 34.2E-3 0b10 0o77 1023434 0x0
1_1 1_1.2_2 1_2j 0x_1f 0x1_f 34_56e-3 34_56e+3_1 0o7_7

# Erroneous numbers

077 100L 0xfffffffL 0L 08 0xk 0x 0b102 0o78 0o123LaB
0_ 0_1 0_x1f 0x1f_ 0_b77 0b77_ .2_ 1_j

# Strings

" test " ' test '
"test\
test"
'test\
test'

"""
  test
\""""
'''
  test
\''''

" \a\b\c\"\'\n\r \x34\077 \08 \xag"
r" \" \' "

"testтест"

b"test"

b"test\r\n\xffff"

b"тестtest"

br"test"

br"\a\b\n\r"

# Formattings

" %f "
b" %f "

"{0.name!r:b} {0[n]} {name!s:  } {{test}} {{}} {} {.__len__:s}"
b"{0.name!r:b} {0[n]} {name!s:  } {{test}} {{}} {} {.__len__:s}"

"${test} ${test ${test}aname $$$ $test+nope"
b"${test} ${test ${test}aname $$$ $test+nope"

f"{var}...{arr[123]} normal {var['{'] // 0xff} \"xzcb\" 'xzcb' {var['}'] + 1} text"
f"{expr1 if True or False else expr2} {None} wow {','.join(c.lower() for c in 'asdf')}"
f"hello {expr:.2f} yes {(lambda: 0b1)():#03x} lol {var!r}"
f'brackets: {{{ 1 + 2 }}} and {{{{ 3 + 4 }}}}'
fr'this {that}'
f"{f'{1+1}'}"
'{{ }}'
f"{"{test}"}"  # FIXME: syntax error that should not be highlighted
f'{self.__name__}

# Doctests.

"""
    Test:
    >>> a = 5
    >>> a
    5

    Test
"""

'''
    Test:
    >>> a = 5
    >>> a
    5

    Test
'''

# Erroneous variable names

6xav


# Indentation errors.

    	    break

# Trailing space errors.

    	
    break	    
"""  	
   	 
    test    	
"""  	
