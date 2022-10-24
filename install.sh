#!/bin/bash

[ "$EUID" -ne 0 ] || {
  echo "Não execute esse script como Root!"
  exit
  }

curl -sSL https://raw.githubusercontent.com/urbancompasspony/bashrc/main/.bashrc > $HOME/.bashrc

echo "Agora sim entre como Sudo!"

sudo rm /root/.bashrc
curl -sSL https://raw.githubusercontent.com/urbancompasspony/bashrc/main/root/.bashrc | sudo tee -a /root/.bashrc

echo "Novo bashrc instalado!"
