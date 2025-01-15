*** Settings ***
Documentation      Essa automação valida que o registro de fundo criado apareça nas interfaces

Resource           ../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de fundos][Test15]Validar que o registro de fundo criado apareça nas interfaces
    [Tags]    test01    test15
    Acessar o HUB    daniele.negoro@vericode.com.br
    Selecionar acesso    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais
    Log    ${REQ_NUM}
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe Analise
    Preencher perfil da classe Analise
    Preencher as taxas da classe
    Preencher os prestadores da classe FIF/FIDC
    Concluir classe sem subclasse
    Preencher perfil complementar
    Preencher as taxas de administracao da classe
    Preencher as taxas de gestao da classe
    Preencher as taxas de custodia da classe
    Preencher as taxas de distribuicao da classe
    Preencher as taxas de performance da classe
    Preencher as taxas de entrada e saida da classe
    Preencher as taxas de consultor da classe
    Preencher valor minimo e movimentacao
    Cadastrar prestadores complementar
    Pesquisar fundo no rascunho
    Validar fundo em rascunho na tela rascunho