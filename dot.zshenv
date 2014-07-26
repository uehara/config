# zshenv

typeset -U path cdpath fpath manpath

# set PATH
path=($HOME/bin(N-/) /usr/local/sbin(N-/) /usr/local/bin(N-/) $path)

# zshenv for development environment settings

## java ##
if [[ -d "/usr/lib/jvm/java-7-oracle" ]]; then
    # Ubuntu
    export JAVA_HOME="/usr/lib/jvm/java-7-oracle"
elif [[ -d "/System/Library/Frameworks/JavaVM.framework/Home" ]]; then
    # Mac
    export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
fi

path=(${JAVA_HOME:+${JAVA_HOME}/bin}(N-/) $path)


## scala ##
# svm
# http://github.com/yuroyoro/svm
if [[ -d "${HOME}/.svm/current/rt" ]]; then
    export SCALA_HOME=${HOME}/.svm/current/rt
    path=(${SCALA_HOME:+${SCALA_HOME}/bin}(N-/) $path)
fi


## Play Framework ##
path=($HOME/local/play/latest(N-/) $path)

## node.js (nodebrew) ##
path=($HOME/.nodebrew/current/bin(N-/) $path)

## haskell (cabal) ##
path=($HOME/Library/Haskell/bin(N-/) $path)

# ruby
path=($HOME/.rbenv/shims(N-/) $path)    # for Mac
path=($HOME/.rbenv/bin(N-/) $path)
if which rbenv >/dev/null 2>&1 ;then
    eval "$(rbenv init - zsh)"
fi

### Added by the Heroku Toolbelt
path=(/usr/local/heroku/bin(N-/) $path)

## Android SDK ##
if [[ -d "${HOME}/local/android-sdk-macosx" ]]; then
    export ANDROID_HOME=${HOME}/local/android-sdk-macosx
fi
if [[ -n "$ANDROID_HOME" && -d "$ANDROID_HOME" ]]; then
    path=($path ${ANDROID_HOME}/tools(N-/) ${ANDROID_HOME}/platform-tools(N-/) ${ANDROID_HOME}/build-tools/android-4.4(N-/))
fi

# added by travis gem
[ -f ${HOME}/.travis/travis.sh ] && source ${HOME}/.travis/travis.sh

# Go
if [[ -d "${HOME}/local/gocode" ]]; then
    export GOPATH=${HOME}/local/gocode
    path=($path ${GOPATH}/bin)
fi

# Perl
export PERL_CPANM_OPT="--local-lib=~/perl5"
path=($path $HOME/perl5/bin(N-/))
export PERL5LIB=$HOME/perl5/lib/perl5:$PERL5LIB;

# vim:set ft=zsh:
