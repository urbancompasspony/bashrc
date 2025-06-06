#!/bin/bash

BASHRC_URL="https://raw.githubusercontent.com/urbancompasspony/bashrc/main/.bashrc"
TMP_BASHRC="/tmp/.bashrc.new.$$"
LOCAL_BASHRC="$HOME/.bashrc"
ROOT_BASHRC="/root/.bashrc"
ETC_BASHRC="/etc/bash.bashrc"

# 1. Verifica conexão com a internet
if ! curl -fsSL --connect-timeout 5 "$BASHRC_URL" -o "$TMP_BASHRC"; then
  echo "Erro: Sem conexão com a internet ou URL inacessível."
  rm -f "$TMP_BASHRC"
  exit 1
fi

# 2. Compara com o .bashrc atual do usuário
if cmp -s "$TMP_BASHRC" "$LOCAL_BASHRC"; then
  rm -f "$TMP_BASHRC"
  exit 0
fi

clear
echo "Mudanças detectadas no SRV. Aplicando atualizações..."
sleep 1

# 3. Copia para o usuário atual
cp "$TMP_BASHRC" "$LOCAL_BASHRC"
echo "Atualização do SRV do usuário concluída."

# 4. Solicita senha de administrador e copia para root e /etc
echo  -e "\033[39;5m==========================================\033[0m"
echo  -e "\033[39;5mDigite a senha de administrador por favor!\033[0m"
echo  -e "\033[39;5m==========================================\033[0m"
sudo cp "$TMP_BASHRC" "$ROOT_BASHRC"
sudo cp "$TMP_BASHRC" "$ETC_BASHRC"
echo "Atualização do SRV para ROOT concluída."

# 5. Mostra diff resumido (opcional)
#echo "Resumo das alterações:"
#diff --color=always -u "$LOCAL_BASHRC" "$TMP_BASHRC" || true

rm -f "$TMP_BASHRC"

# 6. Fecha o terminal apenas se foi atualizado
echo -e "\nNovo bashrc instalado para os usuários $USER e ROOT em /home e em /etc!"
echo "O terminal será fechado para aplicar as mudanças."
sleep 1

# Fecha o terminal (funciona para bash, zsh, gnome-terminal, xfce4-terminal, etc.)
kill -9 $PPID
