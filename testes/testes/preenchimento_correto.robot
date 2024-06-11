*** Settings ***
Resource          ../resource/main.robot
Test Setup        Acesso organo
Test Teardown     Fechar navegador

*** Test Cases ***
Verifica conexa, preenche os campos do formulario e cria card
    Preenche Campos do formulario
    Botao Criar card
    Identificar card no time

Verificar se é possivel criar mais de um card
    Identificar 3 cards no time esperado

Verificar se é possivel criar um card para cada time disponivel
    Preenche Campos do formulario
    Criar e identificar 1 card em cada time disponivel