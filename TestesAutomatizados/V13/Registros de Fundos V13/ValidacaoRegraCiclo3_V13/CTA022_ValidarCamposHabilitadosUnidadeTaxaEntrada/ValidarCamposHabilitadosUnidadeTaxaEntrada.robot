*** Settings ***
Documentation      Essa automação valida campos habilitados relacionados ao campo retornado pela Anbima com inconsistência - Unidade da taxa de entrada

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Test022]Validar campos habilitados relacionados ao campo retornado pela Anbima com inconsistência - Unidade da taxa de entrada
    Acessar o HUB    ${EMAIL}
    #Validar perfil    Administrador
    #Criar fundo casca valido completo com subclasse FIP V13
    #Enviar para analise anbima
    #Get Register Number
    #Alterar o acesso para autorregulador
    Clicar na opção fundos
    Filtrar por CNPJ V13    20.481.795/0001-04    #${CNPJ_VALIDO}
    Clicar por numero da solicitacao de Registro de fundo
    Acessar analise de cadastro
    Indicar inconsistencia no campo Unidade taxa de entrada
    Alterar acesso para administrador
    Clicar na opção fundos
    Filtrar por CNPJ V13    20.481.795/0001-04    #${CNPJ_VALIDO}
    Clicar por numero da solicitacao de Registro de fundo
    Validar inconsistencias no campo unidade taxa de entrada    Evidencia_Campos_Habilitados_Unidade_Taxa_Entrada
    Enviar ajustes inconsistencia para Anbima
    Clicar na opção fundos
    Filtrar por CNPJ V13    20.481.795/0001-04    #${CNPJ_VALIDO}
    Validar filtro por status    Aguardando análise anbima