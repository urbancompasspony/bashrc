#!/bin/bash

[ "$EUID" -ne 0 ] || {
  echo "Não execute esse script como Root!"
  exit
  }

curl -sSL https://raw.githubusercontent.com/urbancompasspony/bashrc/main/.bashrc > $HOME/.bashrc
