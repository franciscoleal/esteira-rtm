*** Settings ***
Documentation      Essa automação realiza um cadastro de massa em massa

Resource           ../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***


[Registro de fundos]Cadastro de massa em massa com classe e subclasse
    [Tags]    classe    subclasse
    Acessar o HUB    daniele.negoro@vericode.com.br
    #Criar fundo casca valido completo com subclasse
    #Criar fundo casca valido completo com subclasse FII
    Criar fundo casca valido completo com subclasse FIP
    Criar fundo casca valido completo com subclasse ETF
    Criar fundo casca valido completo com subclasse OFFSHORE
    Criar fundo casca valido completo com subclasse FIDC
    
    # Criar fundo casca valido completo com subclasse
    # Criar fundo casca valido completo com subclasse
    # Criar fundo casca valido completo com subclasse
    # Criar fundo casca valido completo com subclasse
    # Criar fundo casca valido completo com subclasse
    # Criar fundo casca valido completo com subclasse
    # Criar fundo casca valido completo com subclasse
