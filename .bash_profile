# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/login.defs
#umask 022

# the rest of this file is commented out.

#[ "x$SHLVL" = "x1" ] && FLAG_LOGINSHELL=true # in a login shell
#[ "x$DISPLAY" != "x" ] && FLAG_XTERM=true # in X
#[[ `tty` == /dev/pts/[0-9]* ]] && FLAG_CONSOLE=true # in console

export PATH=/sbin:/usr/sbin:"${PATH}"

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    export PATH=~/bin:"${PATH}"
fi

# do the same with MANPATH
#if [ -d ~/man ]; then
#    MANPATH=~/man:"${MANPATH}"
#    export MANPATH
#fi

if [ -r ~/.profile ]; then . ~/.profile; fi
case "$-" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi;; esac

