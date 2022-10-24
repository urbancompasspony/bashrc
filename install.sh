#!/bin/bash

[ "$EUID" -ne 0 ] || {
  echo "Não execute esse script como Root, ainda!"
  exit
  }

curl -sSL https://raw.githubusercontent.com/urbancompasspony/bashrc/main/.bashrc > $HOME/.bashrc

sudo rm /root/.bashrc
curl -sSL https://raw.githubusercontent.com/urbancompasspony/bashrc/main/root/.bashrc | sudo tee -a /root/.bashrc

echo "Novo bashrc instalado para os usuários $USER e ROOT!"
