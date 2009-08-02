# bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

umask 022
# Don't make useless coredump files
ulimit -c 0

##############################
#set option
##############################
set -o emacs
set -o ignoreeof

##############################
#environment variables
##############################

#set PS*
brown='\[\033[0;33m\]'
brown_underbar='\[\033[4;33m\]'
blue='\[\033[0;34m\]'
blue_underbar='\[\033[4;34m\]'
color_end='\[\033[m\]'

export PS1="${brown_underbar}[\\u@\\h]${color_end}(\\j) \\w\\n\\\$ "
export PS4='-> $LINENO: '

unset -v brown brown_underbar blue blue_underbar color_end

#history configuration
shopt -s histappend
export HISTSIZE=1000000
export HISTFILESIZE=1000000

#set HISTIGNORE
hist_ignore="&:????:???:??:?"
hist_ignore="${hist_ignore}:ls -??:ls -?"
hist_ignore="${hist_ignore}:cd *:pud *:pod *:pushd *:popd *"
hist_ignore="${hist_ignore}:man *:help *"
hist_ignore="${hist_ignore}:logout"

HISTIGNORE="$hist_ignore"
unset -v hist_ignore

#etc
export EDITOR=vim
export LESS='--tabs=4 --no-init'


##############################
#functions
##############################

#pushd
#push home directory if no argument
mypushd()
{
    if [ $# -eq 0 ]; then
        pushd $HOME
    else
        pushd "$@"
    fi
}

#place job in the foreground
foreground()
{
    if [ $# -eq 0 ]; then
        fg
    else
        fg %$1
    fi
}

##############################
#aliases
##############################

#list
alias ls='ls -F --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias lr='tree -F'

#file operation
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

#vi
alias vi='vim'
alias vir='vim -R'
alias winvi='vim -c "edit ++fileformat=dos ++enc=cp932"'
alias eucvi='vim -c "edit ++enc=euc-jp"'
alias gm='gvim'

#change directory
alias pud='mypushd'
alias pod='popd'
alias di='dirs -v'

#grep
alias grep='grep -E'
alias grepf='grep --line-number --with-filename'
alias grepr='grep --line-number --with-filename --recursive'

#history
alias his='history'
alias h='history 10'

#etc
alias ln='ln -s'
alias cl='clear'
alias jb='jobs -l'
alias f=foreground
alias sc=screen

# vim:set ft=sh: