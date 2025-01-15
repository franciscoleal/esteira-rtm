*** Settings ***
Documentation      Essa automação tentar alterar fundo com status diferente de "Ativo"

Resource           ../../../Keywords/Keywords.robot
Resource    ../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Alteração Validação regras][Test08] Validar a tentativa de alteração de uma fundo do tipo FIF e categoria CVM Cambial
    [Tags]    test08
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
    Clicar em editar Classe
    Alterar campo Categoria CVM em Perfil da classe Cambial
    Enviar para analise anbima a alteração
    Clicar na opção fundos
    Filtrar por CNPJ    ${CNPJ_VALIDO}
    Validação alteração