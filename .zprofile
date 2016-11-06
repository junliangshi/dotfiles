
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
case "$-" in *i*) if [ -r ~/.zshrc ]; then . ~/.zshrc; fi;; esac

