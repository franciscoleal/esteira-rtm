*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo Fundos de Mono Ação

Resource           ../../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundo]Registrar fundo do tipo Fundos de Mono Ação
    Acessar o HUB    vimerson.miura@vericode.com.br
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIF Ações
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe com argumentos    Teste BDR Nível 1 Mercado de Acesso IE    Teste BDR Nível 1 Mercado de Acesso IE
    Preencher perfil da classe com argumentos    Ações    Ações    Fundos Mono Ação    Especificos    Mono_Acao
    Preencher as taxas da classe
    Preencher os prestadores da classe
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse
    Preencher perfil da subclasse adicional
    Preencher as taxas de administracao da classe
    Preencher as taxas de gestao da classe
    Preencher as taxas de custodia da classe
    Preencher as taxas de distribuicao da classe
    Preencher as taxas de performance da subclasse
    Preencher as taxas de entrada e saida da subclasse
    Preencher as taxas de consultoria especializada da subclasse
    Preencher valor minimo e movimentacao
    Cadastrar prestadores da subclasse
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    AcoesMonoAcao
