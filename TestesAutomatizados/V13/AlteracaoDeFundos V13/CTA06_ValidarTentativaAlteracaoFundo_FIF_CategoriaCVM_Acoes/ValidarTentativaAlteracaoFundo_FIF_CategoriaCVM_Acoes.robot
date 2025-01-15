*** Settings ***
Documentation      Essa automação tentar alterar fundo com status diferente de "Ativo"

Resource           ../../../Keywords/Keywords.robot
Resource    ../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Alteração Validação regras][Test06] Validar a tentativa de alteração de um fundo do tipo FIF e categoria CVM Ações
    [Tags]    test04
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Criar fundo casca valido completo com subclasse FIF Multimercado V13
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
    Alterar campo Categoria CVM em Perfil da classe Ações
    Enviar para analise anbima a alteração
    Lista de inconsistência FIF
    Ajustar inconsistências FIF

    #Alterar acesso para autorregulador
    #Clicar na opção fundos
    #Analisar alteracao
    #Aprovar alteracao
    #Filtrar por CNPJ    ${CNPJ_VALIDO}
    #Validação alteração