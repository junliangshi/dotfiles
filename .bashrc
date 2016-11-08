#!/bin/bash

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

qt_lib_parent_path=/n/filer3b/home/dev/tyan/t_drive
export QTDIR=$qt_lib_parent_path/QT/usr/local/Trolltech/Qt-4.7.4
export QT_PLUGIN_PATH=${QTDIR}/plugins
export QTCREATOR=$qt_lib_parent_path/QT/qt-creator-2.4.1-src

# p4 env
export P4PORT=perforce:1666
export P4USER=jshi
export P4CONFIG=.p4env

alias_array=(
    cd_e4:/gpfs/software/tachyon_flex_E4.0/release_v3/LSF/bin
    cd_tflex1512:/gpfs/software/tachyon_flex_20151201/release/LSF/bin
    cd_tflex1501:/gpfs/software/tachyon_flex_20150100/release_v4/LSF/bin
    cd_tflex1408:/gpfs/software/tachyon_flex_20140800/release.v3/LSF/bin
    cd_tflex1309:/nfs/software/tachyon_flex_20130900/release/LSF/bin
    cd_shared:/gpfs/DEV/GUI/SHARED
    cd_nightly:/gpfs/software/tflex_nightly/LSF/bin/
    cd_work:/gpfs/DEV/GUI/jshi
    cd_work:/h/work/jshi
    cd_code:/h/work/jshi/code_git/branch10
    cd_code:/n/filer3b/home/dev/jshi/code_work/code_git/branch10
    cd_panther_work:/h/panther02/work/jshi
    cd_panther_home:/n/filer3b/home/home/jshi
)

###
fn_setup_cd_alias(){
    if [ -d "$2" ]; then
        alias $1="cd $2"
    fi
}

# alias
for myalias in "${alias_array[@]}"
do
    KEY=${myalias%%:*}
    VALUE=${myalias#*:}
    fn_setup_cd_alias $KEY $VALUE
done

alias python=python2.7

# set up bash
if [ $BASH ]; then
    shopt -s histappend
    export PS1="\\u@\h \\W]\\$"
    export HISTCONTROL=erasedups:ignorespace

    # disable CTRL-S to stop output message, CTRL-Q resume
    if [[ $- == *i* ]]; then
        bind -r '\C-s'
        stty -ixon
    fi
fi

# fasd
eval "$(fasd --init auto)"

# fzf
if [[ -n "$BASH_VERSION" ]]; then
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
    export FZF_DEFAULT_COMMAND='ag -g ""'
    export FZF_CTRL_T_COMMAND='ag -g ""'
fi

# ls color change to solarized
eval `dircolors ~/.dir_colors/dircolors.ansi-dark`

