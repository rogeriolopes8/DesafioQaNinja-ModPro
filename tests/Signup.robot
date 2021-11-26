*Settings*
Documentation       Signup Test Suite

Resource        ${EXECDIR}/resources/base.robot

Test Setup      Start Session
Test Teardown   Finish Session

*Test Cases*
Register a new user

    ${user}     Factory User    faker

    #disponibiliza a mesma massa para outros cenários
    #Set Suite Variable      ${user}

    Go To Signup Form
    Fill Signup Form    ${user}
    Submit Signup Form
    User Should Be Registered

Duplicate User
    [Tags]      dup_email       attempt_signup      #é possivel colocar mais de uma tag

    ${user}                     Factory User    faker
    Add User From Database      ${user}
    
    Go To Signup Form
    Fill Signup Form    ${user}
    Submit Signup Form
    Modal Content Should Be     Já temos um usuário com o e-mail informado.

Wrong Email
    [tags]      attempt_signup1

    ${user}     Factory User    wrong_email

    Go To Signup Form
    Fill Signup Form    ${user}
    Submit Signup Form
    Alert Span Should Be    O email está estranho

Required Fields
    [tags]      attempt_signup      reqf

    #Primeira forma de validar (se uma frase falhar as da frente são abortadas)
    # Go To Signup Form
    # Submit Signup Form
    # Alert Span Should Be    Cadê o seu nome?
    # Alert Span Should Be    E o sobrenome?
    # Alert Span Should Be    O email é importante também!
    # Alert Span Should Be    Agora só falta a senha!

    #Segunda forma de validar usando template(porém executa todos os steps denovo e denovo)
    # [Template]      Signup Submit Without Form
    # Cadê o seu nome?
    # E o sobrenome?
    # O email é importante também!
    # Agora só falta a senha!

    #Terceira forma de fazer usando laço e criando uma lista (melhor forma)
    @{expected_alerts}      Create List
    ...                     Cadê o seu nome?
    ...                     E o sobrenome?
    ...                     O email é importante também!
    ...                     Agora só falta a senha!

    Go To Signup Form
    Submit Signup Form
    Alert Spans Should Be       ${expected_alerts}

Short Password
    [tags]      attempt_signup      short
    #Validando cenário apenas pela frase, sem especificar a entrada de dados
    #${user}     Create Dictionary
    # ...         name=Daniel                 lastname=Feliciano
    # ...         email=daniel@gmail.com      password=12345

    # Go To Signup Form
    # Fill Signup Form    ${user}
    # Submit Signup Form
    # Alert Span Should Be  Informe uma senha com pelo menos 6 caracteres

    #Validando cenários especificos
    [Template]      Signup With Short Password
    1
    12
    123
    1234
    12345
    a
    a2
    ab3
    ab3c
    a23bc
    -1
    acb#1

*Keywords*
Signup With Short Password
    [Arguments]             ${short_pass}

    ${user}     Create Dictionary
    ...         name=Daniel                 lastname=Feliciano
    ...         email=daniel@gmail.com      password=${short_pass}

    Go To Signup Form
    Fill Signup Form    ${user}
    Submit Signup Form
    Alert Span Should Be  Informe uma senha com pelo menos 6 caracteres

# Signup Submit Without Form
#     [Arguments]     ${expected_alert}

#     Go To Signup Form
#     Submit Signup Form
#     Alert Span Should Be  ${expected_alert}

