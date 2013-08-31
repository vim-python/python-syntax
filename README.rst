Python syntax highlighting script for Vim
=========================================

.. contents::

About
-----

Enhanced version of the original Python syntax highlighting script. Based on
``python.vim`` from Vim 6.1 distribution by Neil Schemenauer (nas at python dot
ca). Check also `python.vim page on vim.org
<http://www.vim.org/scripts/script.php?script_id=790>`_.

Please use the following channels for reporting bugs, offering suggestions or
feedback:

- python.vim issue tracker: https://github.com/hdima/python-syntax/issues
- Email: Dmitry Vasiliev (dima at hlabs.org)
- Send a message or follow me for updates on Twitter: `@hdima
  <https://twitter.com/hdima>`__

Features
--------

Changes from the original ``python.vim`` are:

- Added support for Python 3 syntax highlighting
- Added ``:Python2Syntax`` and ``:Python3Syntax`` commands which allow to
  switch between Python 2 and Python 3 syntaxes respectively without
  reloads/restarts
- Updated strings highlighting
- Enhanced special symbols highlighting inside strings
- Enhanced highlighting of numeric constants
- Added optional highlighting for %-formatting inside strings
- Added highlighting for magic comments: source code encoding and #!
  (executable) strings
- Added highlighting for new exceptions and builtins
- Added highlighting for doctests
- Added highlighting for new ``@decorator`` syntax introduced in Python 2.4a2
- Added highlighting for the following errors:

  - invalid symbols in source file
  - mixing spaces and tabs
  - invalid numeric constants
  - invalid %-formatting inside strings
  - invalid variable names
  - trailing spaces (triggered by the ``python_highlight_space_errors`` option)

Some of these features was later backported into the original ``python.vim``.

How to install
--------------

The easiest installation method is to place `syntax/python.vim
<https://github.com/hdima/python-syntax/blob/master/syntax/python.vim>`_ script
into your ``~/.vim/syntax/`` directory.

You can also use `Pathogen <https://github.com/tpope/vim-pathogen>`_ or `Vundle
<https://github.com/gmarik/vundle>`_ plugin managers in which case you can
install the whole `python.vim repository
<https://github.com/hdima/python-syntax>`_ into the corresponding plugins
directory.

Script options
--------------

There are two commands to enable or disable an option:

``:let OPTION_NAME = 1``
  Enable option
``:let OPTION_NAME = 0``
  Disable option

For example to enable all syntax highlighting features you can place the
following command in your ``~/.vimrc`` script::

  let python_highlight_all = 1

Option and commands to select Python version
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

``python_version_2``
  Enable highlighting for Python 2 (Python 3 highlighting is enabled by
  default). Can also be set as a local to buffer ``b:python_version_2``
  variable.

The following local to buffer commands can be used to switch between two
highlighting modes:

``:Python2Syntax``
  Switch to Python 2 highlighting mode
``:Python3Syntax``
  Switch to Python 3 highlighting mode

Options used by the script
~~~~~~~~~~~~~~~~~~~~~~~~~~

``python_highlight_builtins``
  Highlight builtin functions and objects
``python_highlight_builtin_objs``
  Highlight builtin objects only
``python_highlight_builtin_funcs``
  Highlight builtin functions only
``python_highlight_exceptions``
  Highlight standard exceptions
``python_highlight_string_formatting``
  Highlight ``%`` string formatting
``python_highlight_string_format``
  Highlight syntax of ``str.format`` syntax
``python_highlight_string_templates``
  Highlight syntax of ``string.Template``
``python_highlight_indent_errors``
  Highlight indentation errors
``python_highlight_space_errors``
  Highlight trailing spaces
``python_highlight_doctests``
  Highlight doc-tests
``python_print_as_function``
  Highlight ``print`` statement as function for Python 2
``python_highlight_file_headers_as_comments``
  Highlight shebang and coding headers as comments
``python_highlight_all``
  Enable all the options above. *NOTE: This option don't override any
  previously set options*
``python_slow_sync``
  Can be set to 0 for slow machines

Contributors
------------

List of the contributors in alphabetical order:

- Andrea Riciputi
- Anton Butanaev
- Caleb Adamantine
- Jeroen Ruigrok van der Werven
- John Eikenberry
- Marc Weber
- Pedro Algarvio
- pydave at GitHub
- Will Gray
- Yuri Habrusiev
