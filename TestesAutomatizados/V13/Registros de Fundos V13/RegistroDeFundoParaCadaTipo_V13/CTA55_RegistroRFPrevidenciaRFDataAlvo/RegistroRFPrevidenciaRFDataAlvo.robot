*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo Previdência RF Data Alvo

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Registro de Fundo]Registrar fundo do tipo RF Previdência RF Data Alvo
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIF Renda Fixa    FIF    Monoclasse
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe de renda fixa    teste REFERENCIADO LP Fundo de Investimento em Cotas CRED PRIV IE Infra Prev Responsabilidade Limitada    teste REFERENCIADO LP Fundo de Investimento em Cotas CRED PRIV IE Infra Prev Responsabilidade Limitada
    Preencher perfil da classe com argumentos RF previdencia V13    Renda fixa    Previdência    Previdência RF Data Alvo    RENDA_FIXA_DATA_ALVO    DATA_ALVO
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
    Validar fundo em analise    PrevidenciaRFDataAlvo