*** Settings ***
Documentation      Essa automação tentar alterar fundo com status diferente de "Ativo"

Resource           ../../../Keywords/Keywords.robot
Resource    ../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Alteração Validação regras][Test02] Validar a inclusão de uma nova classe em um fundo já existente    #com BUG
    [Tags]    test02
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Criar fundo casca valido completo com subclasse FIF V13
    Enviar para analise anbima
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Aprovar registro
    Alterar acesso para administrador
    Filtrar registrados
    Clicar em Alteração em Ações
    Adicionar nova Classe
    Preencher os dados cadastrais da nova classe
    Preencher perfil da nova classe com argumentos acoes Livre V13    Ações    Ações    Ações Livre    ATIVOS    Livre
    Preencher taxas da nova classe Registros V13
    Preencher os prestadores da classe em Fundo Existente
    Preencher perfil complementar nova classe
    Preencher valor minimo e movimentacao
    Cadastrar prestadores complementar
    Clicar em editar Fundo Casca
    Adicionar Documentos no fundo Casca
    Enviar alteração para analise anbima
    Validar nova classe em um fundo ativo