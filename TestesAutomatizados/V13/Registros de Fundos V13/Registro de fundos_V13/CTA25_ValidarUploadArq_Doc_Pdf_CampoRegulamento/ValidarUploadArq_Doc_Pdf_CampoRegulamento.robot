*** Settings ***
Documentation      Essa automação valida que não seja permitido o registro com papel de "Informante"

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundo][Test12] Validar upload de arquivo .Doc e .Pdf , no campo REGULAMENTO
    [Tags]    test12
    Acessar o HUB    ${EMAIL}
    Criar fundo casca sem subclasse FIF V13
    Enviar para analise anbima
    