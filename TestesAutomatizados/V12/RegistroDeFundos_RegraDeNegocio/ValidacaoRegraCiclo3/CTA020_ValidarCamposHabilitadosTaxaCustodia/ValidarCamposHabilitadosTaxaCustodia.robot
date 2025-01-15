*** Settings ***
Documentation      Essa automação valida campos habilitados relacionados ao campo retornado pela Anbima com inconsistência - Cobra Taxa de custódia

Resource           ../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Test020]Validar campos habilitados relacionados ao campo retornado pela Anbima com inconsistência - Cobra Taxa de custódia
    Acessar o HUB    vimerson.miura@vericode.com.br
    Selecionar acesso para Administrador    ITAU
    Criar fundo casca valido completo com subclasse ETF
    Enviar para analise anbima
    Get Register Number
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Indicar inconsistencia no campo taxa custodia
    Alterar acesso para administrador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Validar inconsistencias no campo taxa de custodia    Evidencia_Campos_Habilitados_Taxa_Custodia
    Enviar ajustes inconsistencia para Anbima
    Clicar na opção fundos
    Filtrar por CNPJ    Aguardando análise anbima
    Validar filtro por status    Aguardando análise anbima