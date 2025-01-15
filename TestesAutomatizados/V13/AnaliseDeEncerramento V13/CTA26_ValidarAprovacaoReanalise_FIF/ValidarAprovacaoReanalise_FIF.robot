*** Settings ***
Documentation      Essa automação valida Aprovação da reanalise das inconsistências apontadas pela Anbima a Instituição - ANBIMA - FIF

Resource           ../../../Keywords/Keywords.robot
Resource    ../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test26]Validar Aprovação da reanalise das inconsistências apontadas pela Anbima a Instituição - ANBIMA - FIF
    [Tags]    aprovacao    reanalise
    Acessar o HUB    ${EMAIL}
    Selecionar acesso    ITAU UNIBANCO SA
    Criar fundo casca valido completo com subclasse V13
    Enviar para analise anbima
    Get Register Number
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Aprovar registro
    Validar aprovacao do registro    FIF
    Alterar acesso para administrador
    Filtrar registrados
    Alterar status para encerramento
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar por CNPJ    Aguardando análise anbima
    Apontar inconsistencia no encerramento    Evidencia_AnaliseDeEncerramento_FIF
    Filtrar por CNPJ    Aguardando informações instituição
    Pegar numero da solicitacao
    Alterar acesso para administrador
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Editar campos com inconsistencia
    Validar edicao de campos com inconsistencia    Evidencia_Edicao_Inconsistencia_FIF
    Alterar acesso para autorregulador
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Reanalisar inconsistencias no encerramento
    Alterar acesso para administrador
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Editar campos com inconsistencia
    Alterar acesso para autorregulador
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Aprovar fundo no encerramento
    Validar aprovacao analise de encerramento    Validar_Aprovacao_AnaliseEncerramento_FIF