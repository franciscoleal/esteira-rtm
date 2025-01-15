*** Settings ***
Documentation      Essa automação valida botão "Enviar para analise da Anbima"

Resource           ../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de fundos][Test14]Validar botão "Enviar para analise da Anbima"
    [Tags]    test01    test14
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
    Validar o Cancelar de aceitação
    Finalizar registro
