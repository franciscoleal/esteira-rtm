*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Criar Fundo Casca Válido completo com SubClasse
    # Wait Until Keyword Succeeds    5x    5ms    Commons.Visivel    //a[contains(.,'Início')]
    Novo-Fundo.Efetuar novo Registro de Fundos através do formulário
    Cadastrar-Fundo-Casca.[Fundo Casca]Cadastrar Fundo Casca
    Cadastrar-Classe.[Classe]Cadastrar Classe 
    Cadastrar-SubClasse.[SubClasse]Cadastrar SubClasse
    Validar-Detalhes-Fundo.Validar tela detalhes do fundo