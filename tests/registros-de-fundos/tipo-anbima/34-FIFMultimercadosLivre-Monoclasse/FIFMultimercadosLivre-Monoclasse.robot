*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo FIF Multimercado

Resource    ../../../../main.robot

Test Setup         Navegador-Config.Abrir o navegador
Test Teardown      Navegador-Config.Fechar o navegador

*** Test Cases ***
[Registro de Fundo]Registrar fundo do tipo FIF Multimercado Monoclasse - CERT
    [Documentation]    Para verificar qual o número de solicitação navegue até 
    ...    dados cadastrais no Fundo Casca, na ultima linha 
    [Tags]    V13.1    monoclasse
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_CERT}
    Profile.Alterar o perfil    Perfil=Administrador    Instituicao=ITAU    menu=1
    Novo-Fundo.Efetuar novo Registro de Fundos através do formulário
    Cadastrar-Fundo-Casca.[Fundo Casca]Cadastrar Fundo Casca
    ...    PATH-JSON=${EXECDIR}${/}py-robot-cvm175-rtm${/}resources${/}data${/}fif-multimercado-monoclasse.json   
    Cadastrar-Classe.[Classe]Cadastrar Classe
    Cadastrar-SubClasse.[SubClasse]Cadastrar SubClasse
    Validar-Detalhes-Fundo.Validar tela detalhes do fundo
    Menu-Fundos.Clicar no Menu Fundos
    Validar-Fundo-Analise.Validar fundo em analise    TYPE=FIFMultimercado

[Registro de Fundo]Registrar fundo do tipo FIF Multimercado Monoclasse - UAT
    [Documentation]    Para verificar qual o número de solicitação navegue até 
    ...    dados cadastrais no Fundo Casca, na ultima linha 
    [Tags]    V13.1    monoclasse
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_UAT}
    Profile.Alterar o perfil    Perfil=Administrador    Instituicao=ITAU    menu=1
    Novo-Fundo.Efetuar novo Registro de Fundos através do formulário
    Cadastrar-Fundo-Casca.[Fundo Casca]Cadastrar Fundo Casca
    ...    PATH-JSON=${EXECDIR}${/}py-robot-cvm175-rtm${/}resources${/}data${/}fif-multimercado-monoclasse.json 
    Cadastrar-Classe.[Classe]Cadastrar Classe
    Cadastrar-SubClasse.[SubClasse]Cadastrar SubClasse
    Validar-Detalhes-Fundo.Validar tela detalhes do fundo
    Menu-Fundos.Clicar no Menu Fundos
    Validar-Fundo-Analise.Validar fundo em analise    TYPE=FIFMultimercado
    
[Registro de Fundo]Registrar fundo do tipo FIF Multimercado Monoclasse - DEV_V13
    [Documentation]    Para verificar qual o número de solicitação navegue até 
    ...    dados cadastrais no Fundo Casca, na ultima linha 
    [Tags]    V13.1    monoclasse
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_DEV_V13}
    Profile.Alterar o perfil    Perfil=Administrador    Instituicao=ITAU    menu=1
    Novo-Fundo.Efetuar novo Registro de Fundos através do formulário
    Cadastrar-Fundo-Casca.[Fundo Casca]Cadastrar Fundo Casca
    ...    PATH-JSON=${EXECDIR}${/}py-robot-cvm175-rtm${/}resources${/}data${/}fif-multimercado-monoclasse.json 
    Cadastrar-Classe.[Classe]Cadastrar Classe
    Cadastrar-SubClasse.[SubClasse]Cadastrar SubClasse
    Validar-Detalhes-Fundo.Validar tela detalhes do fundo
    Menu-Fundos.Clicar no Menu Fundos
    Validar-Fundo-Analise.Validar fundo em analise    TYPE=FIFMultimercado
    