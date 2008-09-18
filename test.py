#! /usr/bin/env python
# -*- coding: utf-8 -*-
# Above the run-comment and file encoding comment.

# Comments.

# TODO FIXME XXX

# Keywords.

with break continue del exec return pass print raise global assert lambda yield
for while if elif else import from as try except finally and in is not or
def functionname
class classname

# Builtin objects.

True False Ellipsis None NotImplemented

# Builtin function and types.

__import__ abs all any apply basestring bool buffer callable chr classmethod
cmp coerce compile complex delattr dict dir divmod enumerate eval execfile file
filter float frozenset getattr globals hasattr hash help hex id input int
intern isinstance issubclass iter len list locals long map max min object oct
open ord pow property range raw_input reduce reload repr reversed round set
setattr slice sorted staticmethod str sum super tuple type unichr unicode vars
xrange zip

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
RuntimeWarning FutureWarning OverflowWarning ImportWarning UnicodeWarning

# Decorators.

@ decoratorname

# Numbers

0 0x 0x1f 077 .3 12.34 100L 0j 0j 34.2E-3

# Erroneous numbers

08 0xk

# Strings

" test " ' test '
"""
  test
"""
'''
  test
'''

" \a\b\c\"\'\n\r \x34\077 \08 \xag"
r" \" \' "

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

# Erroneous symbols or bad variable names.

$ ? 6xav

&& || ++ -- ===

# Indentation errors.

    	    break

# Trailing space errors.

    	
    break	    
"""  	
   	 
    test    	
"""  	
