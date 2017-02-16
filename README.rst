Python syntax highlighting script for Vim
=========================================

.. contents::

This is an enhanced version of the original Python syntax highlighting script. Based on
``python.vim`` from Vim 6.1 distribution by Neil Schemenauer.

Features
--------

- Added support for Python 3 syntax highlighting
- Added commands ``Python2Syntax`` and ``Python3Syntax`` commands which allow to switch
  between Python 2 and Python 3 syntaxes respectively without reloads/restarts
- Updated string highlighting
- Enhanced special symbols highlighting inside strings
- Enhanced highlighting of numeric constants
- Added optional highlighting for %-formatting inside strings
- Added highlighting for magic comments: source code encoding and #! (executable) strings
- Added highlighting for new exceptions and builtins
- Added highlighting for doctests
- Added highlighting for new ``@decorator`` syntax introduced in Python 2.4a2
- Added highlighting for the following errors:
    - Invalid symbols in source file
    - Mixing spaces and tabs
    - Invalid numeric constants
    - Invalid %-formatting inside strings
    - Invalid variable names
    - Trailing spaces (triggered by the ``python_highlight_space_errors`` option)

Folding is done by the plugin `SimpylFold <https://github.com/tmhedberg/SimpylFold>`_.

How to install
--------------

Use one of the following plugin managers:

- `dein <https://github.com/Shougo/dein.vim>`_
- `vim-plug <https://github.com/junegunn/vim-plug>`_
- `vundle <https://github.com/VundleVim/Vundle.vim>`_
- `pathogen <https://github.com/tpope/vim-pathogen>`_

Or you can just manually place `syntax/python.vim
<https://github.com/vim-python/python-syntax/blob/master/syntax/python.vim>`_
into ``~/.config/nvim/syntax/`` or ``~/.vim/syntax/``.

Configuration
--------------

Enable option with::

    let VARIABLE = 1

Disable option with::

    let VARIABLE = 0

For example to enable all syntax highlighting features you can add the
following command to your ``~/.config/nvim/init.vim`` or ``~/.vimrc``::

    let g:python_highlight_all = 1

Select Python version
~~~~~~~~~~~~~~~~~~~~~

Variables:

``g:python_version_2`` or ``b:python_version_2``
    Enable highlighting for Python 2 (Python 3 highlighting is enabled by
    default).

Commands to easily switch between modes:

``Python2Syntax``
    Switch to Python 2
``Python3Syntax``
    Switch to Python 3

Option variables
~~~~~~~~~~~~~~~~

``g:python_highlight_builtins``
    Highlight builtin functions and objects
``g:python_highlight_builtin_objs``
    Highlight builtin objects only
``g:python_highlight_builtin_funcs``
    Highlight builtin functions only
``g:python_highlight_exceptions``
    Highlight standard exceptions
``g:python_highlight_string_formatting``
    Highlight ``%`` string formatting
``g:python_highlight_string_format``
    Highlight syntax of ``str.format`` syntax
``g:python_highlight_string_templates``
    Highlight syntax of ``string.Template``
``g:python_highlight_indent_errors``
    Highlight indentation errors
``g:python_highlight_space_errors``
    Highlight trailing spaces
``g:python_highlight_doctests``
    Highlight doc-tests
``g:python_print_as_function``
    Highlight ``print`` statement as function for Python 2
``g:python_highlight_file_headers_as_comments``
    Highlight shebang and coding headers as comments
``g:python_highlight_all``
    Enable all the options above - *NOTE: Doesn't override any previously set options*
``g:python_slow_sync``
    Disable for slow machines
