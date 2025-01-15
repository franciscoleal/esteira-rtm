*** Settings ***
Documentation      Essa automação valida campos habilitados relacionados ao campo retornado pela Anbima com inconsistência - Prazo de duração (casca e classe)

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Test012]Validar campos habilitados relacionados ao campo retornado pela Anbima com inconsistência - Prazo de duração (casca e classe)
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Criar fundo casca valido completo com subclasse V13
    Enviar para analise anbima
    Get Register Number
    Alterar o acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao no perfil autorregulador
    Clicar por numero da solicitacao de Registro de fundo
    Acessar analise de cadastro
    Indicar inconsistencia no fundo casca e nas classes no campo prazo duracao
    Alterar acesso para administrador
    Clicar na opção fundos    Solicitações
    Filtrar por CNPJ V13       ${CNPJ_VALIDO}
    Clicar por numero da solicitacao de Registro de fundo
    Validar inconsistencias no prazo duracao do fundo casca    Evidencia_Inconsistencia_Prazo_Duracao_Casca
    #Validar inconsistencias no prazo duracao do fundo classe    Evidencia_Inconsistencia_Prazo_Duracao_Classe
    Enviar ajustes inconsistencia para Anbima
    Clicar na opção fundos
    Filtrar por CNPJ    Aguardando análise anbima    #voltar
    Validar filtro por status    Aguardando análise anbima