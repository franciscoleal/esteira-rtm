*** Settings ***
Documentation      Essa automação valida se é possível criar mais de um fundo com o mesmo CNPJ de um fundo já existente e que possua status "Rascunho"

Resource           ../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundos][Test20] Validar se é possível criar mais de um fundo com o mesmo CNPJ de um fundo já existente e que possua status "Rascunho"
    [Tags]    test20
    Acessar o HUB    daniele.negoro@vericode.com.br
    Selecionar acesso    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais
    Cadastrar fundo com CNPJ existente em rascunho