*** Settings ***
Resource          ../resource/main.robot
Test Setup        Acesso organo
Test Teardown     Fechar navegador


*** Test Cases ***
Teste Invalido
    Invalido Criar card
    Invalido Mensagem erro campo obrigatorio