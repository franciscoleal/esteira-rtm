*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo Fundos de ETF - Renda Fixa

Resource            ../../../../main.robot

Test Setup         Navegador-Config.Abrir o navegador
Test Teardown      Navegador-Config.Fechar o navegador

*** Test Cases ***

# [Registro de Fundo]Registrar fundo do tipo Fundos de ETF Renda Fixa
Acessar o HUB    ${EMAIL}
    # Validar perfil    Administrador
    # Clicar na opção fundos    Solicitações
    # Clicar em registro de fundos
    # Preencher os dados cadastrais    ETF    ETF    Monoclasse
    # Preencher perfil do fundo
    # Preencher os prestadores
    # Preencher os documentos Regulamento
    # Concluir o fundo casca
    # Preencher os dados cadastrais da classe com argumentos    Teste     Teste
    # Preencher perfil da classe com argumentos Renda Fixa V13    ETF    ETF    ETF Renda Fixa    Vazia    Vazia
    # Alterar o preenchimento das taxas da classe para subclasse
    # Preencher os prestadores da classe
    # Concluir classe com subclasse
    # Preencher os dados cadastrais da subclasse V13
    # Preencher perfil da subclasse codigo CVM/B3 ETF V13
    # Preencher cadastro de taxas    Taxa de administração    Taxa de gestão    Taxa de distribuicão
    # Preencher valor minimo e movimentacao ETF ou Offshore
    # Cadastrar prestadores da subclasse
    # Validar tela detalhes do fundo
    # Enviar para analise anbima
    # Clicar na opção fundos
    # Filtrar por CNPJ    ${CNPJ_VALIDO}
    # Validar fundo em analise    ETFRendaFixa



[Registro de Fundo]Registrar fundo do tipo Fundos de ETF Renda Fixa
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_DEV_V13}
    Profile.Alterar o perfil    Perfil=Administrador    Instituicao=ITAU    menu=1
    Novo-Fundo.Efetuar novo Registro de Fundos através do formulário

    Cadastrar-Fundo-Casca.[Fundo Casca]Cadastrar Fundo Casca
    Cadastrar-Classe.[Classe]Cadastrar Classe
    Cadastrar-SubClasse.[SubClasse]Cadastrar SubClasse

