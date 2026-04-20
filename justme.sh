#!/bin/bash

# ════════════════════════════════════════
#   JUSTME PANEL v1.0
#   By: Migueldev
#   Kali Linux Edition
# ════════════════════════════════════════

# ── CORES ────────────────────────────────
VERDE='\033[1;32m'
CIANO='\033[1;36m'
VERMELHO='\033[1;31m'
AMARELO='\033[1;33m'
BRANCO='\033[1;37m'
CINZA='\033[0;37m'
RESET='\033[0m'
 

# ── FUNÇÕES BÁSICAS ──────────────────────

# Limpa a tela
limpar() {
    clear
}

# Linha separadora
linha() {
    echo -e "${VERDE}══════════════════════════════════════════${RESET}"
}

# Animação de loading
loading() {
    local msg="${1:-Carregando}"
    local chars='|/-\'
    for i in $(seq 1 16); do
        local c="${chars:$(( (i-1) % 4 )):1}"
        echo -ne "\r${CIANO}[$c] ${msg}...${RESET}"
        sleep 0.07
    done
    echo -e "\r${VERDE}[OK] ${msg}... Pronto!    ${RESET}"
}

# Pausar e esperar Enter
pausar() {
    echo ""
    echo -ne "  ${AMARELO}[ENTER] para voltar...${RESET}"
    read -r
}
# ── BANNER ───────────────────────────────
banner() {
    limpar
    echo -e "${VERDE}"
    echo "      ██╗██╗   ██╗███████╗████████╗███╗   ███╗███████╗"
    echo "      ██║██║   ██║██╔════╝╚══██╔══╝████╗ ████║██╔════╝"
    echo "      ██║██║   ██║███████╗   ██║   ██╔████╔██║█████╗  "
    echo " ██   ██║██║   ██║╚════██║   ██║   ██║╚██╔╝██║██╔══╝  "
    echo " ╚█████╔╝╚██████╔╝███████║   ██║   ██║ ╚═╝ ██║███████╗"
    echo "  ╚════╝  ╚═════╝ ╚══════╝   ╚═╝   ╚═╝     ╚═╝╚══════╝"
    echo -e "${CIANO}"
    echo "      ╔══════════════════════════════════╗"
    echo "      ║        JUSTME PANEL v1.0         ║"
    echo "      ║        By: Migueldev            ║"
    echo "      ╚══════════════════════════════════╝"
    echo -e "${CINZA}      ▓▒░ Kali Linux Edition ░▒▓${RESET}"
    echo 
}
# ── MENU PRINCIPAL ───────────────────────
menu_principal() {
    banner
    echo -e "${CIANO}  ┌────────────────────────────────────────┐"
    echo -e "  │      ${VERDE}≡ JUSTME - MENU PRINCIPAL ≡${CIANO}      │"
    echo -e "  ├────────────────────────────────────────┤"
    echo -e "  │   ${VERDE}[1]${CINZA} Consultas                       ${CIANO}│"
    echo -e "  │   ${VERDE}[2]${CINZA} Geradores                       ${CIANO}│"
    echo -e "  │   ${VERDE}[3]${CINZA} Validadores                     ${CIANO}│"
    echo -e "  │   ${VERDE}[4]${CINZA} Ferramentas de Rede             ${CIANO}│"
    echo -e "  │   ${VERDE}[5]${CINZA} Email Vazado (HIBP)             ${CIANO}│"
    echo -e "  │   ${VERDE}[6]${CINZA} Scanner de Vulnerabilidades     ${CIANO}│"
    echo -e "  │   ${VERDE}[7]${CINZA} Geolocalizacao de IP            ${CIANO}│"
    echo -e "  │   ${VERMELHO}[0]${CINZA} Sair                            ${CIANO}│"
    echo -e "  └────────────────────────────────────────┘${RESET}"
    echo ""
    echo -ne "  ${VERDE}root@justme${CIANO}:~# ${RESET}"
    read -r opcao
    case "$opcao" in
        1) menu_consultas ;;
        2) menu_geradores ;;
        3) menu_validadores ;;
        4) menu_rede ;;
        5) menu_hibp ;;
        6) menu_scanner ;;
        7) menu_geoip ;;
        0) sair ;;
        *) echo -e "${VERMELHO}  [!] Opcao invalida!${RESET}"; sleep 1; menu_principal ;;
    esac
}
# ════════════════════════════════════════════
#   MÓDULO 1 — EMAIL VAZADO (HIBP)
# ════════════════════════════════════════════

menu_hibp() {
    banner
    echo -e "${CIANO}  ┌────────────────────────────────────────┐"
    echo -e "  │       ${VERDE}≡ EMAIL VAZADO — HIBP ≡${CIANO}         │"
    echo -e "  ├────────────────────────────────────────┤"
    echo -e "  │   ${VERDE}[1]${CINZA} Verificar Senha Vazada         ${CIANO}│"
    echo -e "  │   ${VERDE}[2]${CINZA} Verificar Email Vazado         ${CIANO}│"
    echo -e "  │   ${VERDE}[3]${CINZA} Verificar Dominio Vazado       ${CIANO}│"
    echo -e "  │   ${AMARELO}[V]${CINZA} Voltar                         ${CIANO}│"
    echo -e "  └────────────────────────────────────────┘${RESET}"
    echo ""
    echo -ne "  ${VERDE}root@hibp${CIANO}:~# ${RESET}"
    read -r opcao
    case "${opcao,,}" in
        1) hibp_senha ;;
        2) hibp_email ;;
        3) hibp_dominio ;;
        v) menu_principal ;;
        *) echo -e "${VERMELHO}  [!] Invalido!${RESET}"; sleep 1; menu_hibp ;;
    esac
}

hibp_senha() {
    banner; linha
    echo -e "  ${VERDE}[ VERIFICAR SENHA VAZADA ]${RESET}"; linha
    echo -e "\n  ${AMARELO}⚠  Sua senha NAO e enviada para nenhum servidor."
    echo -e "     Apenas os 5 primeiros chars do hash SHA1 saem.${RESET}\n"
    echo -ne "  ${CIANO}Digite a senha: ${RESET}"
    read -rs senha
    echo -e "\n"
    loading "Verificando vazamentos"
    echo ""

    if ! command -v sha1sum &>/dev/null; then
        echo -e "  ${VERMELHO}[!] sha1sum nao encontrado!${RESET}"
        pausar; menu_hibp; return
    fi

    local hash prefix suffix resultado count
    hash=$(echo -n "$senha" | sha1sum | cut -d' ' -f1 | tr '[:lower:]' '[:upper:]')
    prefix="${hash:0:5}"
    suffix="${hash:5}"

    resultado=$(curl -s "https://api.pwnedpasswords.com/range/$prefix" \
        -H "User-Agent: JustmePanel/1.0" \
        -H "Add-Padding: true")

    if echo "$resultado" | grep -qi "^${suffix}:"; then
        count=$(echo "$resultado" | grep -i "^${suffix}:" | cut -d':' -f2 | tr -d '[:space:]')
        echo -e "  ${VERMELHO}╔══════════════════════════════════════════╗"
        echo -e "  ║  ⚠  SENHA VAZADA!                        ║"
        echo -e "  ╠══════════════════════════════════════════╣"
        echo -e "  ║  Encontrada em ${BRANCO}${count}${VERMELHO} vazamentos!         ║"
        echo -e "  ║  TROQUE ESSA SENHA AGORA!                ║"
        echo -e "  ╚══════════════════════════════════════════╝${RESET}"
    else
        echo -e "  ${VERDE}╔══════════════════════════════════════════╗"
        echo -e "  ║  ✓  Senha nao encontrada em vazamentos!  ║"
        echo -e "  ║     Mas continue usando senhas fortes!   ║"
        echo -e "  ╚══════════════════════════════════════════╝${RESET}"
    fi

    pausar; menu_hibp
}

