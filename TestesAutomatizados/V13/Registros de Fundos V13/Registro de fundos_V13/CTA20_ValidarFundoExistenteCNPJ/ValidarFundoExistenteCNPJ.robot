*** Settings ***
Documentation      Essa automação valida se é possível criar mais de um fundo com o mesmo CNPJ de um fundo já existente e que possua status "Rascunho"

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundos][Test20] Validar se é possível criar mais de um fundo com o mesmo CNPJ de um fundo já existente e que possua status "Rascunho"
    [Tags]    test20
    Acessar o HUB    ${EMAIL}
    Selecionar acesso    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIFMultimercado    FIF    Monoclasse
    Cadastrar fundo com CNPJ existente em rascunho