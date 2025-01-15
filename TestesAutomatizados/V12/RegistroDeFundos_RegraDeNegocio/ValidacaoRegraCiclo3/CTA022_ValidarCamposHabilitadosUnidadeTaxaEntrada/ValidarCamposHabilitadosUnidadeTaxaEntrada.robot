*** Settings ***
Documentation      Essa automação valida campos habilitados relacionados ao campo retornado pela Anbima com inconsistência - Unidade da taxa de entrada

Resource           ../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Test022]Validar campos habilitados relacionados ao campo retornado pela Anbima com inconsistência - Unidade da taxa de entrada
    Acessar o HUB    vimerson.miura@vericode.com.br
    Selecionar acesso para Administrador    ITAU
    Criar fundo casca valido completo com subclasse FIP
    Enviar para analise anbima
    Get Register Number
    Alterar o acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao no perfil autorregulador
    Acessar solicitacao
    Acessar analise de cadastro
    Indicar inconsistencia no campo Unidade taxa de entrada
    Alterar acesso para administrador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Validar inconsistencias no campo unidade taxa de entrada    Evidencia_Campos_Habilitados_Unidade_Taxa_Entrada
    Enviar ajustes inconsistencia para Anbima
    Clicar na opção fundos
    Filtrar por CNPJ    Aguardando análise anbima
    Validar filtro por status    Aguardando análise anbima