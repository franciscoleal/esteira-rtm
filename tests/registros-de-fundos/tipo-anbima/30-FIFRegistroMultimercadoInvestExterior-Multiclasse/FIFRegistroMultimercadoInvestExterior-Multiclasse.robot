*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo Fundos de Ações com multiplas classes

Resource    ../../../../main.robot

Test Setup         Navegador-Config.Abrir o navegador
Test Teardown      Navegador-Config.Fechar o navegador

*** Test Cases ***
[Registro de Fundo]Registrar Fundo FIF Multimercado Multiclasse - CERT
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_CERT}
    Profile.Alterar o perfil    Perfil=Administrador    Instituicao=ITAU    menu=1
    Novo-Fundo.Efetuar novo Registro de Fundos através do formulário
    Cadastrar-Fundo-Casca.[Fundo Casca]Cadastrar Fundo Casca
    Cadastrar-Classe.[Classe]Cadastrar Classe
    Cadastrar-SubClasse.[SubClasse]Cadastrar SubClasse
    Cadastrar-Classe-adicional.Cadastrar Classe adicional com SubClasse
    Validar-Detalhes-Fundo.Validar tela detalhes do fundo

[Registro de Fundo]Registrar Fundo FIF Multimercado Multiclasse - UAT
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_UAT}
    Profile.Alterar o perfil    Perfil=Administrador    Instituicao=ITAU    menu=1
    Novo-Fundo.Efetuar novo Registro de Fundos através do formulário
    Cadastrar-Fundo-Casca.[Fundo Casca]Cadastrar Fundo Casca
    Cadastrar-Classe.[Classe]Cadastrar Classe
    Cadastrar-SubClasse.[SubClasse]Cadastrar SubClasse
    Cadastrar-Classe-adicional.Cadastrar Classe adicional com SubClasse
    Validar-Detalhes-Fundo.Validar tela detalhes do fundo
