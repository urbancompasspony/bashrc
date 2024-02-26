#!/bin/bash

curl -sSL https://raw.githubusercontent.com/urbancompasspony/bashrc/main/.bashrc | tee $HOME/.bashrc
curl -sSL https://raw.githubusercontent.com/urbancompasspony/bashrc/main/.bashrc | sudo tee /root/.bashrc
curl -sSL https://raw.githubusercontent.com/urbancompasspony/bashrc/main/.bashrc | sudo tee /etc/bash.bashrc

echo "Novo bashrc instalado para os usuários $USER e ROOT em /home e em /etc!"

sleep 3