hibp_email() {
    banner; linha
    echo -e "  ${VERDE}[ VERIFICAR EMAIL VAZADO ]${RESET}"; linha
    echo -ne "\n  ${CIANO}Digite o email: ${RESET}"; read -r email
    echo ""
    loading "Verificando $email"
    echo ""

    echo -e "  ${VERDE}Email      :${RESET} $email"
    echo -e "  ${VERDE}Dominio    :${RESET} $(echo "$email" | cut -d'@' -f2)"
    echo ""

    # Tenta via HIBP (pode retornar 401 sem chave paga)
    local code
    code=$(curl -s -o /dev/null -w "%{http_code}" \
        "https://haveibeenpwned.com/api/v3/breachedaccount/${email}" \
        -H "User-Agent: JustmePanel/1.0")

    if [ "$code" = "200" ]; then
        echo -e "  ${VERMELHO}[⚠] EMAIL ENCONTRADO EM VAZAMENTOS!${RESET}"
    elif [ "$code" = "404" ]; then
        echo -e "  ${VERDE}[✓] Email nao encontrado em vazamentos conhecidos.${RESET}"
    else
        echo -e "  ${AMARELO}[!] Verificacao automatica indisponivel (API requer chave).${RESET}"
        echo -e "  ${CINZA}    Acesse manualmente para verificar:${RESET}"
    fi

    echo ""
    echo -e "  ${CIANO}── Verifique voce mesmo (gratuito) ──────────${RESET}"
    echo -e "  ${BRANCO}  https://haveibeenpwned.com/account/$email${RESET}"
    echo ""
    echo -e "  ${CIANO}── Outras ferramentas gratuitas ─────────────${RESET}"
    echo -e "  ${CINZA}  https://monitor.firefox.com"
    echo -e "  ${CINZA}  https://breachdirectory.org${RESET}"

    pausar; menu_hibp
}

hibp_dominio() {
    banner; linha
    echo -e "  ${VERDE}[ VERIFICAR DOMINIO VAZADO ]${RESET}"; linha
    echo -ne "\n  ${CIANO}Dominio (ex: gmail.com): ${RESET}"; read -r dominio
    echo ""
    loading "Verificando dominio $dominio"
    echo ""

    local resultado
    resultado=$(curl -s "https://haveibeenpwned.com/api/v3/breaches?domain=$dominio" \
        -H "User-Agent: JustmePanel/1.0")

    local count
    count=$(echo "$resultado" | grep -o '"Name"' | wc -l)

    if [ "$count" -gt 0 ]; then
        echo -e "  ${VERMELHO}[⚠] Dominio encontrado em ${count} vazamento(s)!${RESET}"
        echo ""
        echo -e "  ${CIANO}Vazamentos:${RESET}"
        echo "$resultado" | grep -o '"Name":"[^"]*"' | cut -d'"' -f4 | \
        while read -r nome; do
            echo -e "  ${VERMELHO}  ▸${RESET} $nome"
        done
    else
        echo -e "  ${VERDE}[✓] Nenhum vazamento publico encontrado para: $dominio${RESET}"
    fi

    pausar; menu_hibp
}
# ════════════════════════════════════════════
#   MÓDULO 2 — SCANNER DE VULNERABILIDADES
# ════════════════════════════════════════════

menu_scanner() {
    banner
    echo -e "${CIANO}  ┌────────────────────────────────────────┐"
    echo -e "  │  ${VERDE}≡ SCANNER DE VULNERABILIDADES ≡${CIANO}     │"
    echo -e "  ├────────────────────────────────────────┤"
    echo -e "  │   ${VERDE}[1]${CINZA} Scan Rapido de Portas          ${CIANO}│"
    echo -e "  │   ${VERDE}[2]${CINZA} Scan Completo com Versoes      ${CIANO}│"
    echo -e "  │   ${VERDE}[3]${CINZA} Scanner Web (nikto)            ${CIANO}│"
    echo -e "  │   ${VERDE}[4]${CINZA} Detectar Tecnologias (whatweb) ${CIANO}│"
    echo -e "  │   ${VERDE}[5]${CINZA} Analisar Headers HTTP          ${CIANO}│"
    echo -e "  │   ${VERDE}[6]${CINZA} Scan Completo (tudo junto)     ${CIANO}│"
    echo -e "  │   ${AMARELO}[V]${CINZA} Voltar                         ${CIANO}│"
    echo -e "  └────────────────────────────────────────┘${RESET}"
    echo ""
    echo -e "  ${AMARELO}⚠  Use apenas em seus proprios sistemas!${RESET}"
    echo ""
    echo -ne "  ${VERDE}root@scanner${CIANO}:~# ${RESET}"
    read -r opcao
    case "${opcao,,}" in
        1) scan_rapido ;;
        2) scan_versoes ;;
        3) scan_nikto ;;
        4) scan_whatweb ;;
        5) scan_headers ;;
        6) scan_tudo ;;
        v) menu_principal ;;
        *) echo -e "${VERMELHO}  [!] Invalido!${RESET}"; sleep 1; menu_scanner ;;
    esac
}

scan_rapido() {
    banner; linha
    echo -e "  ${VERDE}[ SCAN RAPIDO DE PORTAS ]${RESET}"; linha
    echo -ne "\n  ${CIANO}Alvo (IP ou dominio): ${RESET}"; read -r alvo
    echo ""
    echo -e "  ${CIANO}[*] Escaneando portas em: ${BRANCO}$alvo${RESET}\n"

    if ! command -v nmap &>/dev/null; then
        echo -e "  ${VERMELHO}[!] Instale: apt install nmap${RESET}"
        pausar; menu_scanner; return
    fi

    echo -e "  ${VERDE}── Portas Abertas ──────────────────────────${RESET}"
    nmap -F --open -T4 "$alvo" 2>/dev/null | grep -E "^[0-9]+|open|filtered"
    echo ""
    echo -e "  ${VERDE}── Sistema Operacional (estimado) ──────────${RESET}"
    nmap -O "$alvo" 2>/dev/null | grep -i "Running\|OS details\|CPE" | head -5

    pausar; menu_scanner
}

scan_versoes() {
    banner; linha
    echo -e "  ${VERDE}[ SCAN COMPLETO COM VERSOES ]${RESET}"; linha
    echo -ne "\n  ${CIANO}Alvo (IP ou dominio): ${RESET}"; read -r alvo
    echo ""
    echo -e "  ${AMARELO}[*] Pode demorar alguns minutos...${RESET}\n"

    if ! command -v nmap &>/dev/null; then
        echo -e "  ${VERMELHO}[!] Instale: apt install nmap${RESET}"
        pausar; menu_scanner; return
    fi

    nmap -sV -sC -T4 --open "$alvo" 2>/dev/null

    pausar; menu_scanner
}

scan_nikto() {
    banner; linha
    echo -e "  ${VERDE}[ SCANNER WEB — NIKTO ]${RESET}"; linha
    echo -e "  ${CINZA}Detecta vulnerabilidades em servidores web${RESET}"; linha
    echo -ne "\n  ${CIANO}URL (ex: http://site.com): ${RESET}"; read -r alvo
    echo ""
    echo -e "  ${AMARELO}[*] Iniciando nikto... aguarde.${RESET}\n"

    if ! command -v nikto &>/dev/null; then
        echo -e "  ${VERMELHO}[!] Instale: apt install nikto${RESET}"
        pausar; menu_scanner; return
    fi

    nikto -h "$alvo" -maxtime 120 2>/dev/null | \
        grep -v "^-\|Nikto\|rkhunter\|#" | head -40

    pausar; menu_scanner
}

scan_whatweb() {
    banner; linha
    echo -e "  ${VERDE}[ DETECTAR TECNOLOGIAS — WHATWEB ]${RESET}"; linha
    echo -e "  ${CINZA}CMS, frameworks, linguagens, versoes e mais${RESET}"; linha
    echo -ne "\n  ${CIANO}URL (ex: https://site.com): ${RESET}"; read -r alvo
    echo ""
    loading "Detectando tecnologias"
    echo ""

    if ! command -v whatweb &>/dev/null; then
        echo -e "  ${VERMELHO}[!] Instale: apt install whatweb${RESET}"
        pausar; menu_scanner; return
    fi

    echo -e "  ${VERDE}── Tecnologias Detectadas ──────────────────${RESET}\n"
    whatweb -v "$alvo" 2>/dev/null | grep -v "^$" | \
        sed "s/\[/${VERDE}[/g" | head -35

    pausar; menu_scanner
}

