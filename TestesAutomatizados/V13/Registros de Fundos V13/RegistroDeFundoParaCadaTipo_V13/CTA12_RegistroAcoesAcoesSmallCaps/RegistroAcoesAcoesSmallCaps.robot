*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo Fundos de Ações Small Caps

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de Fundo]Registrar fundo do tipo Fundos de Ações Small Caps
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    Ações    FIF    Monoclasse
    Preencher perfil do fundo
    Preencher os prestadores
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe com argumentos    Teste Mercado de Acesso IE BDR Nível 1    Teste Mercado de Acesso IE BDR Nível 1
    Preencher perfil da classe com argumentos acoes Small Caps V13    Ações    Ações    Ações Small Caps    ATIVOS    SMALL_CAPS
    Alterar o preenchimento das taxas da classe para subclasse
    Preencher os prestadores da classe
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse V13
    Preencher perfil da subclasse codigo CVM/B3 acoes V13
    Preencher taxas da classe Registros V13
    Preencher valor minimo e movimentacao FIF Ações
    Cadastrar prestadores da subclasse
    Validar se registro possui inconsistencia V13
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar por CNPJ V13       ${CNPJ_VALIDO}
    Validar fundo em analise    AcoesAcoesSmallCaps
