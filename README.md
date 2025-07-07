# 🐚 Enhanced BASHRC Configuration

> **Configuração avançada de BASH com prompt personalizado, aliases úteis e funções otimizadas para administradores de sistema e desenvolvedores.**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS-green.svg)](https://github.com/urbancompasspony/bashrc)
[![Shell](https://img.shields.io/badge/Shell-Bash-blue.svg)](https://www.gnu.org/software/bash/)

## 🎯 Sobre o Projeto

Esta é uma configuração avançada de BASHRC projetada para melhorar a experiência de linha de comando com prompt colorido, aliases úteis, funções personalizadas e otimizações para administradores de sistema.

## ✨ Características Principais

- **🎨 Prompt Colorido** - Interface visual melhorada com cores e informações contextuais
- **🔧 Aliases Úteis** - Comandos otimizados para tarefas comuns
- **⚡ Funções Avançadas** - Extração de arquivos, navegação e manipulação de dados
- **🌐 Integração de Rede** - Comandos para verificação de IP e conectividade
- **🔒 Controle de Domínio** - Funcionalidades para Active Directory
- **📁 Gerenciamento de Arquivos** - Funções melhoradas para navegação e organização
- **🔄 Auto-atualização** - Sistema de atualização automática via internet

## 🚀 Instalação Rápida

### Instalação com Script Automático
```bash
curl -sSL https://raw.githubusercontent.com/urbancompasspony/bashrc/main/install.sh | bash
```

### Instalação Manual
```bash
# Fazer backup do bashrc atual
cp ~/.bashrc ~/.bashrc.backup

# Baixar nova configuração
wget https://raw.githubusercontent.com/urbancompasspony/bashrc/main/.bashrc -O ~/.bashrc

# Aplicar configurações
source ~/.bashrc
```

## 🎨 Prompt Personalizado

### Usuário Normal
```
┌─[usuario]@[hostname]:[/caminho/atual]
└──╼ $ 
```

### Root
```
┌─[root]@[hostname]:[/caminho/atual]
└──╼ $ 
```

### Cores do Prompt
- **Azul**: Usuário e hostname
- **Ciano**: Diretório atual
- **Vermelho**: Root e delimitadores
- **Preto Bold**: Estrutura do prompt

## 🔧 Aliases Principais

### Editores
```bash
pico='nano'          # Alias para nano
vim='nano'           # Substitui vim por nano
spico='nano'         # Secure nano
snano='nano'         # Secure nano
```

### Comandos Seguros
```bash
cp='cp -i'           # Confirmação antes de sobrescrever
mv='mv -i'           # Confirmação antes de mover
rm='rm -iv'          # Confirmação e verbose para remoção
mkdir='mkdir -p'     # Cria diretórios recursivamente
```

### Arquivos e Compressão
```bash
mktar='tar -cvf'     # Criar arquivo TAR
mkbz2='tar -cvjf'    # Criar arquivo BZ2
mkgz='tar -cvzf'     # Criar arquivo GZ
untar='tar -xvf'     # Extrair TAR
unbz2='tar -xvjf'    # Extrair BZ2
ungz='tar -xvzf'     # Extrair GZ
```

### Sistema e Rede
```bash
iplan="hostname -I | awk '{print \$1}'"              # IP da LAN
ipwan="dig @resolver4.opendns.com myip.opendns.com +short"  # IP da WAN
ifconfig="ip -br -c a"                               # Interface colorida
ipconfig="ip -br -c a"                               # Alias Windows-style
TRIM='sudo fstrim -va'                               # TRIM SSD
```

### Pentesting e Segurança
```bash
metasploit="sudo msfconsole"     # Metasploit com sudo
singlenmap='sudo nmap -Pn --script vuln --exclude 9100 -p1-9099,9101-65535'
sshw="ssh-keygen -f ~/.ssh/known_hosts -R"  # Remove entrada SSH
```

## ⚡ Funções Avançadas

### Extração Universal de Arquivos
```bash
extract arquivo.tar.gz    # Extrai qualquer tipo de arquivo
extract arquivo.zip
extract arquivo.rar
```

### Busca de Texto
```bash
ftext "termo"             # Busca texto em todos os arquivos
```

### Cópia com Barra de Progresso
```bash
cpp origem destino        # Copia arquivo com barra de progresso
```

### Navegação Inteligente
```bash
cpg arquivo /destino      # Copia e vai para o diretório
mvg arquivo /destino      # Move e vai para o diretório
mkdirg nova_pasta         # Cria diretório e entra nele
```

### Monitoramento de Sync
```bash
sync                      # Sync com monitoramento visual
syncs                     # Monitora dirty memory em tempo real
```

### Comando SRV Dinâmico
```bash
srv                       # Baixa e executa comando atualizado via internet
```

## 🌐 Funcionalidades de Rede

### Verificação de IP
```bash
iplan                     # Mostra IP da LAN
ipwan                     # Mostra IP público (WAN)
```

### Ferramentas de Conectividade
```bash
0x0 < arquivo.txt         # Upload para pastebin 0x0.st
qrcode "texto"            # Gera QR code no terminal
```

## 🔒 Controle de Domínio

### Função Domain
```bash
domain                    # Acessa controle de domínio com senha
```
- Interface protegida por senha MD5
- Integração com containers Docker
- Controle de Active Directory

### Backdoor de Emergência
```bash
backuser                  # Cria usuário nathandrake
backpass                 # Define senha para backup
```

## 🎵 Conversão de Mídia

```bash
v2a input.mp4 output.mp3  # Extrai áudio de vídeo (via ffmpeg)
```

## 📊 Configurações de Sistema

### Histórico Otimizado
- **HISTSIZE**: 10.000 comandos
- **HISTFILESIZE**: 500 linhas
- **HISTCONTROL**: Remove duplicatas e linhas com espaço
- **Append Mode**: Preserva histórico entre sessões

### Variáveis de Ambiente
```bash
EDITOR=nano              # Editor padrão
VISUAL=nano              # Editor visual
PATH="$PATH:$HOME/.local/bin"  # Inclui binários locais
```

### Cores para Manual Pages
- Headers em vermelho bold
- Texto destacado em verde
- Links em ciano bold

## 🔧 Configurações Específicas

### Para Raspberry Pi
```bash
sensorspi                 # Temperatura do Pi
temppi                   # Alias para temperatura
```

### Para Arch Linux
```bash
autoremove               # Remove pacotes órfãos
rankmirror              # Atualiza mirrors (EndeavourOS)
```

### Para MATE Desktop
```bash
reset-panel             # Reinicia painel MATE
```

## 📦 Instalação Automática

O script `install.sh` realiza:

1. **Verificação de Conectividade** - Testa acesso à internet
2. **Comparação de Versões** - Só atualiza se houver mudanças
3. **Backup Automático** - Preserva configuração atual
4. **Instalação para Usuário** - Atualiza ~/.bashrc
5. **Instalação para Root** - Atualiza /root/.bashrc
6. **Instalação Global** - Atualiza /etc/bash.bashrc

## 🎯 Recursos Especiais

### Auto-completar Avançado
- Suporte a bash-completion
- Comandos personalizados
- Navegação inteligente

### Integração com ROCm
```bash
# Adiciona automaticamente ROCm ao PATH se instalado
export PATH=$PATH:/opt/rocm/bin
```

### Compressão LZ4
```bash
tarc arquivos...          # Comprime com LZ4
tarx arquivo.tar.lz4      # Descomprime LZ4
```

## 🔄 Sistema de Atualização

### Atualização Manual
```bash
curl -sSL https://raw.githubusercontent.com/urbancompasspony/bashrc/main/install.sh | bash
```

### Verificação de Mudanças
O script só aplica atualizações se detectar diferenças com a versão atual.

## ⚙️ Personalização

### Modificar Cores do Prompt
Edite as variáveis de cor no início do arquivo:
```bash
# Cores básicas
R="\[\033[0;31m\]"       # Red
G="\[\033[0;32m\]"       # Green  
B="\[\033[0;34m\]"       # Blue

# Cores bold
BR="\[\033[1;31m\]"      # Bold Red
BG="\[\033[1;32m\]"      # Bold Green
BB="\[\033[1;34m\]"      # Bold Blue
```

### Adicionar Aliases Personalizados
```bash
# Adicione ao final do .bashrc
alias meucomando='comando_real'
alias atalho='script_personalizado'
```

### Criar Funções Personalizadas
```bash
minha_funcao() {
    echo "Executando função personalizada"
    # Seu código aqui
}
```

## 🧪 Compatibilidade

### Sistemas Testados
- ✅ **Ubuntu 20.04+**
- ✅ **Debian 11+** 
- ✅ **CentOS/RHEL 8+**
- ✅ **Arch Linux**
- ✅ **EndeavourOS**
- ✅ **Raspberry Pi OS**
- ✅ **Linux Mint**

### Shells Suportados
- ✅ **Bash 4.0+**
- ✅ **Bash 5.0+**
- ⚠️ **Zsh** (compatibilidade limitada)

## 🛠️ Troubleshooting

### Problema: Cores não aparecem
```bash
# Verificar suporte a cores
echo $TERM

# Forçar cores
export TERM=xterm-256color
source ~/.bashrc
```

### Problema: Aliases não funcionam
```bash
# Verificar se estão carregados
alias | grep meucommando

# Recarregar configuração
source ~/.bashrc
```

### Problema: Funções não reconhecidas
```bash
# Verificar se função existe
type nome_da_funcao

# Listar todas as funções
declare -F
```

## 📝 Exemplos de Uso

### Fluxo de Trabalho Típico
```bash
# Navegar para projeto
mkdirg ~/projetos/novo_projeto

# Buscar arquivos
ftext "TODO"

# Comprimir projeto
mkgz projeto.tar.gz *

# Verificar IP
iplan && ipwan

# Monitorar sistema
sync
```

### Administração de Sistema
```bash
# Verificar espaço
TRIM

# Backup com progresso
cpp /arquivo/grande /backup/

# Controle de domínio
domain

# Verificar conectividade
qrcode "$(ipwan)"
```

## 🤝 Contribuição

### Como Contribuir
1. **Fork** o repositório
2. Crie uma **branch** para sua feature (`git checkout -b feature/nova-funcionalidade`)
3. **Commit** suas mudanças (`git commit -am 'Adiciona nova funcionalidade'`)
4. **Push** para a branch (`git push origin feature/nova-funcionalidade`)
5. Abra um **Pull Request**

### Diretrizes
- Mantenha compatibilidade com Bash 4.0+
- Teste em múltiplas distribuições
- Documente novas funções
- Use comentários em português
- Siga o padrão de cores existente

### Reportar Issues
- Descreva o problema detalhadamente
- Inclua informação do sistema (`uname -a`)
- Especifique a versão do Bash (`bash --version`)
- Anexe logs relevantes

## 📄 Licença

Este projeto está licenciado sob a **MIT License** - veja o arquivo [LICENSE](LICENSE) para detalhes.

### Resumo da Licença
- ✅ Uso comercial permitido
- ✅ Modificação permitida  
- ✅ Distribuição permitida
- ✅ Uso privado permitido
- ❌ Responsabilidade limitada
- ❌ Garantia limitada

---

<div align="center">

**🐚 Developed with ❤️ for the command line enthusiasts**

[⭐ Star this repo](https://github.com/urbancompasspony/bashrc) | [🐛 Report Bug](https://github.com/urbancompasspony/bashrc/issues) | [💡 Request Feature](https://github.com/urbancompasspony/bashrc/issues)

</div>
