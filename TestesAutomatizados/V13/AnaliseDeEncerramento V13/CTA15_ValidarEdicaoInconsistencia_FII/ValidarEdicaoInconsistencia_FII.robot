*** Settings ***
Documentation      Essa automação valida edição dos campos marcados como inconsistência - Instituição - FII

Resource           ../../../Keywords/Keywords.robot
Resource    ../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test15]Validar edição dos campos marcados como inconsistência - Instituição - FII
    [Tags]    inconsistencia
    Acessar o HUB    ${EMAIL}
    Selecionar acesso    ITAU UNIBANCO SA
    Criar fundo casca valido completo com subclasse FII V13
    Enviar para analise anbima
    Get Register Number
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Aprovar registro
    Clicar na opção fundos    Solicitações
    Validar aprovacao do registro    FII
    Alterar acesso para administrador
    Filtrar registrados
    Alterar status para encerramento
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar por CNPJ    Aguardando análise anbima
    Apontar inconsistencia no encerramento    Evidencia_AnaliseDeEncerramento_FII
    Filtrar por CNPJ    Aguardando informações instituição
    Pegar numero da solicitacao
    Alterar acesso para administrador
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Editar campos com inconsistencia
    Validar edicao de campos com inconsistencia    Evidencia_Edicao_Inconsistencia_FII