*** Settings ***
Documentation      Essa automação valida campos habilitados de acordo com o tipo do fundo - ETF

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test005]Validar campos habilitados de acordo com o tipo do fundo - ETF
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    ETF    ETF    Monoclasse
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe com argumentos    Teste     Teste
    Preencher perfil da classe validando campos habilitados ETF V13    ETF    ETF    ETF Renda Fixa    Vazia    Vazia
    Preencher taxas ETF V13
    Preencher os prestadores da classe FIF/FIDC
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse V13
    Preencher perfil da subclasse codigo CVM/B3 ETF V13
    Preencher taxas Subclasse V13
    Preencher valor minimo e movimentacao ETF ou Offshore
    Cadastrar prestadores da subclasse
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar por CNPJ V13       ${CNPJ_VALIDO}
    Validar fundo em analise    ETFRendaFixa
