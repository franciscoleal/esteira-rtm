*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo Fundos de Participações

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundo]Registrar fundo do tipo Fundos de Participações
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIP    FIP    Monoclasse
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos FIP V13
    Concluir o fundo casca
    Preencher os dados cadastrais da classe de renda fixa    teste Fundo de Investimento em Cotas IE Prev Responsabilidade Limitada    teste Fundo de Investimento em Cotas IE Prev Responsabilidade Limitada
    Preencher perfil da classe com argumentos completo FIP V13    FIP    FIP    Fundos de Participações    Indexados    Indices
    Alterar o preenchimento das taxas da classe para subclasse
    Preencher os prestadores da classe
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse V13
    Preencher perfil complementar FIP V13
    Preencher taxas da classe RF Previdencia V13
    Preencher valor minimo e movimentacao FIP Fundos
    Cadastrar prestadores da subclasse
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar por CNPJ V13       ${CNPJ_VALIDO}
    Validar fundo em analise    FIPFundosDeParticipacoes