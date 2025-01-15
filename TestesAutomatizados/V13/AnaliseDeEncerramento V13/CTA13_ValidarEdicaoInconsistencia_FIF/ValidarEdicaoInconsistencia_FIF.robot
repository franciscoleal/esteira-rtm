*** Settings ***
Documentation      Essa automação valida edição dos campos marcados como inconsistência - Instituição - FIF

Resource           ../../../Keywords/Keywords.robot
Resource    ../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test13]Validar edição dos campos marcados como inconsistência - Instituição - FIF
    [Tags]    inconsistencia    edicao
    Acessar o HUB    ${EMAIL}
    Selecionar acesso    ITAU UNIBANCO SA
    Criar fundo casca valido completo com subclasse V13
    Enviar para analise anbima
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Aprovar registro
    Alterar acesso para administrador
    Filtrar registrados
    Alterar status para encerramento
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar por CNPJ    Aguardando análise anbima
    Apontar inconsistencia no encerramento    Evidencia_AnaliseDeEncerramento_FIF
    Alterar acesso para administrador
    Validar inconsistencia no encerramento    Evidencia_Encerramento_FIF
    Editar campos com inconsistencia
    Validar edicao de campos com inconsistencia    Evidencia_Edicao_Inconsistencia_FIF