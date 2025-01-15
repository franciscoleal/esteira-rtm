*** Settings ***
Documentation      Essa automação valida campos habilitados relacionados ao campo retornado pela Anbima com inconsistência - Possui benchmark

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Test015]Validar campos habilitados relacionados ao campo retornado pela Anbima com inconsistência - Possui benchmark
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Criar fundo casca valido completo com subclasse
    Enviar para analise anbima
    Get Register Number
    Alterar o acesso para autorregulador
    Clicar na opção fundos
    Filtrar por CNPJ V13       ${CNPJ_VALIDO}
    Clicar por numero da solicitacao de Registro de fundo
    Acessar analise de cadastro
    Indicar inconsistencia no campo possui benchmark
    Alterar acesso para administrador
    Clicar na opção fundos
    Filtrar por CNPJ V13       ${CNPJ_VALIDO}
    Clicar por numero da solicitacao de Registro de fundo
    Validar inconsistencias no campo possui Benchmark   Evidencia_Campos_Habilitados_Possui_Benchmark    #esta com bug para ajustar campo
    Enviar ajustes inconsistencia para Anbima
    Clicar na opção fundos
    Filtrar por CNPJ    Aguardando análise anbima
    Validar filtro por status    Aguardando análise anbima