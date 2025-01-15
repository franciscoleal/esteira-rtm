*** Settings ***
Documentation      Essa automação valida domínio de todos os campos

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test02] Validar domínio de todos os campos 
    Acessar o HUB    ${EMAIL}
    Selecionar acesso para Administrador    ITAU
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    ETF    ETF    Monoclasse
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe com argumentos    Teste Infraestrutura Previdênciario LP CIC Classe de investimento em cotas    Teste Infraestrutura Previdênciario LP CIC Classe de investimento em cotas
    Preencher perfil da classe com argumentos Renda Fixa Regra Ciclo2 V13    ETF    ETF    ETF Renda Fixa    Vazia    Vazia
    Preencher taxas da classe ETF Renda Fixa Regra Ciclo2 V13
    Preencher os prestadores da classe
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
