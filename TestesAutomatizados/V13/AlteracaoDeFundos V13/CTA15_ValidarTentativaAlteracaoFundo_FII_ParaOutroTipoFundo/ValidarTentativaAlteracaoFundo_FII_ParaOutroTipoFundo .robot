*** Settings ***
Documentation      Essa automação tentar alterar fundo com status diferente de "Ativo"

Resource           ../../../Keywords/Keywords.robot
Resource    ../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Alteração Validação regras][Test15] Validar a tentativa de alteração do tipo do fundo FII para outro tipo de fundo
    [Tags]    test15
    Acessar o HUB    ${EMAIL}
    Criar fundo casca valido completo com subclasse FII V13
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
    Clicar em editar Fundo Casca
    Alterar campo Categoria CVM em Perfil da classe FII
    Enviar para analise anbima a alteração
    Clicar na opção fundos
    Filtrar por CNPJ    ${CNPJ_VALIDO}
    Validação alteração