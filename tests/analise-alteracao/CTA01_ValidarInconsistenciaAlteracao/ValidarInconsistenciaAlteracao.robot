*** Settings ***
Documentation       Essa automação valida marcação de inconsistências em 
...                 fundos enviados na Alteração para a ANBIMA

Resource            ../../../main.robot

Test Setup          Navegador-Config.Abrir o navegador
Test Teardown       Navegador-Config.Fechar o navegador


*** Test Cases ***
# [Test01]Validar marcação de inconsistências em fundos enviados na Alteração - ANBIMA - FIF
#     [Tags]    inconsistencia
#     Acessar o HUB    ${EMAIL}    ${LINK_HUB_UAT}
#     Validar perfil    Administrador
#     Criar fundo casca valido completo com subclasse V13
#     Enviar para analise anbima
#     Get Register Number
#     Alterar o acesso para autorregulador
#     Clicar na opção fundos
#     Filtrar fundo por numero da solicitacao
#     Acessar solicitacao
#     Acessar analise de cadastro
#     Aprovar registro
#     Alterar acesso para administrador
#     Efetuar alteração no fundo aprovado
#     Alterar o acesso para autorregulador
#     Clicar na opção fundos
#     Filtro avançado para alteracao
#     Analisar alteracao
#     Validar apontamento de inconsistencia    FIF


# FII-Tijolo-Renda-Gestao-Ativa-Monoclasse
# FIP-Fundos-Participacoes-Monoclasse
# FIF-Multimercados-Balanceados-Monoclasse
# FIF-Acoes-Monoclasse
# FIDC-Outros-Monoclasse
# ETF-Renda-Variavel-Monoclasse
# ETF-Renda-Fixa-Monoclasse
# OFFSHORE-Renda-Fixa-Multiclasse

[Test01]Validar marcação de inconsistências em fundos enviados na Alteração
    # Acesso ao Hub Anbima
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_DEV_V13}
    # Alterar o perfil para Instituição ou Autorregulador
    Profile.Alterar o perfil    Perfil=Administrador    Instituicao=ITAU    menu=1
    # Cadastrar novo Fundo
    Novo-Fundo.Efetuar novo Registro de Fundos através do formulário
    # Input dos dados vindo de um Json
    Input-dados.Input dos Dados
    ...    PATH-JSON=${EXECDIR}${/}py-robot-cvm175-rtm${/}resources${/}data${/}OFFSHORE-Renda-Fixa-Multiclasse.json    
    # Cadastro do Fundo Casca
    Cadastrar-Fundo-Casca.[Fundo Casca]Cadastrar Fundo Casca
    # Cadastro da Classe
    Cadastrar-Classe.[Classe]Cadastrar Classe
    
    # Cadastro da SubClasse
    Cadastrar-SubClasse.[SubClasse]Cadastrar SubClasse
    
    Enviar-Analise-Anbima.Enviar para Análise Anbima
    # Aprovação do Fundo
    Profile.Alterar o perfil    Perfil=Autorregulador    Instituicao=ANBIMA    menu=1
    
    Filtrar-Solicitacoes-Por-CNPJ.Filtrar Solicitações por CNPJ e confirmar status    STATUS=Aguardando análise Anbima
    
    Analise-de-Registro.Analisar o Registro de Fundo - Cadastro
    Aprovar-Registro.Aprovar Registro de Fundo 
    # Alteração do Fundo
    Profile.Alterar o perfil    Perfil=Administrador    Instituicao=ITAU    menu=1
    Menu-Fundos.Clicar no Menu Fundos    Registrados
    Filtrar-Por-Numero-Solicitacao.Filtrar por Número de Solicitação
    Alterar-Fundo-Aprovado.Efetuar alteração no fundo aprovado
    # Analise de Alteração
    Profile.Alterar o perfil    Perfil=Autorregulador    Instituicao=ANBIMA    menu=1
    Menu-Fundos.Clicar no Menu Fundos
    Filtro-Avancado.Filtro Avançado para Alteração
    Analisar-Alteracao.Analisar Alteração
    Enviar-Inconsistencias.Enviar Inconsistências para Instituição
    # Correções das Inconsistências
    Profile.Alterar o perfil    Perfil=Administrador    Instituicao=ITAU    menu=1
    Menu-Fundos.Clicar no Menu Fundos
    Filtro-Avancado.Filtro Avançado para Alteração
    Verificar-Inconsistencia.Verificar as Inconsistências enviadas pelo Autorregulador
    # Aprovar Alteração
    Profile.Alterar o perfil    Perfil=Autorregulador    Instituicao=ANBIMA    menu=1
    Menu-Fundos.Clicar no Menu Fundos
    Filtro-Avancado.Filtro Avançado para Alteração
    Aprovar-Alteracao.Aprovar Alteração
    Profile.Alterar o perfil    Perfil=Administrador    Instituicao=ITAU    menu=1