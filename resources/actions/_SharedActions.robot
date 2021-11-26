*Settings*
Documentation       Shared Actions

*Keywords*

Modal Content Should Be
    [Arguments]     ${expected_text}

    ${title}        Set Variable        css=.swal2-title
    ${content}      Set Variable        css=.swal2-html-container

    Wait For Elements State     ${title}         visible     5
    Get Text                    ${title}         equal       Oops...

    Wait For Elements State     ${content}       visible     5
    Get Text                    ${content}       equal       ${expected_text}

Alert Span Should Be
    [Arguments]     ${expected_alert}

    Wait For Elements State     css=span[class=error] >> text=${expected_alert}
    ...                         visible     5
    
Alert Spans Should Be

    #Pega os dados da lista
    [Arguments]         ${expected_alerts}

    #Criar uma lista vazia para obter os dados
    @{got_alerts}       Create List

    #Para não ter problemas de ambiguidade usa Get Elements(pode obter mais de um elemento)
    ${spans}            Get Elements        css=span[class=error]

    #Pegar um span${span} por vez na lista de spans@{spans}
    FOR     ${span}     IN      @{spans}

        #Pegar o texto de cada elemento
        ${text}             Get Text            ${span}

        #Adicionar na lista vazia o texto de elemento e elemento do Span${span}
        Append To List      ${got_alerts}       ${text}

    END

    #Comparar texto da lista de alertas esperados com a lista de alertas obtidos
    Lists Should Be equal       ${expected_alerts}      ${got_alerts}