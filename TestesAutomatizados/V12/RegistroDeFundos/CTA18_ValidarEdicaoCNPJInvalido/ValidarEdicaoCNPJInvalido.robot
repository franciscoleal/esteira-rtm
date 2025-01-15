*** Settings ***
Documentation      Essa automação valida cadastro de uma nova Classe com o CNPJ inválido em um Fundo que já possua uma Classe com CNPJ válido

Resource           ../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundos][Test18] Validar cadastro de uma nova Classe com o CNPJ inválido em um Fundo que já possua uma Classe com CNPJ válido
    [Tags]    test18
    Acessar o HUB    daniele.negoro@vericode.com.br
    Selecionar acesso    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe
    Preencher perfil da classe
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
    Editar fundo pesquisado no rascunho
    Editar fundo casca
    Inserir e validar CNPJ invalido na edicao do fundo casca    