*** Settings ***
Documentation      Essa automação valida campos habilitados relacionados ao campo retornado pela Anbima com inconsistência - Cobra taxa de performance

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Test017]Validar campos habilitados relacionados ao campo retornado pela Anbima com inconsistência - Cobra taxa de performance
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Criar fundo casca valido completo com subclasse V13
    Enviar para analise anbima
    Get Register Number
    Alterar o acesso para autorregulador
    Clicar na opção fundos
    Filtrar por CNPJ V13       ${CNPJ_VALIDO}
    Clicar por numero da solicitacao de Registro de fundo
    Acessar analise de cadastro
    Indicar inconsistencia no campo taxa performance
    Alterar acesso para administrador
    Clicar na opção fundos
    Filtrar por CNPJ V13       ${CNPJ_VALIDO}
    Clicar por numero da solicitacao de Registro de fundo
    Validar inconsistencias no campo taxa de performance classe   Evidencia_Campos_Habilitados_Taxa_Performance_Classe
    #Validar inconsistencias no campo taxa de performance subclasse    Evidencia_Campos_Habilitados_Taxa_Performance_Subclasse
    Ajustar lista inconsistencias taxa performance
    Enviar ajustes inconsistencia para Anbima
    Clicar na opção fundos
    Filtrar por CNPJ    Aguardando análise anbima
    Validar filtro por status    Aguardando análise anbima