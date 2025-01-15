*** Settings ***
Documentation      Essa automação realiza um cadastro de um fundo do tipo FII Papel CRI Gestão Ativa

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Registro de Fundo]Registrar fundo do tipo FII Papel CRI Gestão Ativa
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos
    Preencher os dados cadastrais    FII    FII    Monoclasse
    Preencher perfil do fundo
    Preencher os prestadores FII
    Preencher os documentos
    Concluir o fundo casca
    Preencher os dados cadastrais da classe com argumentos    teste    teste
    Preencher perfil da classe com argumentos completo FII V13    FII    FII    Papel CRI Gestão Ativa    vazia    vazia
    Alterar o preenchimento das taxas da classe para subclasse
    Preencher os prestadores da classe FII
    Concluir classe com subclasse
    Preencher os dados cadastrais da subclasse V13
    Preencher perfil da subclasse codigo CVM/B3 FII V13
    Preencher taxas FII V13
    Preencher valor minimo e movimentacao FIDC ou FII
    Cadastrar prestadores da subclasse FII
    Validar tela detalhes do fundo
    Enviar para analise anbima
    Clicar na opção fundos    Solicitações
    Filtrar por CNPJ V13       ${CNPJ_VALIDO}
    Validar fundo em analise    FIIPapelCRIGestaoAtiva