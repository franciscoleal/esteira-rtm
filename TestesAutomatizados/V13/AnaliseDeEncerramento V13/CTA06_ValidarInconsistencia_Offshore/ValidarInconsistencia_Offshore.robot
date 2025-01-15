*** Settings ***
Documentation      Essa automação valida marcação de inconsistências em fundos enviados no Encerramento - ANBIMA - Offshore

Resource           ../../../Keywords/Keywords.robot
Resource    ../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test06]Validar marcação de inconsistências em fundos enviados no Encerramento - ANBIMA - Offshore
    [Tags]    inconsistencia
    Acessar o HUB    ${EMAIL}
    Selecionar acesso    ITAU UNIBANCO SA
    Criar fundo casca valido completo com subclasse Offshore V13
    Enviar para analise anbima
    #Get Register Number
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Aprovar registro
    #Validar aprovacao do registro    Offshore
    Alterar acesso para administrador
    Filtrar registrados OffShore
    Alterar status para encerramento
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar por CNPJ    Aguardando análise anbima
    Apontar inconsistencia no encerramento    Evidencia_AnaliseDeEncerramento_OffShore
    Alterar acesso para administrador
    Validar inconsistencia no encerramento    Evidencia_Encerramento_OffShore