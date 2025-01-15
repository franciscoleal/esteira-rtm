*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo RF Previdência RF Duração Média Grau de Inv

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Registro de Fundo]Registrar fundo do tipo RF Previdência RF Duração Média Grau de Inv
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIF Renda Fixa    FIF    Monoclasse
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe de renda fixa    teste REFERENCIADO Fundo de Investimento em Cotas CRED PRIV IE Prev Responsabilidade Limitada    teste REFERENCIADO Fundo de Investimento em Cotas CRED PRIV IE Prev Responsabilidade Limitada
    Preencher perfil da classe com argumentos RF previdencia V13    Renda fixa    Previdência    Previdência RF Duração Média Grau Invest    DURACAO_MEDIA    GRAU_INVESTIMENTO
    Alterar o preenchimento das taxas da classe para subclasse
    Preencher os prestadores da classe
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse V13
    Preencher perfil da subclasse codigo CVM/B3 Cambial V13
    Preencher taxas da classe RF Previdencia V13
    Preencher valor minimo e movimentacao
    Cadastrar prestadores da subclasse
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar por CNPJ V13       ${CNPJ_VALIDO}
    Validar fundo em analise    PrevidenciaRFDuracaoMediaGrauDeInv