#! /usr/bin/env python
# -*- coding: utf-8 -*-
# Above the run-comment and file encoding comment.

# Comments.

# TODO FIXME XXX

# Keywords.

with break continue del return pass raise global assert lambda yield
for while if elif else import as try except finally

from test import var as name

raise Exception from ex

yield from

def functionname
class Classname
def функция
class Класс

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

# Bultin types

bool bytearray dict float frozenset int list object set str tuple

# Builtin functions: Python 2

abs()          divmod()     input()       open()       staticmethod()
all()          enumerate()  int()         ord()        str()
any()          eval()       isinstance()  pow()        sum()
basestring()   execfile()   issubclass()  print()      super()
bin()          file()       iter()        property()   tuple()
bool()         filter()     len()         range()      type()
bytearray()    float()      list()        raw_input()  unichr()
callable()     format()     locals()      reduce()     unicode()
chr()          frozenset()  long()        reload()     vars()
classmethod()  getattr()    map()         repr()       xrange()
cmp()          globals()    max()         reversed()   zip()
compile()      hasattr()    memoryview()  round()      __import__()
complex()      hash()       min()         set()
delattr()      help()       next()        setattr()
dict()         hex()        object()      slice()
dir()          id()         oct()         sorted()

apply()
buffer()
coerce()
intern()

# Builtin functions: Python 3

abs()          dict()       help()        min()       setattr()
all()          dir()        hex()         next()      slice()
any()          divmod()     id()          object()    sorted()
ascii()        enumerate()  input()       oct()       staticmethod()
bin()          eval()       int()         open()      str()
bool()         exec()       isinstance()  ord()       sum()
bytearray()    filter()     issubclass()  pow()       super()
bytes()        float()      iter()        print()     tuple()
callable()     format()     len()         property()  type()
chr()          frozenset()  list()        range()     vars()
classmethod()  getattr()    locals()      repr()      zip()
compile()      globals()    map()         reversed()  __import__()
complex()      hasattr()    max()         round()
delattr()      hash()       memoryview()  set()

# Builtin exceptions and warnings.

BaseException Exception StandardError ArithmeticError LookupError
EnvironmentError

AssertionError AttributeError EOFError FloatingPointError GeneratorExit IOError
ImportError IndexError KeyError KeyboardInterrupt MemoryError NameError
NotImplementedError OSError OverflowError ReferenceError RuntimeError
StopIteration SyntaxError IndentationError TabError SystemError SystemExit
TypeError UnboundLocalError UnicodeError UnicodeEncodeError UnicodeDecodeError
UnicodeTranslateError ValueError WindowsError ZeroDivisionError

Warning UserWarning DeprecationWarning PendingDepricationWarning SyntaxWarning
RuntimeWarning FutureWarning ImportWarning UnicodeWarning

# Decorators.

@ decoratorname
@ object.__init__(arg1, arg2)
@ декоратор
@ декоратор.décorateur

# Operators

and or in is not

- + * ** @ / // %
& | ^ ~ << >>
< <= == != >= >

=
-= += *= **= @= /= //= %=
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

0 1 2 9 10 0x1f .3 12.34 0j 124j 34.2E-3 0b10 0o77 1023434 0x0
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
f"{expr1 if True or False else expr2} wow {','.join(c.lower() for c in 'asdf')}"
f"hello {expr:.2f} yes {(lambda: 0b1)():#03x} lol {var!r}"

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
