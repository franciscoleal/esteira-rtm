*** Settings ***
Documentation      Essa automação valida registro cadastro fundo Casca CNPJ Inválido

Resource           ../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de fundos][Test02]Validar registro cadastro fundo Casca CNPJ Inválido
    [Tags]    teste02
    Acessar o HUB    daniele.negoro@vericode.com.br
    Selecionar acesso    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais com cnpj invalido
    Informe de cnpj invalido
