*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo Previdência RF Data Alvo

Resource           ../../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Registro de Fundo]Registrar fundo do tipo RF Previdência RF Data Alvo
    Acessar o HUB    vimerson.miura@vericode.com.br
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIF Renda Fixa
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe de renda fixa    teste REFERENCIADO Fundo de Investimento em Cotas CRED PRIV IE Prev    teste REFERENCIADO Fundo de Investimento em Cotas CRED PRIV IE Prev
    Preencher perfil da classe com argumentos RF Previdencia    Renda fixa    Previdência    Previdência RF Data Alvo    RENDA_FIXA_DATA_ALVO    DATA_ALVO
    Preencher as taxas da classe Previdencia
    Preencher os prestadores da classe
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse
    Preencher perfil da subclasse previdencia
    Preencher as taxas de administracao da classe
    Preencher as taxas de gestao da classe
    Preencher as taxas de custodia da classe
    Preencher as taxas de distribuicao da classe
    Preencher as taxas de performance da subclasse performance
    Preencher as taxas de entrada e saida da subclasse
    Preencher as taxas de consultoria especializada da subclasse
    Preencher valor minimo e movimentacao
    Cadastrar prestadores da subclasse
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar fundo por numero da solicitacao
    Validar fundo em analise    PrevidenciaRFDataAlvo