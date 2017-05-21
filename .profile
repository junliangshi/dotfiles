#!/bin/bash

dir_bin64="/home/jshi/bin64"
dir_open_source_bin="/home/jshi/open_source/bin"
#dir_code_root="/h/work/jshi/code_branch10"
#    "$dir_code_root"/users/BCTools/reviewboard/

path_array=(
    /home/jshi/my_script
    #"$dir_bin64"/emacs-25.1/bin
    "$dir_bin64"/emacs-24.5/bin
    "$dir_bin64"/vim8/bin
    "$dir_bin64"/tmux-1.9a/bin
    "$dir_bin64"/perl-5.20.0/bin
    "$dir_bin64"/ctags-5.8/bin
    "$dir_bin64"/gdb-7.8/bin
    "$dir_bin64"/the_silver_searcher/bin
    "$dir_bin64"/binutils-2.27/bin
    "$dir_bin64"/gcc4.9.1/bin
    "$dir_bin64"/cmake-3.6.2/bin
    "$dir_bin64"/python-2.7.8/bin
    "$dir_bin64"/llvm-3.9/bin
    "$dir_bin64"/git-2.10.1/bin
    "$dir_bin64"/intltool-0.50.2/bin
    "$dir_bin64"/bash-3.2.57/bin
    "$dir_bin64"/valgrind-3.10.1/bin/valgrind
    "$dir_bin64"/curl-7.51/bin
    "$dir_bin64"/bin
    ~/bin
    "${QTDIR}"/bin
    "${QTCREATOR}"/bin
    "/home/jshi/open_source/go-1.4/bin"
)
# PATH
for mypath in "${path_array[@]}"
do
    if [[ ! "$PATH" == *"$mypath:"* && -d "$mypath" ]]; then
        export PATH="$mypath:$PATH"
    fi
done

lib_path_array=(
    "$dir_bin64"/lib
    "$dir_bin64"/xz-5.07/lib
    "$dir_open_source_bin"/pcre-8.36/lib
    "$dir_bin64"/python-2.7.8/lib
    "$dir_open_source_bin"/mpfr-3.1.2/lib
    "$dir_open_source_bin"/gmp6/lib
    "$dir_open_source_bin"/mpc-1.0.2/lib
    "$dir_open_source_bin"/expat-2.1.0/lib
    "$dir_open_source_bin"/luaJit-2.0.4/lib
    "$dir_bin64"/lib/
    "$dir_bin64"/gcc4.9.1/lib64
    "$dir_bin64"/python-2.7.8/lib
    "$dir_bin64"/ruby-1.8.7/lib
    "$dir_bin64"/llvm-3.9/lib
    "${QTDIR}"/lib
)

# LD_LIBRARY_PATH
for lib_path in "${lib_path_array[@]}"
do
    if [[ ! "$LD_LIBRARY_PATH" == *"$lib_path:"* && -d "$lib_path" ]]; then
        export LD_LIBRARY_PATH=$lib_path:$LD_LIBRARY_PATH
    fi
done

python_path_array=(
    "$dir_bin64"/p4python_api
    "/h/work/jshi/code_git/branch10/GUI/PythonScripts/API"
)

# PYTHONPATH
for py_path in "${python_path_array[@]}"
do
    if [[ ! "$PYTHONPATH" == *"$py_path:"* && -d "$py_path" ]]; then
        export PYTHONPATH=$py_path:$PYTHONPATH
    fi
done

tmp_path_array=(
    "/h/work/jshi/_tmp_"
    "/home/jshi/_tmp_"
)

# set tmp folder, do not use system temp path
for mytmp in "${tmp_path_array[@]}"
do
    if [[ -O $mytmp && -d $mytmp ]]; then
        TMPDIR=$mytmp
        TMP=$TMPDIR
        TEMP=$TMPDIR
        export TMPDIR TMP TEMP
        break
    fi
done

# try to exec zsh
if [[ -z $ZSH_VERSION && $SHELL != *"/zsh" ]]; then
    myshell=/home/jshi/bin64/bin/zsh
    if [ -x $myshell ]; then
        export SHELL=$myshell
        if [ -t 1 ]; then exec $SHELL; fi
    fi
fi

