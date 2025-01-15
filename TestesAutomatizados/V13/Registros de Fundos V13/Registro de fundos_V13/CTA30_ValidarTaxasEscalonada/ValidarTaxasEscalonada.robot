*** Settings ***
Documentation      Essa automação valida que não seja permitido o registro com papel de "Informante"

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundo]Validar Preenchimento razão social e nome comercial = Crédito Privado/Cred Priv, Sufixo = Crédito Privado, Crédito Privado = Sim, Infraestrutura = Sim
    [Documentation]     [FIF][Teste21]
    [Tags]    test18
    Acessar o HUB    ${EMAIL}
    Criar fundo casca FIDC V13
    Enviar para analise anbima
    