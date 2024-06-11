*** Settings ***
Resource    ../main.robot

*** Keywords ***
Acesso organo
    Open Browser   url=http://localhost:3000/   browser=Chrome

Fechar navegador
    Close Browser