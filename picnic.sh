#!/bin/bash

function warn {
  # color:yellow
  echo -e "\033[33mWarning\033[m" "$*"
}

function error {
  # color:red
  echo -e "\033[31mError\033[m" "$*"
}

function success {
  # color:green
  echo -e "\033[32mSuccess\033[m" "$*"
}

function check_os {
  case ${OSTYPE} in
    linux*)
      success "OK"
      ;;
    *)
      error "$OSTYPE is NOT supported, exitting"
      exit 1
      ;;
  esac
}

function check_available {
  which "$1" &>/dev/null
  return $?
}

function install_zlib {
  cd ~/picnic
  wget http://zlib.net/zlib-1.2.8.tar.gz
  tar zxvf zlib-1.2.8.tar.gz
  cd zlib-1.2.8
  ./configure --prefix=$HOME/picnic
  make &&
  make install &&
  export CPPFLAGS="-I$HOME/picnic/include" LDFLAGS="-L$HOME/picnic/lib"
}


function install_git {
  cd ~/picnic
  wget https://www.kernel.org/pub/software/scm/git/git-2.8.1.tar.gz
  tar zxvf git-2.8.1.tar.gz
  cd git-2.8.1
  ./configure --prefix=$HOME/picnic --with-curl=$CURLDIR NO_OPENSSL=1 NO_CURL=1
  make &&
  make install
}

function install_curl {
  cd ~/picnic
  wget https://github.com/curl/curl/archive/curl-7_48_0.tar.gz
  tar tar zxvf curl-7_48_0.tar.gz
  cd curl-7_48_0
  ./configure --prefix=$HOME/picnic
  make &&
  make install
}

# SUBCOMMANDS

function picnic-unpack {
  check_os
  mkdir ~/picnic
  case "$(check_available curl)" in
    0 )
      $CURLDIR="$(which curl)"
      ;;
    1 )
      $CURLDIR="$HOME/picnic"
      install_curl
      ;;
  esac
  install_zlib
  install_git
  # echo "PATH=$PATH:~/picnic/bin" >> "~/.$(basename $SHELL)rc"
}

function picnic-remove {
  if [ -e ~/picnic ]; then
    rm -rf ~/picnic
  fi
}

function picnic-help {
  echo "picnic-0.1.0"
  echo "  unpack: install from source"
  echo "  remove: remove files"
}

# MAIN

SUBCOMMAND=""
ARGS=()
while [ $# -gt 0 ]
do
  case "$1" in

    --help|--version|-V)
      picnic-help
      exit 0
    ;;

    *)
      if [ -z "$SUBCOMMAND" ]; then
        SUBCOMMAND="$1"
      else
        ARGS+=( "$1" )
      fi
      shift
    ;;
  esac
done

function invoke_subcommand {
  local SUBCOMMAND="${@:1:1}"
  local ARGS=( "${@:2}" )
  local ACTION="picnic-${SUBCOMMAND:-help}"
  if type "$ACTION" &>/dev/null; then
    "$ACTION" "${ARGS[@]}"
  else
    error "unknown command: $SUBCOMMAND"
  fi
}

invoke_subcommand "$SUBCOMMAND" "${ARGS[@]}"