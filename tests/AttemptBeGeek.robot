*Settings*
Documentation       Attempt Be Geek Test Suit

Resource        ${EXECDIR}/resources/base.robot

#Inicia a sessão unica para esse arquivo, mais abre o navegador toda vez, ja que é por teste
#Test Setup      Start Seesion For Attempt Be a Geek

#Inicia o login uma unica vez ja que é por suite
Suite Setup      Start Seesion For Attempt Be a Geek

#Colocar esse template para que o teste fique a nivel de suite
Test Template   Attempt Be Geek

#Devido o take screenshot do template, esse de baixo remove(esse só pega no final da sessão)
#Test Teardown   Finish Session

*Variables*
${long_desc}    Instalo Distros Ubuntu, Debian, ElementaryOS, PopOS, Linux Mint, Kurumin, Mandrake, Connectiva, Fedora, RedHat, CentOS, Slackware, Gentoo, Archlinux, Kubuntu, Xubuntu, Suze, Mandriva, Edubuntu, KateOS, Sabayon Linux, Manjaro Linux, BigLinux, ZorinOS, Unity

*Test Cases*
#Trecho removido por que agora são 10 test cases
#Should Not Be a Geek
    #Remover esse trecho, por que esse template equivale a um caso de teste
    #[Template]      Attempt Be Geek

                        #key                #input_field            #${output_message}
Short Desc              desc                Formato o seu PC.       A descrição deve ter no minimo 80 caracteres
Long Desc               desc                ${long_desc}            A descrição deve ter no máximo 255 caracteres
Empty Desc              desc                ${EMPTY}                Informe a descrição do seu trabalho
Whats only DDD          whats               11                      O Whatsapp deve ter 11 digitos contando com o DDD
Whats only Number       whats               999999999               O Whatsapp deve ter 11 digitos contando com o DDD
Empty Whats             whats               ${EMPTY}                O Whatsapp deve ter 11 digitos contando com o DDD
Cost Letters            cost                aaaa                    Valor hora deve ser numérico
Cost Alpha              cost                aa12                    Valor hora deve ser numérico
Cost Special Chars      cost                !@#$$%                  Valor hora deve ser numérico
Empty Cost              cost                ${EMPTY}                Valor hora deve ser numérico
No Printer Repair       printer_repair      ${EMPTY}                Por favor, informe se você é um Geek Supremo
No work                 work                ${EMPTY}                Por favor, selecione o modelo de trabalho

*Keywords*
Attempt Be Geek
    [Arguments]     ${key}          ${input_field}          ${output_message}

    ${user}         Factory User    attempt_be_geek

    Set To Dictionary       ${user}[geek_profile]       ${key}      ${input_field}

    Fill Geek Form          ${user}[geek_profile]
    Submit Geek Form
    Alert Span Should Be    ${output_message}

    #Pega o screenshot de todos os testes do template
    #Take Screenshot      fullPage=True

    #Para a solução do erro dos screenshots no pabot
    Finish Session

#Iniciar uma sessão do navegador apenas para esse arquivo AttemptBeGeek.robot
Start Seesion For Attempt Be a Geek

    ${user}     Factory User        attempt_be_geek

    Start Session
    Do Login    ${user}
    Go To Geek Form
