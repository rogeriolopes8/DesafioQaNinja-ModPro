*Settings*
Documentation       Base Test

Library     Browser
Library     Collections

Library     factories/Users.py
Library     massa_dados.py

Resource    actions/_SharedActions.robot
Resource    actions/AuthActions.robot
Resource    actions/SignupActions.robot
Resource    actions/GeekActions.robot

Resource    Database.robot
Resource    Helpers.robot

*Variables*
${BASE_URL}     https://getgeeks-rogerio.herokuapp.com

*Keywords*
Start Session
    New Browser     ${BROWSER}        headless=${HEADLESS}      slowMo=00:00:00
    New Page        ${BASE_URL}
    Set Viewport Size       1280        768

Finish Session         
    ${shot_name}        Screenshot Name
    Take Screenshot     fullPage=True       filename=${shot_name}