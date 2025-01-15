*** Settings ***
Documentation      Essa automação valida retorno de inconsistência apontada 4x em campos diferentes pela Anbima [Fundo FII][Classe e Subclasse]

Resource           ../../../Keywords/Keywords.robot
Resource    ../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test67] Validar retorno de inconsistência apontada 4x em campos diferentes pela Anbima [Fundo FII][Classe e Subclasse]
    [Tags]    inconsistencia    reanalise
    Acessar o HUB    ${EMAIL}
    Selecionar acesso    ITAU UNIBANCO SA
    Criar fundo casca valido completo com subclasse FII V13
    Alterar status para encerrado
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar por CNPJ    Aguardando análise anbima
    ##########Primeira Inconsistencia###################
    Apontar inconsistencia no encerramento    Evidencia_AnaliseDeEncerramento_FII
    Filtrar por CNPJ    Aguardando informações instituição
    Pegar numero da solicitacao
    Alterar acesso para administrador
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Editar campos com inconsistencia
    Alterar acesso para autorregulador
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    ##########Segunda Inconsistencia###################
    Reanalisar inconsistencias no encerramento
    Alterar acesso para administrador
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Editar campos com inconsistencia apos reanalise
    Alterar acesso para autorregulador
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    ##########Terceira Inconsistencia###################
    Apontar inconsistencia na subclasse encerramento
    Alterar acesso para administrador
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Editar campos com inconsistencia na subclasse
    Alterar acesso para autorregulador
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    ##########Quarta Inconsistencia###################
    Apontar 2 inconsistencias na subclasse encerramento
    Alterar acesso para administrador
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Editar campos com 2 inconsistencias na subclasse
    Validar reanalise Encerramento    Evidencia_Retorno_Inconsistencia_4X_FII    Aguardando análise anbima