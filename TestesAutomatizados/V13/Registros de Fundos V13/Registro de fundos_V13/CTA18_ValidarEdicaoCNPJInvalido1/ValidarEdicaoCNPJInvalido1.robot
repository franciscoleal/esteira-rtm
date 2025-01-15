*** Settings ***
Documentation      Essa automação valida cadastro de uma nova Classe com o CNPJ inválido em um Fundo que já possua uma Classe com CNPJ válido

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundos][Test18] Validar cadastro de uma nova Classe com o CNPJ inválido em um Fundo que já possua uma Classe com CNPJ válido
    [Tags]    test18
    Acessar o HUB    ${EMAIL}
    Selecionar acesso    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIDC    FIDC    Monoclasse
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe fidc
    Preencher perfil da classe com argumentos completo FIDC V13   FIDC    FIDC    FIDC Outros    Indexados    Indices
    Preencher taxas da classe Registros V13
    Preencher os prestadores da classe FIF/FIDC
    Concluir classe sem subclasse
    Preencher perfil complementar FIDC V13
    Preencher valor minimo e movimentacao FIDC
    Cadastrar prestadores da subclasse FIDC V13
    Pesquisar fundo no rascunho
    Editar fundo casca
    Inserir e validar CNPJ invalido na edicao do fundo casca    