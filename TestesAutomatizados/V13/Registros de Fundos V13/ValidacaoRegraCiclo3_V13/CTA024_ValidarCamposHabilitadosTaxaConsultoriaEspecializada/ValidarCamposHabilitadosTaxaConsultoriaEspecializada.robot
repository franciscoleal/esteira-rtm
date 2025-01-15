*** Settings ***
Documentation      Essa automação valida campos habilitados relacionados ao campo retornado pela Anbima com inconsistência - Cobra Taxa de consultoria especializada

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Test024]Validar campos habilitados relacionados ao campo retornado pela Anbima com inconsistência - Cobra Taxa de consultoria especializada
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Criar fundo casca valido completo com subclasse FIP V13
    Enviar para analise anbima
    Get Register Number
    Alterar o acesso para autorregulador
    Clicar na opção fundos
    Filtrar por CNPJ V13       ${CNPJ_VALIDO}
    Clicar por numero da solicitacao de Registro de fundo
    Acessar analise de cadastro
    Indicar inconsistencia no campo Taxa consultoria especializada
    Alterar acesso para administrador
    Clicar na opção fundos
    Filtrar por CNPJ V13       ${CNPJ_VALIDO}
    Clicar por numero da solicitacao de Registro de fundo
    Validar inconsistencias no campo taxa consultoria especializada    Evidencia_Campos_Habilitados_Taxa_Consultoria_Especializada
    Enviar ajustes inconsistencia para Anbima
    Clicar na opção fundos
    Filtrar por CNPJ V13       ${CNPJ_VALIDO}
    Validar filtro por status    Aguardando análise anbima