scan_headers() {
    banner; linha
    echo -e "  ${VERDE}[ ANALISAR HEADERS HTTP ]${RESET}"; linha
    echo -e "  ${CINZA}Verifica headers de seguranca do servidor${RESET}"; linha
    echo -ne "\n  ${CIANO}URL (ex: https://site.com): ${RESET}"; read -r alvo
    echo ""
    loading "Analisando headers"
    echo ""

    local headers
    headers=$(curl -s -I --max-time 10 "$alvo" 2>/dev/null)

    echo -e "  ${VERDE}── Headers Recebidos ───────────────────────${RESET}"
    echo "$headers" | head -20 | while IFS= read -r line; do
        echo -e "  ${CINZA}$line${RESET}"
    done

    echo ""
    echo -e "  ${VERDE}── Analise de Seguranca ────────────────────${RESET}"

    local checks=(
        "Strict-Transport-Security:HSTS (HTTPS forçado)"
        "X-Frame-Options:Clickjacking Protection"
        "X-Content-Type-Options:MIME Sniffing Block"
        "Content-Security-Policy:Content Security Policy"
        "X-XSS-Protection:XSS Protection"
        "Referrer-Policy:Referrer Policy"
        "Permissions-Policy:Permissions Policy"
    )

    for item in "${checks[@]}"; do
        local header="${item%%:*}"
        local nome="${item##*:}"
        if echo "$headers" | grep -qi "$header"; then
            echo -e "  ${VERDE}[✓]${RESET} $nome"
        else
            echo -e "  ${VERMELHO}[✗]${RESET} $nome ${VERMELHO}— AUSENTE (risco!)${RESET}"
        fi
    done

    pausar; menu_scanner
}

scan_tudo() {
    banner; linha
    echo -e "  ${VERDE}[ SCAN COMPLETO — TUDO JUNTO ]${RESET}"; linha
    echo -ne "\n  ${CIANO}Alvo (IP, dominio ou URL): ${RESET}"; read -r alvo
    echo ""
    echo -e "  ${AMARELO}[*] Scan completo iniciado. Aguarde...${RESET}\n"

    echo -e "${VERDE}══ [1/4] PORTAS ABERTAS ══════════════════════${RESET}"
    command -v nmap &>/dev/null \
        && nmap -F --open -T4 "$alvo" 2>/dev/null | grep -E "open" \
        || echo -e "  ${VERMELHO}nmap nao instalado${RESET}"

    echo -e "\n${VERDE}══ [2/4] TECNOLOGIAS ═════════════════════════${RESET}"
    command -v whatweb &>/dev/null \
        && whatweb "$alvo" 2>/dev/null | head -5 \
        || echo -e "  ${VERMELHO}whatweb nao instalado${RESET}"

    echo -e "\n${VERDE}══ [3/4] HEADERS HTTP ════════════════════════${RESET}"
    curl -s -I --max-time 10 "$alvo" 2>/dev/null | head -15

    echo -e "\n${VERDE}══ [4/4] DNS ══════════════════════════════════${RESET}"
    command -v nslookup &>/dev/null \
        && nslookup "$alvo" 2>/dev/null | head -8 \
        || echo -e "  ${VERMELHO}nslookup nao instalado${RESET}"

    pausar; menu_scanner
}
# ════════════════════════════════════════════
#   MÓDULO 3 — GEOLOCALIZAÇÃO DE IP
# ════════════════════════════════════════════

menu_geoip() {
    banner
    echo -e "${CIANO}  ┌────────────────────────────────────────┐"
    echo -e "  │      ${VERDE}≡ GEOLOCALIZAÇÃO DE IP ≡${CIANO}         │"
    echo -e "  ├────────────────────────────────────────┤"
    echo -e "  │   ${VERDE}[1]${CINZA} Localizacao Basica             ${CIANO}│"
    echo -e "  │   ${VERDE}[2]${CINZA} Localizacao Detalhada          ${CIANO}│"
    echo -e "  │   ${VERDE}[3]${CINZA} Informacoes de ASN e ISP       ${CIANO}│"
    echo -e "  │   ${VERDE}[4]${CINZA} Detectar VPN / Proxy / Tor     ${CIANO}│"
    echo -e "  │   ${VERDE}[5]${CINZA} Meu IP Completo                ${CIANO}│"
    echo -e "  │   ${AMARELO}[V]${CINZA} Voltar                         ${CIANO}│"
    echo -e "  └────────────────────────────────────────┘${RESET}"
    echo ""
    echo -ne "  ${VERDE}root@geoip${CIANO}:~# ${RESET}"
    read -r opcao
    case "${opcao,,}" in
        1) geo_basico ;;
        2) geo_detalhado ;;
        3) geo_asn ;;
        4) geo_vpn ;;
        5) geo_meuip ;;
        v) menu_principal ;;
        *) echo -e "${VERMELHO}  [!] Invalido!${RESET}"; sleep 1; menu_geoip ;;
    esac
}

# ── Localizacao Basica ─────────────────────
geo_basico() {
    banner; linha
    echo -e "  ${VERDE}[ LOCALIZAÇÃO BÁSICA ]${RESET}"; linha
    echo -ne "\n  ${CIANO}IP (Enter = seu IP): ${RESET}"; read -r ip
    echo ""
    loading "Geolocalizando IP"
    echo ""

    local url r
    [ -z "$ip" ] && url="https://ipinfo.io/json" || url="https://ipinfo.io/$ip/json"
    r=$(curl -s "$url")

    echo -e "  ${VERDE}╔══════════════════════════════════════════╗"
    echo -e "  ║          LOCALIZAÇÃO DO IP               ║"
    echo -e "  ╠══════════════════════════════════════════╣"
    echo -e "  ║ ${CIANO}IP         :${RESET} $(echo "$r"|grep -o '"ip":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ║ ${CIANO}Cidade     :${RESET} $(echo "$r"|grep -o '"city":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ║ ${CIANO}Regiao     :${RESET} $(echo "$r"|grep -o '"region":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ║ ${CIANO}Pais       :${RESET} $(echo "$r"|grep -o '"country":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ║ ${CIANO}CEP        :${RESET} $(echo "$r"|grep -o '"postal":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ║ ${CIANO}Coords     :${RESET} $(echo "$r"|grep -o '"loc":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ║ ${CIANO}Fuso       :${RESET} $(echo "$r"|grep -o '"timezone":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ║ ${CIANO}ISP/Org    :${RESET} $(echo "$r"|grep -o '"org":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ╚══════════════════════════════════════════╝${RESET}"

    local coords
    coords=$(echo "$r"|grep -o '"loc":"[^"]*"'|cut -d'"' -f4)
    if [ -n "$coords" ]; then
        echo ""
        echo -e "  ${CIANO}Ver no mapa:${RESET}"
        echo -e "  ${BRANCO}https://maps.google.com/?q=$coords${RESET}"
    fi

    pausar; menu_geoip
}

