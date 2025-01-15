*** Settings ***
Documentation      Essa automação tentar alterar fundo com status diferente de "Ativo"

Resource           ../../../Keywords/Keywords.robot
Resource    ../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Alteração Validação regras][Test03] Validar a inclusão de uma nova subclasse em uma classe já existente
    [Tags]    test03
    Acessar o HUB    ${EMAIL}
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
    Adicionar nova SubClasse
    Preencher os dados cadastrais da nova subclasse V13
    Preencher perfil da subclasse codigo CVM/B3 acoes V13
    Preencher taxas da nova subclasse Registros V13
    Preencher valor minimo e movimentacao
    Cadastrar prestadores nova subclasse
    Clicar em editar Fundo Casca
    Adicionar Documentos no fundo Casca
    Enviar alteração para analise anbima
    Validar nova classe em um fundo ativo