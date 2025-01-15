*** Settings ***
Documentation      Essa automação valida aprovação de fundo enviados no Encerramento - ANBIMA - ETF

Resource           ../../../Keywords/Keywords.robot
Resource    ../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test11]Validar aprovação de fundo enviados no Encerramento - ANBIMA - ETF
    [Tags]    aprovacao
    Acessar o HUB    ${EMAIL}
    Selecionar acesso    ITAU UNIBANCO SA
    Criar fundo casca valido completo com subclasse ETF V13
    Enviar para analise anbima
    #Get Register Number
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Aprovar registro
    #Validar aprovacao do registro    ETF
    Alterar acesso para administrador
    Filtrar registrados
    Alterar status para encerramento
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar por CNPJ    Aguardando análise anbima
    Aprovar fundo no encerramento
    Validar aprovacao analise de encerramento    Validar_Aprovacao_AnaliseEncerramento_ETF
    Alterar acesso para administrador