# ── Localizacao Detalhada ──────────────────
geo_detalhado() {
    banner; linha
    echo -e "  ${VERDE}[ LOCALIZAÇÃO DETALHADA ]${RESET}"; linha
    echo -ne "\n  ${CIANO}IP (Enter = seu IP): ${RESET}"; read -r ip
    echo ""
    loading "Consultando multiplas APIs"
    echo ""

    local target
    [ -z "$ip" ] && target="" || target="/$ip"

    # API 1 — ipinfo.io
    local r1
    r1=$(curl -s "https://ipinfo.io${target}/json")

    # API 2 — ip-api.com (mais detalhes)
    local alvo2
    [ -z "$ip" ] && alvo2="" || alvo2="$ip"
    local r2
    r2=$(curl -s "http://ip-api.com/json/$alvo2?fields=status,country,countryCode,regionName,city,zip,lat,lon,isp,org,as,mobile,proxy,hosting")

    echo -e "  ${VERDE}── Dados Gerais ─────────────────────────────${RESET}"
    echo -e "  ${CIANO}IP         :${RESET} $(echo "$r1"|grep -o '"ip":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ${CIANO}Hostname   :${RESET} $(echo "$r1"|grep -o '"hostname":"[^"]*"'|cut -d'"' -f4)"
    echo ""
    echo -e "  ${VERDE}── Localização ──────────────────────────────${RESET}"
    echo -e "  ${CIANO}Pais       :${RESET} $(echo "$r2"|grep -o '"country":"[^"]*"'|cut -d'"' -f4) ($(echo "$r2"|grep -o '"countryCode":"[^"]*"'|cut -d'"' -f4))"
    echo -e "  ${CIANO}Estado     :${RESET} $(echo "$r2"|grep -o '"regionName":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ${CIANO}Cidade     :${RESET} $(echo "$r2"|grep -o '"city":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ${CIANO}CEP        :${RESET} $(echo "$r2"|grep -o '"zip":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ${CIANO}Latitude   :${RESET} $(echo "$r2"|grep -o '"lat":[^,}]*'|cut -d':' -f2)"
    echo -e "  ${CIANO}Longitude  :${RESET} $(echo "$r2"|grep -o '"lon":[^,}]*'|cut -d':' -f2)"
    echo ""
    echo -e "  ${VERDE}── Rede ─────────────────────────────────────${RESET}"
    echo -e "  ${CIANO}ISP        :${RESET} $(echo "$r2"|grep -o '"isp":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ${CIANO}Org        :${RESET} $(echo "$r2"|grep -o '"org":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ${CIANO}ASN        :${RESET} $(echo "$r2"|grep -o '"as":"[^"]*"'|cut -d'"' -f4)"
    echo ""
    echo -e "  ${VERDE}── Flags ────────────────────────────────────${RESET}"

    local mobile proxy hosting
    mobile=$(echo "$r2"|grep -o '"mobile":[^,}]*'|cut -d':' -f2|tr -d ' ')
    proxy=$(echo "$r2"|grep -o '"proxy":[^,}]*'|cut -d':' -f2|tr -d ' ')
    hosting=$(echo "$r2"|grep -o '"hosting":[^,}]*'|cut -d':' -f2|tr -d ' ')

    [ "$mobile" = "true" ]  && echo -e "  ${AMARELO}[!] Conexao Mobile detectada${RESET}"   || echo -e "  ${VERDE}[✓] Nao e Mobile${RESET}"
    [ "$proxy" = "true" ]   && echo -e "  ${AMARELO}[!] Proxy detectado${RESET}"            || echo -e "  ${VERDE}[✓] Nao e Proxy${RESET}"
    [ "$hosting" = "true" ] && echo -e "  ${AMARELO}[!] Servidor de Hosting detectado${RESET}" || echo -e "  ${VERDE}[✓] Nao e Hosting${RESET}"

    pausar; menu_geoip
}

# ── ASN e ISP ──────────────────────────────
geo_asn() {
    banner; linha
    echo -e "  ${VERDE}[ INFORMAÇÕES DE ASN E ISP ]${RESET}"; linha
    echo -ne "\n  ${CIANO}IP (Enter = seu IP): ${RESET}"; read -r ip
    echo ""
    loading "Buscando ASN e ISP"
    echo ""

    local alvo
    [ -z "$ip" ] && alvo="$(curl -s4 https://api.ipify.org)" || alvo="$ip"

    local r
    r=$(curl -s "https://ipinfo.io/$alvo/json")

    local asn
    asn=$(echo "$r" | grep -o '"org":"[^"]*"' | cut -d'"' -f4 | cut -d' ' -f1)

    echo -e "  ${VERDE}IP         :${RESET} $alvo"
    echo -e "  ${VERDE}ASN        :${RESET} $(echo "$r"|grep -o '"org":"[^"]*"'|cut -d'"' -f4|cut -d' ' -f1)"
    echo -e "  ${VERDE}ISP/Org    :${RESET} $(echo "$r"|grep -o '"org":"[^"]*"'|cut -d'"' -f4|cut -d' ' -f2-)"
    echo ""

    if [ -n "$asn" ]; then
        echo -e "  ${CIANO}Consultando dados do ASN...${RESET}"
        local rasn
        rasn=$(curl -s "https://ipinfo.io/${asn}/json")
        echo -e "  ${VERDE}Nome ASN   :${RESET} $(echo "$rasn"|grep -o '"name":"[^"]*"'|cut -d'"' -f4)"
        echo -e "  ${VERDE}Pais ASN   :${RESET} $(echo "$rasn"|grep -o '"country":"[^"]*"'|cut -d'"' -f4)"
        echo -e "  ${VERDE}Prefixos   :${RESET} $(echo "$rasn"|grep -o '"prefixes":\[[^]]*\]'|grep -o '"[0-9./]*"'|wc -l) blocos"
    fi

    pausar; menu_geoip
}

# ── Detectar VPN / Proxy / Tor ─────────────
geo_vpn() {
    banner; linha
    echo -e "  ${VERDE}[ DETECTAR VPN / PROXY / TOR ]${RESET}"; linha
    echo -ne "\n  ${CIANO}IP (Enter = seu IP): ${RESET}"; read -r ip
    echo ""
    loading "Verificando anonimato"
    echo ""

    local alvo
    [ -z "$ip" ] && alvo="$(curl -s4 https://api.ipify.org)" || alvo="$ip"

    # ip-api.com
    local r
    r=$(curl -s "http://ip-api.com/json/$alvo?fields=proxy,hosting,mobile,isp,org,as")

    # ipinfo.io privacy
    local rp
    rp=$(curl -s "https://ipinfo.io/$alvo/privacy" 2>/dev/null)

    echo -e "  ${VERDE}IP Verificado: ${BRANCO}$alvo${RESET}\n"

    echo -e "  ${VERDE}── Deteccao ip-api.com ──────────────────────${RESET}"
    local proxy hosting mobile
    proxy=$(echo "$r"|grep -o '"proxy":[^,}]*'|cut -d':' -f2|tr -d ' ')
    hosting=$(echo "$r"|grep -o '"hosting":[^,}]*'|cut -d':' -f2|tr -d ' ')
    mobile=$(echo "$r"|grep -o '"mobile":[^,}]*'|cut -d':' -f2|tr -d ' ')

    [ "$proxy" = "true" ]   && echo -e "  ${VERMELHO}[⚠] PROXY / VPN detectado!${RESET}"       || echo -e "  ${VERDE}[✓] Sem Proxy/VPN detectado${RESET}"
    [ "$hosting" = "true" ] && echo -e "  ${AMARELO}[!] IP de Datacenter/Hosting${RESET}"      || echo -e "  ${VERDE}[✓] Nao e Datacenter${RESET}"
    [ "$mobile" = "true" ]  && echo -e "  ${AMARELO}[!] Conexao via rede Mobile${RESET}"       || echo -e "  ${VERDE}[✓] Nao e Mobile${RESET}"

    echo ""
    echo -e "  ${VERDE}── Deteccao ipinfo.io ───────────────────────${RESET}"
    if [ -n "$rp" ]; then
        local vpn tor proxy2 hosting2
        vpn=$(echo "$rp"|grep -o '"vpn":[^,}]*'|cut -d':' -f2|tr -d ' ')
        tor=$(echo "$rp"|grep -o '"tor":[^,}]*'|cut -d':' -f2|tr -d ' ')
        proxy2=$(echo "$rp"|grep -o '"proxy":[^,}]*'|cut -d':' -f2|tr -d ' ')
        hosting2=$(echo "$rp"|grep -o '"hosting":[^,}]*'|cut -d':' -f2|tr -d ' ')

        [ "$vpn" = "true" ]      && echo -e "  ${VERMELHO}[⚠] VPN detectada!${RESET}"           || echo -e "  ${VERDE}[✓] Sem VPN${RESET}"
        [ "$tor" = "true" ]      && echo -e "  ${VERMELHO}[⚠] TOR detectado!${RESET}"           || echo -e "  ${VERDE}[✓] Sem TOR${RESET}"
        [ "$proxy2" = "true" ]   && echo -e "  ${VERMELHO}[⚠] Proxy detectado!${RESET}"         || echo -e "  ${VERDE}[✓] Sem Proxy${RESET}"
        [ "$hosting2" = "true" ] && echo -e "  ${AMARELO}[!] Hosting/Datacenter${RESET}"        || echo -e "  ${VERDE}[✓] IP residencial${RESET}"
    else
        echo -e "  ${CINZA}(API de privacidade requer plano pago para este IP)${RESET}"
    fi

    pausar; menu_geoip
}

# ── Meu IP Completo ────────────────────────
geo_meuip() {
    banner; linha
    echo -e "  ${VERDE}[ MEU IP COMPLETO ]${RESET}"; linha
    echo ""
    loading "Coletando suas informacoes"
    echo ""

    local ip4 ip6 r
    ip4=$(curl -s4 --max-time 5 https://api.ipify.org 2>/dev/null || echo "N/A")
    ip6=$(curl -s6 --max-time 5 https://api6.ipify.org 2>/dev/null || echo "N/A")
    r=$(curl -s "http://ip-api.com/json/$ip4?fields=country,countryCode,regionName,city,zip,lat,lon,isp,org,as,proxy,hosting,mobile")

    echo -e "  ${VERDE}╔══════════════════════════════════════════╗"
    echo -e "  ║           MEU IP COMPLETO                ║"
    echo -e "  ╠══════════════════════════════════════════╣"
    echo -e "  ║ ${CIANO}IPv4       :${RESET} $ip4"
    echo -e "  ║ ${CIANO}IPv6       :${RESET} $ip6"
    echo -e "  ╠══════════════════════════════════════════╣"
    echo -e "  ║ ${CIANO}Pais       :${RESET} $(echo "$r"|grep -o '"country":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ║ ${CIANO}Estado     :${RESET} $(echo "$r"|grep -o '"regionName":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ║ ${CIANO}Cidade     :${RESET} $(echo "$r"|grep -o '"city":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ║ ${CIANO}CEP        :${RESET} $(echo "$r"|grep -o '"zip":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ║ ${CIANO}Latitude   :${RESET} $(echo "$r"|grep -o '"lat":[^,}]*'|cut -d':' -f2)"
    echo -e "  ║ ${CIANO}Longitude  :${RESET} $(echo "$r"|grep -o '"lon":[^,}]*'|cut -d':' -f2)"
    echo -e "  ╠══════════════════════════════════════════╣"
    echo -e "  ║ ${CIANO}ISP        :${RESET} $(echo "$r"|grep -o '"isp":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ║ ${CIANO}ASN        :${RESET} $(echo "$r"|grep -o '"as":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ╠══════════════════════════════════════════╣"

    local proxy hosting mobile
    proxy=$(echo "$r"|grep -o '"proxy":[^,}]*'|cut -d':' -f2|tr -d ' ')
    hosting=$(echo "$r"|grep -o '"hosting":[^,}]*'|cut -d':' -f2|tr -d ' ')
    mobile=$(echo "$r"|grep -o '"mobile":[^,}]*'|cut -d':' -f2|tr -d ' ')

    [ "$proxy" = "true" ]   && echo -e "  ║ ${VERMELHO}[⚠] VPN/Proxy ATIVO${RESET}" || echo -e "  ║ ${VERDE}[✓] Sem VPN/Proxy${RESET}"
    [ "$hosting" = "true" ] && echo -e "  ║ ${AMARELO}[!] IP de Datacenter${RESET}"  || echo -e "  ║ ${VERDE}[✓] IP Residencial${RESET}"
    [ "$mobile" = "true" ]  && echo -e "  ║ ${AMARELO}[!] Rede Mobile${RESET}"       || echo -e "  ║ ${VERDE}[✓] Rede Fixa${RESET}"

    echo -e "  ╚══════════════════════════════════════════╝${RESET}"

    local lat lon
    lat=$(echo "$r"|grep -o '"lat":[^,}]*'|cut -d':' -f2)
    lon=$(echo "$r"|grep -o '"lon":[^,}]*'|cut -d':' -f2)
    [ -n "$lat" ] && echo -e "\n  ${CIANO}Ver no mapa: ${BRANCO}https://maps.google.com/?q=${lat},${lon}${RESET}"

    pausar; menu_geoip
}

# ── SAIR ─────────────────────────────────
sair() {
    limpar
    echo -e "${VERDE}"
    echo "  ╔════════════════════════════════╗"
    echo "  ║   Valeu por usar o JUSTME! 🚀  ║"
    echo "  ╚════════════════════════════════╝"
    echo -e "${RESET}"
    exit 0
}
# ── MENU CONSULTAS ───────────────────────
menu_consultas() {
    banner
    echo -e "${CIANO}  ┌──────────────────────────────────┐"
    echo -e "  │        ${VERDE}≡ CONSULTAS ≡${CIANO}             │"
    echo -e "  ├──────────────────────────────────┤"
    echo -e "  │   ${VERDE}[1]${CINZA} Consultar CEP             ${CIANO}│"
    echo -e "  │   ${VERDE}[2]${CINZA} Consultar CNPJ            ${CIANO}│"
    echo -e "  │   ${VERDE}[3]${CINZA} Consultar IP              ${CIANO}│"
    echo -e "  │   ${VERDE}[4]${CINZA} Consultar DDD             ${CIANO}│"
    echo -e "  │   ${VERDE}[5]${CINZA} Consultar BIN             ${CIANO}│"
    echo -e "  │   ${AMARELO}[V]${CINZA} Voltar                    ${CIANO}│"
    echo -e "  └──────────────────────────────────┘${RESET}"
    echo ""
    echo -ne "  ${VERDE}root@consultas${CIANO}:~# ${RESET}"
    read -r opcao

    case "${opcao,,}" in
        1) consultar_cep ;;
        2) consultar_cnpj ;;
        3) consultar_ip ;;
        4) consultar_ddd ;;
        5) consultar_bin ;;
        v) menu_principal ;;
        *) echo -e "${VERMELHO}  [!] Invalido!${RESET}"; sleep 1; menu_consultas ;;
    esac
}
consultar_cep() {
    banner; linha
    echo -e "  ${VERDE}[ CONSULTA DE CEP ]${RESET}"
    linha
    echo -ne "\n  ${CIANO}Digite o CEP: ${RESET}"
    read -r cep
    cep="${cep//-/}"
    echo ""
    loading "Consultando CEP $cep"
    echo ""

    local r
    r=$(curl -s "https://viacep.com.br/ws/$cep/json/")

    if echo "$r" | grep -q '"erro"'; then
        echo -e "  ${VERMELHO}[x] CEP nao encontrado!${RESET}"
    else
        echo -e "  ${VERDE}CEP        :${RESET} $cep"
        echo -e "  ${VERDE}Rua        :${RESET} $(echo "$r"|grep -o '"logradouro":"[^"]*"'|cut -d'"' -f4)"
        echo -e "  ${VERDE}Bairro     :${RESET} $(echo "$r"|grep -o '"bairro":"[^"]*"'|cut -d'"' -f4)"
        echo -e "  ${VERDE}Cidade     :${RESET} $(echo "$r"|grep -o '"localidade":"[^"]*"'|cut -d'"' -f4)"
        echo -e "  ${VERDE}Estado     :${RESET} $(echo "$r"|grep -o '"uf":"[^"]*"'|cut -d'"' -f4)"
        echo -e "  ${VERDE}IBGE       :${RESET} $(echo "$r"|grep -o '"ibge":"[^"]*"'|cut -d'"' -f4)"
    fi

    pausar
    menu_consultas
}
consultar_cnpj() {
    banner; linha
    echo -e "  ${VERDE}[ CONSULTA DE CNPJ ]${RESET}"
    linha
    echo -ne "\n  ${CIANO}Digite o CNPJ: ${RESET}"
    read -r cnpj
    cnpj="${cnpj//[.\/-]/}"
    echo ""
    loading "Consultando CNPJ $cnpj"
    echo ""

    local r
    r=$(curl -s "https://brasilapi.com.br/api/cnpj/v1/$cnpj")

    if echo "$r" | grep -q '"message"'; then
        echo -e "  ${VERMELHO}[x] CNPJ invalido ou nao encontrado!${RESET}"
    else
        echo -e "  ${VERDE}CNPJ       :${RESET} $cnpj"
        echo -e "  ${VERDE}Razao      :${RESET} $(echo "$r"|grep -o '"razao_social":"[^"]*"'|cut -d'"' -f4)"
        echo -e "  ${VERDE}Fantasia   :${RESET} $(echo "$r"|grep -o '"nome_fantasia":"[^"]*"'|cut -d'"' -f4)"
        echo -e "  ${VERDE}Situacao   :${RESET} $(echo "$r"|grep -o '"descricao_situacao_cadastral":"[^"]*"'|cut -d'"' -f4)"
        echo -e "  ${VERDE}Municipio  :${RESET} $(echo "$r"|grep -o '"municipio":"[^"]*"'|cut -d'"' -f4) / $(echo "$r"|grep -o '"uf":"[^"]*"'|cut -d'"' -f4)"
        echo -e "  ${VERDE}Abertura   :${RESET} $(echo "$r"|grep -o '"data_inicio_atividade":"[^"]*"'|cut -d'"' -f4)"
    fi

    pausar
    menu_consultas
}
consultar_ip() {
    banner; linha
    echo -e "  ${VERDE}[ CONSULTA DE IP ]${RESET}"
    linha
    echo -ne "\n  ${CIANO}Digite o IP (Enter = seu IP): ${RESET}"
    read -r ip
    echo ""
    loading "Consultando IP"
    echo ""

    local url r
    [ -z "$ip" ] && url="https://ipinfo.io/json" || url="https://ipinfo.io/$ip/json"
    r=$(curl -s "$url")

    echo -e "  ${VERDE}IP         :${RESET} $(echo "$r"|grep -o '"ip":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ${VERDE}Hostname   :${RESET} $(echo "$r"|grep -o '"hostname":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ${VERDE}Cidade     :${RESET} $(echo "$r"|grep -o '"city":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ${VERDE}Regiao     :${RESET} $(echo "$r"|grep -o '"region":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ${VERDE}Pais       :${RESET} $(echo "$r"|grep -o '"country":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ${VERDE}ISP/Org    :${RESET} $(echo "$r"|grep -o '"org":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ${VERDE}Timezone   :${RESET} $(echo "$r"|grep -o '"timezone":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ${VERDE}Coords     :${RESET} $(echo "$r"|grep -o '"loc":"[^"]*"'|cut -d'"' -f4)"

    pausar
    menu_consultas
}
consultar_ddd() {
    banner; linha
    echo -e "  ${VERDE}[ CONSULTA DE DDD ]${RESET}"
    linha
    echo -ne "\n  ${CIANO}Digite o DDD (ex: 21): ${RESET}"
    read -r ddd
    echo ""
    loading "Consultando DDD $ddd"
    echo ""

    local r
    r=$(curl -s "https://brasilapi.com.br/api/ddd/v1/$ddd")

    if echo "$r" | grep -q '"message"'; then
        echo -e "  ${VERMELHO}[x] DDD nao encontrado!${RESET}"
    else
        echo -e "  ${VERDE}DDD        :${RESET} $ddd"
        echo -e "  ${VERDE}Estado     :${RESET} $(echo "$r"|grep -o '"state":"[^"]*"'|cut -d'"' -f4)"
        echo -e "\n  ${CIANO}Cidades que usam esse DDD:${RESET}"
        echo "$r"|grep -o '"cities":\[[^]]*\]'|sed 's/"cities":\[//;s/\]//;s/"//g;s/,/\n/g'|sed 's/^/    - /'
    fi

    pausar
    menu_consultas
}

consultar_bin() {
    banner; linha
    echo -e "  ${VERDE}[ CONSULTA DE BIN ]${RESET}"
    linha
    echo -ne "\n  ${CIANO}Digite o BIN (6 primeiros digitos do cartao): ${RESET}"
    read -r bin
    echo ""
    loading "Consultando BIN $bin"
    echo ""

    local r
    r=$(curl -s "https://lookup.binlist.net/$bin" -H "Accept-Version: 3")

    echo -e "  ${VERDE}BIN        :${RESET} $bin"
    echo -e "  ${VERDE}Bandeira   :${RESET} $(echo "$r"|grep -o '"scheme":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ${VERDE}Tipo       :${RESET} $(echo "$r"|grep -o '"type":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ${VERDE}Pais       :${RESET} $(echo "$r"|grep -o '"alpha2":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ${VERDE}Banco      :${RESET} $(echo "$r"|grep -o '"name":"[^"]*"'|head -1|cut -d'"' -f4)"

    pausar
    menu_consultas
}
# ── MENU GERADORES ───────────────────────
menu_geradores() {
    banner
    echo -e "${CIANO}  ┌──────────────────────────────────┐"
    echo -e "  │        ${VERDE}≡ GERADORES ≡${CIANO}             │"
    echo -e "  ├──────────────────────────────────┤"
    echo -e "  │   ${VERDE}[1]${CINZA} Gerar CPF                 ${CIANO}│"
    echo -e "  │   ${VERDE}[2]${CINZA} Gerar CNPJ                ${CIANO}│"
    echo -e "  │   ${VERDE}[3]${CINZA} Gerar RG                  ${CIANO}│"
    echo -e "  │   ${VERDE}[4]${CINZA} Gerar Pessoa Completa     ${CIANO}│"
    echo -e "  │   ${AMARELO}[V]${CINZA} Voltar                    ${CIANO}│"
    echo -e "  └──────────────────────────────────┘${RESET}"
    echo ""
    echo -ne "  ${VERDE}root@geradores${CIANO}:~# ${RESET}"
    read -r opcao

    case "${opcao,,}" in
        1) gerar_cpf ;;
        2) gerar_cnpj ;;
        3) gerar_rg ;;
        4) gerar_pessoa ;;
        v) menu_principal ;;
        *) echo -e "${VERMELHO}  [!] Invalido!${RESET}"; sleep 1; menu_geradores ;;
    esac
}
gerar_cpf() {
    banner; linha
    echo -e "  ${VERDE}[ GERADOR DE CPF ]${RESET}"; linha
    echo -ne "\n  ${CIANO}Quantos CPFs gerar? [1-10]: ${RESET}"; read -r qtd
    [[ ! "$qtd" =~ ^([1-9]|10)$ ]] && qtd=1
    echo ""; loading "Gerando $qtd CPF(s)"; echo ""

    for ((n=1; n<=qtd; n++)); do
        local d=()
        for i in $(seq 0 8); do d+=($((RANDOM % 10))); done
        local s=0
        for i in $(seq 0 8); do s=$((s + d[i] * (10 - i))); done
        local r=$((s % 11))
        d[9]=$( [ $r -lt 2 ] && echo 0 || echo $((11 - r)) )
        s=0
        for i in $(seq 0 9); do s=$((s + d[i] * (11 - i))); done
        r=$((s % 11))
        d[10]=$( [ $r -lt 2 ] && echo 0 || echo $((11 - r)) )
        echo -e "  ${VERDE}[$n]${RESET} ${BRANCO}${d[0]}${d[1]}${d[2]}.${d[3]}${d[4]}${d[5]}.${d[6]}${d[7]}${d[8]}-${d[9]}${d[10]}${RESET}"
    done

    pausar; menu_geradores
}

gerar_cnpj() {
    banner; linha
    echo -e "  ${VERDE}[ GERADOR DE CNPJ ]${RESET}"; linha
    echo -ne "\n  ${CIANO}Quantos CNPJs gerar? [1-10]: ${RESET}"; read -r qtd
    [[ ! "$qtd" =~ ^([1-9]|10)$ ]] && qtd=1
    echo ""; loading "Gerando $qtd CNPJ(s)"; echo ""

    for ((n=1; n<=qtd; n++)); do
        local d=()
        for i in $(seq 0 7); do d+=($((RANDOM % 10))); done
        d+=(0 0 0 1)
        local p1=(5 4 3 2 9 8 7 6 5 4 3 2)
        local s=0
        for i in $(seq 0 11); do s=$((s + d[i] * p1[i])); done
        local r=$((s % 11))
        local v1=$( [ $r -lt 2 ] && echo 0 || echo $((11 - r)) )
        local p2=(6 5 4 3 2 9 8 7 6 5 4 3 2)
        s=0
        for i in $(seq 0 11); do s=$((s + d[i] * p2[i])); done
        s=$((s + v1 * p2[12])); r=$((s % 11))
        local v2=$( [ $r -lt 2 ] && echo 0 || echo $((11 - r)) )
        echo -e "  ${VERDE}[$n]${RESET} ${BRANCO}${d[0]}${d[1]}.${d[2]}${d[3]}${d[4]}.${d[5]}${d[6]}${d[7]}/${d[8]}${d[9]}${d[10]}${d[11]}-${v1}${v2}${RESET}"
    done

    pausar; menu_geradores
}

gerar_rg() {
    banner; linha
    echo -e "  ${VERDE}[ GERADOR DE RG ]${RESET}"; linha
    echo -ne "\n  ${CIANO}Quantos RGs gerar? [1-10]: ${RESET}"; read -r qtd
    [[ ! "$qtd" =~ ^([1-9]|10)$ ]] && qtd=1
    echo ""; loading "Gerando $qtd RG(s)"; echo ""

    for ((n=1; n<=qtd; n++)); do
        local d=()
        for i in $(seq 0 7); do d+=($((RANDOM % 10))); done
        local s=0
        for i in $(seq 0 7); do s=$((s + d[i] * (2 + i))); done
        local r=$((s % 11))
        local dv
        [ $r -eq 0 ] && dv="0" || { [ $r -eq 1 ] && dv="X" || dv=$((11 - r)); }
        echo -e "  ${VERDE}[$n]${RESET} ${BRANCO}${d[0]}${d[1]}.${d[2]}${d[3]}${d[4]}.${d[5]}${d[6]}${d[7]}-${dv}${RESET}"
    done

    pausar; menu_geradores
}
gerar_pessoa() {
    banner; linha
    echo -e "  ${VERDE}[ GERADOR DE PESSOA COMPLETA ]${RESET}"; linha
    echo ""; loading "Gerando dados ficticios"; echo ""

    local nomes=("Ana Silva" "Carlos Oliveira" "Maria Santos" "Joao Pereira"
                 "Fernanda Costa" "Lucas Souza" "Juliana Lima" "Rafael Ferreira"
                 "Camila Alves" "Bruno Rodrigues")
    local estados=("SP" "RJ" "MG" "RS" "PR" "BA" "SC" "PE" "CE" "GO")
    local cidades=("Sao Paulo" "Rio de Janeiro" "Belo Horizonte" "Porto Alegre"
                   "Curitiba" "Salvador" "Florianopolis" "Recife" "Fortaleza" "Goiania")

    local idx=$((RANDOM % 10))
    local nome="${nomes[$idx]}"
    local estado="${estados[$idx]}"
    local cidade="${cidades[$idx]}"

    # Gerar CPF
    local d=()
    for i in $(seq 0 8); do d+=($((RANDOM % 10))); done
    local s=0
    for i in $(seq 0 8); do s=$((s + d[i] * (10 - i))); done
    local r=$((s % 11))
    d[9]=$( [ $r -lt 2 ] && echo 0 || echo $((11 - r)) )
    s=0
    for i in $(seq 0 9); do s=$((s + d[i] * (11 - i))); done
    r=$((s % 11))
    d[10]=$( [ $r -lt 2 ] && echo 0 || echo $((11 - r)) )
    local cpf="${d[0]}${d[1]}${d[2]}.${d[3]}${d[4]}${d[5]}.${d[6]}${d[7]}${d[8]}-${d[9]}${d[10]}"

    local ano=$(( 1970 + RANDOM % 40 ))
    local mes=$(printf "%02d" $((RANDOM % 12 + 1)))
    local dia=$(printf "%02d" $((RANDOM % 28 + 1)))
    local em="${nome// /.}"; em="${em,,}@gmail.com"
    local tel="(${estado:0:2}) 9$(printf "%04d" $((RANDOM % 9999)))-$(printf "%04d" $((RANDOM % 9999)))"

    echo -e "  ${VERDE}Nome       :${RESET} $nome"
    echo -e "  ${VERDE}CPF        :${RESET} $cpf"
    echo -e "  ${VERDE}Nascimento :${RESET} $dia/$mes/$ano"
    echo -e "  ${VERDE}Cidade     :${RESET} $cidade / $estado"
    echo -e "  ${VERDE}Email      :${RESET} $em"
    echo -e "  ${VERDE}Telefone   :${RESET} $tel"
    echo -e "\n  ${AMARELO}⚠  DADOS 100% FICTICIOS — SÓ PARA TESTES${RESET}"

    pausar; menu_geradores
}
# ── MENU VALIDADORES ─────────────────────
menu_validadores() {
    banner
    echo -e "${CIANO}  ┌──────────────────────────────────┐"
    echo -e "  │       ${VERDE}≡ VALIDADORES ≡${CIANO}           │"
    echo -e "  ├──────────────────────────────────┤"
    echo -e "  │   ${VERDE}[1]${CINZA} Validar CPF               ${CIANO}│"
    echo -e "  │   ${VERDE}[2]${CINZA} Validar CNPJ              ${CIANO}│"
    echo -e "  │   ${VERDE}[3]${CINZA} Validar RG                ${CIANO}│"
    echo -e "  │   ${AMARELO}[V]${CINZA} Voltar                    ${CIANO}│"
    echo -e "  └──────────────────────────────────┘${RESET}"
    echo ""
    echo -ne "  ${VERDE}root@validadores${CIANO}:~# ${RESET}"
    read -r opcao
    case "${opcao,,}" in
        1) validar_cpf ;; 2) validar_cnpj ;; 3) validar_rg ;;
        v) menu_principal ;;
        *) echo -e "${VERMELHO}  [!] Invalido!${RESET}"; sleep 1; menu_validadores ;;
    esac
}

validar_cpf() {
    banner; linha; echo -e "  ${VERDE}[ VALIDAR CPF ]${RESET}"; linha
    echo -ne "\n  ${CIANO}CPF: ${RESET}"; read -r cpf
    cpf="${cpf//[.-]/}"; echo ""
    if [[ ! "$cpf" =~ ^[0-9]{11}$ ]] || [[ "$cpf" =~ ^([0-9])\1{10}$ ]]; then
        echo -e "  ${VERMELHO}[x] CPF INVALIDO!${RESET}"
        pausar; menu_validadores; return
    fi
    local s=0
    for i in $(seq 0 8); do s=$((s + ${cpf:$i:1} * (10 - i))); done
    local r=$((s % 11)); local d10=$( [ $r -lt 2 ] && echo 0 || echo $((11 - r)) )
    s=0
    for i in $(seq 0 9); do s=$((s + ${cpf:$i:1} * (11 - i))); done
    r=$((s % 11)); local d11=$( [ $r -lt 2 ] && echo 0 || echo $((11 - r)) )
    local fmt="${cpf:0:3}.${cpf:3:3}.${cpf:6:3}-${cpf:9:2}"
    if [ "${cpf:9:1}" -eq "$d10" ] && [ "${cpf:10:1}" -eq "$d11" ]; then
        echo -e "  ${VERDE}[✓] CPF VALIDO: $fmt${RESET}"
    else
        echo -e "  ${VERMELHO}[x] CPF INVALIDO: $fmt${RESET}"
    fi
    pausar; menu_validadores
}

validar_cnpj() {
    banner; linha; echo -e "  ${VERDE}[ VALIDAR CNPJ ]${RESET}"; linha
    echo -ne "\n  ${CIANO}CNPJ: ${RESET}"; read -r cnpj
    cnpj="${cnpj//[.\/-]/}"; echo ""
    if [[ ! "$cnpj" =~ ^[0-9]{14}$ ]]; then
        echo -e "  ${VERMELHO}[x] CNPJ INVALIDO!${RESET}"
        pausar; menu_validadores; return
    fi
    local p1=(5 4 3 2 9 8 7 6 5 4 3 2) p2=(6 5 4 3 2 9 8 7 6 5 4 3 2)
    local s=0
    for i in $(seq 0 11); do s=$((s + ${cnpj:$i:1} * p1[i])); done
    local r=$((s % 11)); local v1=$( [ $r -lt 2 ] && echo 0 || echo $((11 - r)) )
    s=0
    for i in $(seq 0 11); do s=$((s + ${cnpj:$i:1} * p2[i])); done
    s=$((s + v1 * p2[12])); r=$((s % 11))
    local v2=$( [ $r -lt 2 ] && echo 0 || echo $((11 - r)) )
    local fmt="${cnpj:0:2}.${cnpj:2:3}.${cnpj:5:3}/${cnpj:8:4}-${cnpj:12:2}"
    if [ "${cnpj:12:1}" -eq "$v1" ] && [ "${cnpj:13:1}" -eq "$v2" ]; then
        echo -e "  ${VERDE}[✓] CNPJ VALIDO: $fmt${RESET}"
    else
        echo -e "  ${VERMELHO}[x] CNPJ INVALIDO: $fmt${RESET}"
    fi
    pausar; menu_validadores
}

validar_rg() {
    banner; linha; echo -e "  ${VERDE}[ VALIDAR RG (SP) ]${RESET}"; linha
    echo -ne "\n  ${CIANO}RG: ${RESET}"; read -r rg
    rg="${rg//[.-]/}"; echo ""
    if [[ ! "$rg" =~ ^[0-9]{8}[0-9Xx]$ ]]; then
        echo -e "  ${VERMELHO}[x] RG INVALIDO!${RESET}"
        pausar; menu_validadores; return
    fi
    local s=0
    for i in $(seq 0 7); do s=$((s + ${rg:$i:1} * (2 + i))); done
    local r=$((s % 11)); local dv
    [ $r -eq 0 ] && dv="0" || { [ $r -eq 1 ] && dv="X" || dv=$((11 - r)); }
    local di="${rg:8:1}"; di="${di^^}"
    local fmt="${rg:0:2}.${rg:2:3}.${rg:5:3}-${rg:8:1}"
    [ "$di" = "$dv" ] && echo -e "  ${VERDE}[✓] RG VALIDO: $fmt${RESET}" \
                      || echo -e "  ${VERMELHO}[x] RG INVALIDO: $fmt${RESET}"
    pausar; menu_validadores
}
# ── MENU REDE ─────────────────────────────
menu_rede() {
    banner
    echo -e "${CIANO}  ┌──────────────────────────────────┐"
    echo -e "  │    ${VERDE}≡ FERRAMENTAS DE REDE ≡${CIANO}      │"
    echo -e "  ├──────────────────────────────────┤"
    echo -e "  │   ${VERDE}[1]${CINZA} Ping                      ${CIANO}│"
    echo -e "  │   ${VERDE}[2]${CINZA} Traceroute                ${CIANO}│"
    echo -e "  │   ${VERDE}[3]${CINZA} Scan de Portas (nmap)     ${CIANO}│"
    echo -e "  │   ${VERDE}[4]${CINZA} DNS Lookup                ${CIANO}│"
    echo -e "  │   ${VERDE}[5]${CINZA} Whois                     ${CIANO}│"
    echo -e "  │   ${VERDE}[6]${CINZA} Meu IP Publico            ${CIANO}│"
    echo -e "  │   ${AMARELO}[V]${CINZA} Voltar                    ${CIANO}│"
    echo -e "  └──────────────────────────────────┘${RESET}"
    echo ""
    echo -ne "  ${VERDE}root@rede${CIANO}:~# ${RESET}"
    read -r opcao
    case "${opcao,,}" in
        1) net_ping ;; 2) net_trace ;; 3) net_nmap ;;
        4) net_dns ;; 5) net_whois ;; 6) net_meuip ;;
        v) menu_principal ;;
        *) echo -e "${VERMELHO}  [!] Invalido!${RESET}"; sleep 1; menu_rede ;;
    esac
}

