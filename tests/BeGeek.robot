*Settings*
Documentation       Be Geek Test Suit

Resource        ${EXECDIR}/resources/base.robot

Test Setup      Start Session
Test Teardown   Finish Session

*Variables*
${correct_desc}     Instalo Distros Ubuntu, Debian, ElementaryOS, PopOS, Linux Mint, Kurumin, Mandrake, Connectiva, Fedora, RedHat, CentOS, Slackware, Gentoo, Archlinux, Kubuntu, Xubuntu, Suze, Mandriva, Edubuntu, KateOS, Sabayon Linux, Manjaro Linux, BigLinux, ZorinOS, Unit

*Test Cases*
Be a Geek

    ${user}     Factory User    be_geek
    Do Login    ${user}
    
    Go To Geek Form
    Fill Geek Form      ${user}[geek_profile]
    Submit Geek Form
    Geek Form Should Be Success


# Desafio final do módulo PRO

# 1 - Whatsapp em branco
# 2 - Whatsapp somente DDD
# 3 - Whatsapp com 10 digitos
# 4 - Descrição em branco
# 5 - Valor hora em branco
# 6 - Valor hora com alphanuméricos
# 7 - Valor hora com letras
# 8 - Valor hora com caracteres especiais

# Dica 1: Use o modelo de template de teste
# Dica 2: O login ficará melhor se for executado uma única vez para todos os comportamentos.

Req Fields Challenge
    [Tags]          desafio

    [Setup]         Start Session only Challenge
    [Template]      Req Fields

    ${EMPTY}        ${correct_desc}         100             O Whatsapp deve ter 11 digitos contando com o DDD
    11              ${correct_desc}         120             O Whatsapp deve ter 11 digitos contando com o DDD
    9999999999      ${correct_desc}         140             O Whatsapp deve ter 11 digitos contando com o DDD
    11946222733     ${EMPTY}                160             Informe a descrição do seu trabalho
    11946222733     ${correct_desc}         ${EMPTY}        Valor hora deve ser numérico
    11946222733     ${correct_desc}         ab12            Valor hora deve ser numérico
    11946222733     ${correct_desc}         abcdefgh        Valor hora deve ser numérico
    11946222733     ${correct_desc}         !@#$%¨&*        Valor hora deve ser numérico

*Keywords*
Req Fields
    [Arguments]     ${whats}     ${desc}     ${cost}        ${alert}

    ${user}     Create Dictionary
    ...         whats=${whats}
    ...         desc=${desc}
    ...         printer_repair=Sim
    ...         work=Ambos
    ...         cost=${cost}

    Go To Geek Form
    Fill Geek Form          ${user}
    Submit Geek Form
    Alert Span Should Be        ${alert}
    Return To Main Page

Start Session only Challenge
    Start Session

    ${user}     Factory User    desafio

    Do Login  ${user}

Return To Main Page
    Click           css=img[alt="Voltar"]

    Wait For Elements State         css=a[href="/be-geek"] >> text=Seja um Geek       visible     5
