#!/bin/bash

tools=(git)
deps=()

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
    linux-gnu)
      success "OK"
      ;;
    *)
      error "Not supported OSTYPE, exitting"
      exit 1
      ;;
  esac
}

function check_available {
  which "$1" &>/dev/null
  return $?
}

function check_commands {
  install=()
  for pkg in ${tools[@]}
  do
    check_available $pkg && install+=$pkg
  done
}

function check_deps {
  deps="$(apt-cache depends $install)"
}