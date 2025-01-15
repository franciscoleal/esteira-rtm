*** Settings ***
Documentation      Essa automação valida marcação de aprovação em fundos enviados no registro - ANBIMA - ETF

Resource           ../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Test11]Validar marcação de Aprovação em fundos enviados no registro - ANBIMA - ETF
    [Tags]    aprovacao
    Acessar o HUB    daniele.negoro@vericode.com.br
    Criar fundo casca valido completo com subclasse ETF
    Enviar para analise anbima
    #Get Register Number
    Alterar acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Acessar analise de cadastro
    Aprovar registro
    Alterar acesso para Administrador
    #Validar aprovacao do registro    ValidaAprovacaoETF
    