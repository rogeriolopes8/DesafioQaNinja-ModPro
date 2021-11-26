*Settings*
Documentation       Delorean

Resource            ${EXECDIR}/resources/Database.robot

*tasks*
Back To The Past

    Connect To Postgres
    Reset Env

    #Insere a semente de usuário
    Users Seed

    Disconnect from Database
    