net_ping() {
    banner; linha; echo -e "  ${VERDE}[ PING ]${RESET}"; linha
    echo -ne "\n  ${CIANO}Host ou IP: ${RESET}"; read -r h; echo ""
    ping -c 4 "$h" 2>/dev/null || echo -e "  ${VERMELHO}[!] Inacessivel ou bloqueado.${RESET}"
    pausar; menu_rede
}

net_trace() {
    banner; linha; echo -e "  ${VERDE}[ TRACEROUTE ]${RESET}"; linha
    echo -ne "\n  ${CIANO}Host ou IP: ${RESET}"; read -r h; echo ""
    command -v traceroute &>/dev/null && traceroute "$h" \
    || command -v tracepath &>/dev/null && tracepath "$h" \
    || echo -e "  ${VERMELHO}[!] Instale: apt install traceroute${RESET}"
    pausar; menu_rede
}

net_nmap() {
    banner; linha; echo -e "  ${VERDE}[ SCAN DE PORTAS ]${RESET}"; linha
    echo -e "  ${AMARELO}⚠  Use apenas em seus proprios servidores!${RESET}"; linha
    echo -ne "\n  ${CIANO}Alvo (IP ou dominio): ${RESET}"; read -r h
    echo -e "\n  ${VERDE}[1]${CINZA} Rapido  ${VERDE}[2]${CINZA} Completo  ${VERDE}[3]${CINZA} Versoes"
    echo -ne "  ${CIANO}Tipo: ${RESET}"; read -r t; echo ""
    if ! command -v nmap &>/dev/null; then
        echo -e "  ${VERMELHO}[!] Instale: apt install nmap${RESET}"
    else
        case "$t" in
            1) nmap -F "$h" ;; 2) nmap -p- "$h" ;; 3) nmap -sV "$h" ;; *) nmap -F "$h" ;;
        esac
    fi
    pausar; menu_rede
}

