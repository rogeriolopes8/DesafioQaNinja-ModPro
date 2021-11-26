*Settings*
Documentation       Login test suite

Resource        ${EXECDIR}/resources/base.robot

Test Setup      Start Session
Test Teardown   Finish Session

*Test Cases*
User login

    #incluir antes o usuário no BD
    ${user}                     Factory User    login
    
    #Removido por causa das sementes
    #Add User From Database     ${user}

    Go To Login Page
    Fill Credentials            ${user}     #daniel@hotmail.com      pwd123
    Submit Credentials
    User Should Be Logged In        ${user}    #Daniel Feliciano

Incorret pass
    [Tags]      i_pass

    ${user}     Create Dictionary
    ...         email=daniel@hotmail.com
    ...         password=abc123

    Go To Login Page
    Fill Credentials    ${user}
    Submit Credentials
    Modal Content Should Be         Usuário e/ou senha inválidos.

User not found
    [Tags]      user_404

    ${user}     Create Dictionary
    ...         email=daniel@404.com
    ...         password=pwd123

    Go To Login Page
    Fill Credentials    ${user}
    Submit Credentials
    Modal Content Should Be         Usuário e/ou senha inválidos.

Incorrect Email
    [Tags]      i_email

    ${user}     Create Dictionary
    ...         email=daniel.com
    ...         password=pwd123

    Go To Login Page
    Fill Credentials    ${user}
    Submit Credentials
    Should Be Type Email 

# Desefio 1 do módulo PRO
# Automatizar 3 novos casos de testes: Email obrigatório, Senha obrogatória, Campos obrigatórios

# Required Email
#     [Tags]      req_email

#     Go To Login Page
#     Fill Text                   id=password     pwd123
#     Submit Credentials
#     Alert Span Should Be        E-mail obrigatório

# Required password
#     [Tags]      req_pass

#     Go To Login Page
#     Fill Text                   id=email     daniel@hotmail.com
#     Submit Credentials
#     Alert Span Should Be        Senha obrigatória

# Required Fields
#     [Tags]      req_fields

#     @{expected_alerts}      Create List
#     ...                     E-mail obrigatório
#     ...                     Senha obrigatória

#     Go To Login Page
#     Submit Credentials
#     Alert Spans Should Be       ${expected_alerts}

#Correção PAPITO

Required Email
    [Tags]      temp        req_email

    ${user}     Create Dictionary       email=${EMPTY}        password=pwd123

    Go To Login Page
    Fill Credentials            ${user}
    Submit Credentials
    Alert Span Should Be        E-mail obrigatório

Required password
    [Tags]      temp        req_pass

    ${user}     Create Dictionary       email=daniel@hotmail.com        password=${EMPTY}

    Go To Login Page
    Fill Credentials            ${user}
    Submit Credentials
    Alert Span Should Be        Senha obrigatória

Required Fields
    [Tags]      temp        req_fields

    @{expected_alerts}      Create List
    ...                     E-mail obrigatório
    ...                     Senha obrigatória

    Go To Login Page
    Submit Credentials
    Alert Spans Should Be       ${expected_alerts}

