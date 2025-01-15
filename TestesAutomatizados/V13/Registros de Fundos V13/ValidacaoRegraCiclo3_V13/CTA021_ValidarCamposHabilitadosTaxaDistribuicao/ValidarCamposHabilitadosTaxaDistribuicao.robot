*** Settings ***
Documentation      Essa automação valida campos habilitados relacionados ao campo retornado pela Anbima com inconsistência - Cobra Taxa de distribuição

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Test021]Validar campos habilitados relacionados ao campo retornado pela Anbima com inconsistência - Cobra Taxa de distribuição
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Criar fundo casca valido completo com subclasse FII V13
    Enviar para analise anbima
    Get Register Number
    Alterar o acesso para autorregulador
    Clicar na opção fundos
    Filtrar por CNPJ V13       ${CNPJ_VALIDO}
    Clicar por numero da solicitacao de Registro de fundo
    Acessar analise de cadastro
    Indicar inconsistencia no campo taxa distribuicao
    Alterar acesso para administrador
    Clicar na opção fundos
    Filtrar por CNPJ V13       ${CNPJ_VALIDO}
    Clicar por numero da solicitacao de Registro de fundo
    Validar inconsistencias no campo taxa de distribuicao    Evidencia_Campos_Habilitados_Taxa_Distribuicao
    Enviar ajustes inconsistencia para Anbima
    Filtrar por CNPJ V13       ${CNPJ_VALIDO}
    Filtrar por CNPJ    Aguardando análise anbima
    Validar filtro por status    Aguardando análise anbima