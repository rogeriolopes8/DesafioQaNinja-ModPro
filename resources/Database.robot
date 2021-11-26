*Settings*
Documentation       Criar uma conexão com o BD

Library     DatabaseLibrary
Library     factories/Users.py

*Keywords*
Connect To Postgres
    Connect To Database             psycopg2
    ...                             yqyrqxtc
    ...                             yqyrqxtc
    ...                             JrIT93OEQKUkl-rCs9k6KUBusWkzty4P
    ...                             fanny.db.elephantsql.com
    ...                             5432

Reset Env
    Execute SQL String              DELETE from public.geeks;
    Execute SQL String              DELETE from public.users;

Insert User
    [Arguments]     ${user}

    ${hashed_pass}      Get Hashed pass     ${user}[password] 

    ${q}    Set Variable    INSERT INTO public.users (name, email, password_hash, is_geek) values ('${user}[name] ${user}[lastname]', '${user}[email]', '${hashed_pass}', false)

    Execute SQL String      ${q}

Users Seed

    ${user}         Factory User    login
    Insert User     ${user}

    ${user2}        Factory User    be_geek
    Insert User     ${user2}

    ${user3}        Factory User    desafio
    Insert User     ${user3}

    ${user4}        Factory User    attempt_be_geek
    Insert User     ${user4}
