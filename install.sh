#!/bin/bash

curl -sSL https://raw.githubusercontent.com/urbancompasspony/bashrc/main/.bashrc | tee $HOME/.bashrc

#sudo rm /root/.bashrc
curl -sSL https://raw.githubusercontent.com/urbancompasspony/bashrc/main/.bashrc | sudo tee /root/.bashrc

echo "Novo bashrc instalado para os usuários $USER e ROOT!"
sleep 3
