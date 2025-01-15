*** Settings ***
Documentation      Essa automação valida campos habilitados de acordo com o tipo do fundo  - FIP

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test004]Validar campos habilitados de acordo com o tipo do fundo - FIP
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FIP    FIP    Monoclasse
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos FIP V13
    Concluir o fundo casca
    Preencher os dados cadastrais da classe com argumentos    Teste Fiagro Infraestrutura Classe de Cotas CIC     Teste Fiagro Infraestrutura Classe de Cotas CIC
    Preencher perfil da classe validando campos habilitados FIP V13    FIP    FIP    Fundos de Participações    vazia    vazia
    Preencher taxas FIP da V13
    Preencher os prestadores da classe FIF/FIDC
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse V13
    Preencher perfil da subclasse codigo CVM/B3 FIP V13
    Preencher taxas Subclasse V13
    Preencher valor minimo e movimentacao FIP
    Cadastrar prestadores da subclasse
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar por CNPJ V13       ${CNPJ_VALIDO}
    Validar fundo em analise    FIPFundosDeParticipacoes