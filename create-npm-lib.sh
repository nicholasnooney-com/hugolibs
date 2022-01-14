#!/usr/bin/env bash

GIT_URL="github.com/nicholasnooney-com/hugolibs"

function print_usage {
  cat <<EOF
create-npm-lib Usage:

create-npm-lib PACKAGENAME

create-npm-lib will download an NPM package and place the package in a subfolder
of the current directory.
EOF
}

function main {
  if [ $# -lt 1 ]; then
    print_usage
    exit 0
  fi

  npm install $1
  if [ -d $1 ]; then
    read -r -p "Overwrite existing directory $1? [y/N] " response
    case "$response" in
      [yY][eE][sS]|[yY]) rm -rf $1 ;;
      *) exit 1 ;;
    esac
  fi

  cp -r "node_modules/$1" "$1"

  cd "$1"
  go mod init "$GIT_URL/$1"
}

main $@
