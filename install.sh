#!/bin/bash
curl -sSL https://raw.githubusercontent.com/urbancompasspony/bashrc/main/.bashrc | tee $HOME/.bashrc
clear
echo  -e "\033[39;5m==========================================\033[0m"
echo  -e "\033[39;5mDigite a senha de administrador por favor!\033[0m"
echo  -e "\033[39;5m==========================================\033[0m"
curl -sSL https://raw.githubusercontent.com/urbancompasspony/bashrc/main/.bashrc | sudo tee /root/.bashrc
curl -sSL https://raw.githubusercontent.com/urbancompasspony/bashrc/main/.bashrc | sudo tee /etc/bash.bashrc

echo "Novo bashrc instalado para os usuários $USER e ROOT em /home e em /etc!"

sleep 3
