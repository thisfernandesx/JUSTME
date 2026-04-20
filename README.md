<div align="center">

```
      ██╗██╗   ██╗███████╗████████╗███╗   ███╗███████╗
      ██║██║   ██║██╔════╝╚══██╔══╝████╗ ████║██╔════╝
      ██║██║   ██║███████╗   ██║   ██╔████╔██║█████╗  
 ██   ██║██║   ██║╚════██║   ██║   ██║╚██╔╝██║██╔══╝  
 ╚█████╔╝╚██████╔╝███████║   ██║   ██║ ╚═╝ ██║███████╗
  ╚════╝  ╚═════╝ ╚══════╝   ╚═╝   ╚═╝     ╚═╝╚══════╝
```

# JUSTME PANEL v1.0

**Painel de consulta estilo hacker para Kali Linux e Termux**

![GitHub repo size](https://img.shields.io/github/repo-size/thisfernandesx/JUSTME?color=00ff41&style=flat-square)
![GitHub stars](https://img.shields.io/github/stars/thisfernandesx/JUSTME?color=00ff41&style=flat-square)
![GitHub forks](https://img.shields.io/github/forks/thisfernandesx/JUSTME?color=00ff41&style=flat-square)
![Shell Script](https://img.shields.io/badge/Shell-Bash-00ff41?style=flat-square&logo=gnu-bash)
![Platform](https://img.shields.io/badge/Platform-Kali%20Linux%20%7C%20Termux-00ff41?style=flat-square)

</div>

---

## ⚡ Sobre

> JUSTME é um painel de consulta 100% feito em **Bash (Shell Script)**, com visual estilo hacker, compatível com **Kali Linux** e **Termux**. Desenvolvido para facilitar consultas, gerar dados para testes e usar ferramentas de rede direto no terminal.

---

## 🚀 Instalação

### Kali Linux
```bash
sudo apt install -y curl jq nmap dnsutils whois nikto whatweb
git clone https://github.com/thisfernandesx/JUSTME
cd JUSTME
bash justme.sh
```

### Termux (Android)
```bash
pkg update -y && pkg install -y curl jq nmap dnsutils git
git clone https://github.com/thisfernandesx/JUSTME
cd JUSTME
bash justme.sh
```

---

## 📋 Funções

### 📡 Consultas
| Função | Descrição |
|--------|-----------|
| CEP | Consulta endereço completo pelo CEP |
| CNPJ | Dados públicos de empresas |
| IP | Localização e informações de qualquer IP |
| DDD | Estado e cidades de um DDD |
| BIN | Informações de cartão pelo BIN |

### 🔧 Geradores
| Função | Descrição |
|--------|-----------|
| CPF | Gera CPFs válidos para testes |
| CNPJ | Gera CNPJs válidos para testes |
| RG | Gera RGs válidos para testes |
| Pessoa | Gera dados completos fictícios |

### ✅ Validadores
| Função | Descrição |
|--------|-----------|
| CPF | Valida CPF com algoritmo real |
| CNPJ | Valida CNPJ com algoritmo real |
| RG | Valida RG (SP) com algoritmo real |

### 🌐 Ferramentas de Rede
| Função | Descrição |
|--------|-----------|
| Ping | Testa conectividade com host |
| Traceroute | Rastreia rota de rede |
| Nmap | Scan de portas e serviços |
| DNS Lookup | Consulta registros DNS |
| Whois | Informações de domínio |
| Meu IP | Exibe seu IP público |

### 📧 Email Vazado (HIBP)
| Função | Descrição |
|--------|-----------|
| Senha | Verifica se senha foi vazada (k-anonymity) |
| Email | Verifica email em vazamentos |
| Domínio | Verifica domínio em vazamentos |

### 🔍 Scanner de Vulnerabilidades
| Função | Descrição |
|--------|-----------|
| Scan Rápido | Top portas abertas (nmap -F) |
| Scan Completo | Todos serviços e versões |
| Nikto | Scanner web de vulnerabilidades |
| WhatWeb | Detecta tecnologias do site |
| Headers HTTP | Analisa segurança dos headers |
| Scan Total | Tudo junto em um único scan |

### 🌍 Geolocalização de IP
| Função | Descrição |
|--------|-----------|
| Básica | Cidade, país, ISP e coordenadas |
| Detalhada | Dados de 2 APIs diferentes |
| ASN/ISP | Informações do provedor |
| VPN/Proxy/Tor | Detecta anonimizadores |
| Meu IP | Todas as infos do seu IP |

---

## 📦 Dependências

```bash
curl · jq · nmap · dnsutils · whois · nikto · whatweb · sha1sum
```

---

## ⚠️ Aviso Legal

> Este painel foi criado para fins **educacionais e de aprendizado**.  
> Use apenas em sistemas que você tem **autorização**.  
> O autor não se responsabiliza pelo mau uso das ferramentas.  
> Dados gerados são **100% fictícios** e servem apenas para testes.

---

## 👤 Autor

**thisfernandesx**  
[![GitHub](https://img.shields.io/badge/GitHub-thisfernandesx-00ff41?style=flat-square&logo=github)](https://github.com/thisfernandesx)

---

<div align="center">

**⭐ Se gostou, deixa uma estrela no repositório! ⭐**

</div>