net_dns() {
    banner; linha; echo -e "  ${VERDE}[ DNS LOOKUP ]${RESET}"; linha
    echo -ne "\n  ${CIANO}Dominio: ${RESET}"; read -r d; echo ""
    command -v nslookup &>/dev/null && nslookup "$d" \
    || command -v dig &>/dev/null && dig "$d" +short \
    || echo -e "  ${VERMELHO}[!] Nenhuma ferramenta DNS disponivel.${RESET}"
    pausar; menu_rede
}

net_whois() {
    banner; linha; echo -e "  ${VERDE}[ WHOIS ]${RESET}"; linha
    echo -ne "\n  ${CIANO}Dominio ou IP: ${RESET}"; read -r a; echo ""
    loading "Consultando WHOIS"
    command -v whois &>/dev/null && whois "$a" 2>/dev/null | head -40 \
    || echo -e "  ${VERMELHO}[!] Instale: apt install whois${RESET}"
    pausar; menu_rede
}

net_meuip() {
    banner; linha; echo -e "  ${VERDE}[ MEU IP PUBLICO ]${RESET}"; linha
    echo ""; loading "Buscando seu IP"; echo ""
    local ip r
    ip=$(curl -s4 https://api.ipify.org)
    r=$(curl -s "https://ipinfo.io/$ip/json")
    echo -e "  ${VERDE}IPv4       :${RESET} $ip"
    echo -e "  ${VERDE}Cidade     :${RESET} $(echo "$r"|grep -o '"city":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ${VERDE}Pais       :${RESET} $(echo "$r"|grep -o '"country":"[^"]*"'|cut -d'"' -f4)"
    echo -e "  ${VERDE}ISP        :${RESET} $(echo "$r"|grep -o '"org":"[^"]*"'|cut -d'"' -f4)"
    pausar; menu_rede
}
# ── INICIO ───────────────────────────────
menu_principal
