*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo Off-Shore Renda Fixa

Resource    ../../../main.robot

Test Setup         Navegador-Config.Abrir o navegador
Test Teardown      Navegador-Config.Fechar o navegador

*** Test Cases ***
# [Registro de Fundo]Registrar fundo do tipo Off-Shore Renda Fixa
#     Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_UAT}    
#     Validar perfil    Administrador
#     Clicar na opção fundos    Solicitações
#     Clicar em registro de fundos
#     Preencher os dados cadastrais Offshore
#     Preencher perfil do fundo
#     Preencher os prestadores
#     Preencher os documentos
#     Concluir o fundo casca
#     Preencher os dados cadastrais da classe Offshore    teste    teste
#     Preencher perfil da classe com argumentos Offshore V13    Offshore    Offshore    Offshore Renda Fixa    Vazia    Vazia
#     Alterar o preenchimento das taxas da classe para subclasse
#     Preencher os prestadores da classe
#     Concluir classe com subclasse
#     Preencher os dados cadastrais da subclasse V13
#     Preencher perfil da subclasse codigo CVM/B3 OffShore V13
#     Preencher cadastro de taxas    Taxa de administração    Taxa de gestão    Taxa de distribuicão
#     #Preencher taxas da classe RegistrosOffShore V13
#     Preencher valor minimo e movimentacao ETF ou Offshore
#     Cadastrar prestadores da subclasse
#     Keywords.Validar tela detalhes do fundo
#     Enviar para analise anbima
#     Clicar na opção fundos    Solicitações
#     Filtrar fundo por numero da solicitacao offshore 
#     Keywords.Validar fundo em analise    OffShoreRendaFixa


[Registro de Fundo]Registrar fundo do tipo Off-Shore Renda Fixa
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_UAT}
    Profile.Alterar o perfil    Perfil=Administrador    Instituicao=ITAU    menu=1
    Novo-Fundo.Efetuar novo Registro de Fundos através do formulário
    Input-dados.Input dos Dados
    ...    PATH-JSON=${EXECDIR}${/}resources${/}data${/}OFFSHORE-Renda-Fixa-Multiclasse.json
    Cadastrar-Fundo-Casca.[Fundo Casca]Cadastrar Fundo Casca
    Cadastrar-Classe.[Classe]Cadastrar Classe
    Cadastrar-SubClasse.[SubClasse]Cadastrar SubClasse
    Enviar-Analise-Anbima.Enviar para Análise Anbima
    Menu-Fundos.Clicar no Menu Fundos
    Filtrar-Por-Numero-Solicitacao.Filtrar por Número de Solicitação    Offshore
    Validar-Fundo-Analise.Validar fundo em analise    OffShoreRendaFixa