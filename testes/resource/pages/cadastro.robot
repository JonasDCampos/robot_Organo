*** Settings ***
Resource    ../main.robot

###############################################################################

*** Variables ***
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao

@{selecionar_times}
...    //option[contains(.,'Programação')]
...    //option[contains(.,'Front-End')]
...    //option[contains(.,'Data Science')]
...    //option[contains(.,'Devops')] 
...    //option[contains(.,'UX e Design')]
...    //option[contains(.,'Mobile')]
...    //option[contains(.,'Inovação e Gestão')] 

###############################################################################

*** Keywords ***
Preenche Campos do formulario
    ${Nome}    FakerLibrary.First Name
    ${Cargo}   FakerLibrary.Job
    ${Imagem}  FakerLibrary.Image Url    width=100    height=100

    Input Text       ${CAMPO_NOME}        ${Nome}
    Input Text       ${CAMPO_CARGO}       ${Cargo}
    Input Text       ${CAMPO_IMAGEM}      ${Imagem}

    Click Element    ${CAMPO_TIME}
    Click Element    ${selecionar_times}[0]

Botao Criar card
    Click Element    ${BOTAO_CARD}

Identificar card no time
    Element Should Be Visible    class:colaborador

Identificar 3 cards no time esperado
    FOR    ${i}    IN RANGE    0    3
        Preenche Campos do formulario
        Botao Criar card
        
    END
    Sleep    10s

Criar e identificar 1 card em cada time disponivel
    FOR    ${indice}    ${time}    IN ENUMERATE    @{selecionar_times}
        Preenche Campos do formulario
        Click Element    ${time}
        Botao Criar card
        
    END
    Sleep    10s

Invalido Criar card
    Click Element     ${BOTAO_CARD} 

Invalido Mensagem erro campo obrigatorio
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro
