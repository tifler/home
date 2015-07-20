#!/bin/sh
find . \( -name '*.c' -o -name '*.cpp' -o -name '*.cc' -o -name '*.h' -o -name '*.hh' -o -name '*.s' -o -name '*.S' \) -print > ctags.files
ctags -L ctags.files
