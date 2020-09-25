Python syntax highlighting for Vim
=========================================

This is an enhanced version of the original Vim 6.1 Python syntax highlighting
`python.vim` by Neil Schemenauer.

Features
--------

* Enhanced highlighting for:
  * Strings
  * Special symbols inside strings
  * Numeric constants
* Added support for:
  * Python 3
  * Numbers with underscores
  * String %-formatting and f-strings
  * Magic comments: source code encoding and shebangs
  * New exceptions and builtins
  * Doctests
  * `@decorator` syntax
  * Class variables such as `self`, `cls`, and `mcs`
  * Operators
* Highlighting of the following errors:
  * Invalid symbols in source file
  * Invalid numeric constants
  * Invalid %-formatting inside strings
  * Invalid variable names
  * Invalid operators
  * Mixing spaces and tabs
  * Trailing spaces (Enabled with `g:python_highlight_space_errors`)
* Commands for easy switching between versions

Folding is done by the plugin [SimpylFold](https://github.com/tmhedberg/SimpylFold).

How to install
--------------

Use one of the following plugin managers:

* [dein](https://github.com/Shougo/dein.vim)
* [vim-plug](https://github.com/junegunn/vim-plug)
* [vundle](https://github.com/VundleVim/Vundle.vim)
* [pathogen](https://github.com/tpope/vim-pathogen)

Configuration
-------------

### Option variables

Set variable to `1` to enable or `0` to disable.

For example to enable all syntax highlighting features you can add the
following command to your `~/.config/nvim/init.vim` or `~/.vimrc`:
```vim
let g:python_highlight_all = 1
```
| Variable                                      | Description                                                    | Default |
| --------------------------------------------- | -------------------------------------------------------------- | ------- |
| `g:python_version_2`                          | Python 2 mode                                                  | `0`     |
| `b:python_version_2`                          | Python 2 mode (buffer local)                                   | `0`     |
| `g:python_highlight_builtins`                 | Highlight builtin objects, types, and functions                | `0`     |
| `g:python_highlight_builtin_objs`             | Highlight builtin objects only                                 | `0`     |
| `g:python_highlight_builtin_types`            | Highlight builtin types only                                   | `0`     |
| `g:python_highlight_builtin_funcs`            | Highlight builtin functions only                               | `0`     |
| `g:python_highlight_builtin_funcs_kwarg`      | Highlight builtin functions when used as kwarg                 | `1`     |
| `g:python_highlight_exceptions`               | Highlight standard exceptions                                  | `0`     |
| `g:python_highlight_string_formatting`        | Highlight `%` string formatting                                | `0`     |
| `g:python_highlight_string_format`            | Highlight syntax of `str.format` syntax                        | `0`     |
| `g:python_highlight_string_templates`         | Highlight syntax of `string.Template`                          | `0`     |
| `g:python_highlight_indent_errors`            | Highlight indentation errors                                   | `0`     |
| `g:python_highlight_space_errors`             | Highlight trailing spaces                                      | `0`     |
| `g:python_highlight_doctests`                 | Highlight doc-tests                                            | `0`     |
| `g:python_highlight_func_calls`               | Highlight functions calls                                      | `0`     |
| `g:python_highlight_class_vars`               | Highlight class variables `self`, `cls`, and `mcs`             | `0`     |
| `g:python_highlight_operators`                | Highlight all operators                                        | `0`     |
| `g:python_highlight_all`                      | Enable all highlight options above, except for previously set. | `0`     |
| `g:python_highlight_file_headers_as_comments` | Highlight shebang and coding headers as comments               | `0`     |
| `g:python_slow_sync`                          | Disable for slow machines                                      | `1`     |

### Commands

| Command         | Description        |
| --------------- | ------------------ |
| `Python2Syntax` | Switch to Python 2 |
| `Python3Syntax` | Switch to Python 3 |
