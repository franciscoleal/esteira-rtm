*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo FIF Multimercado

Resource    ../../../../../main.robot

Test Setup         Navegador-Config.Abrir o navegador
Test Teardown      Navegador-Config.Fechar o navegador

*** Test Cases ***

[Registro de Fundo]Registrar fundo do tipo FIF Multimercado
    Login.Acessar o HUB    ${EMAIL}
    Profile.Alterar o perfil    Administrador    ITAU    1
    Clicar na opção fundos    Solicitações
    Pause Execution
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIF    FIF    Monoclasse
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe multimercado
    Preencher perfil da classe com argumentos completo V13   Multimercado    Multimercado   Multimercados Livre    ESTRATEGIAS    LIVRE
    Preencher taxas da classe Registros V13
    Preencher os prestadores da classe FIF/FIDC       
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse V13
    Preencher perfil da subclasse FIF V13
    Preencher taxas Subclasse V13
    Preencher valor minimo e movimentacao
    Cadastrar prestadores da subclasse
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    FIFMultimercado
