*** Settings ***
Documentation      Essa automação valida marcação de inconsistências em fundos enviados no Encerramento - ANBIMA - Offshore

Resource    ../../../main.robot

Test Setup         Navegador-Config.Abrir o navegador
Test Teardown      Navegador-Config.Fechar o navegador

*** Test Cases ***

[Test06]Validar marcação de inconsistências em fundos enviados no Encerramento - ANBIMA - Offshore
    [Tags]    inconsistencia
    Acessar o HUB    ${EMAIL}
    Validar perfil    Administrador
    Criar fundo casca valido completo com subclasse Offshore V13
    Enviar para analise anbima
    Get Register Number
    Validar perfil    Autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao offshore
    Acessar solicitacao
    Acessar analise de cadastro
    Aprovar registro
    Validar aprovacao do registro offshore    Offshor
    Validar perfil    Administrador
    # Alterar acesso para Administrador
    Filtrar registrados OffShore
    Alterar status para encerramento
    Validar perfil    Autorregulador
    Clicar na opção fundos
    Filtrar por CNPJ    Aguardando análise anbima
    Apontar inconsistencia no encerramento    Evidencia_AnaliseDeEncerramento_OffShore
    Validar inconsistencia no encerramento    Evidencia_Encerramento_OffShore

[Test06]Validar marcação de inconsistências em fundos enviados no Encerramento - ANBIMA - Offshore 1
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_UAT}
    Profile.Alterar o perfil    Perfil=Administrador    Instituicao=ITAU    menu=1
    Novo-Fundo.Efetuar novo Registro de Fundos através do formulário
    # Input dos dados vindo de um Json
    Input-dados.Input dos Dados
    ...    PATH-JSON=${EXECDIR}${/}py-robot-cvm175-rtm${/}resources${/}data${/}OFFSHORE-Renda-Fixa-Multiclasse.json
    Cadastrar-Fundo-Casca.[Fundo Casca]Cadastrar Fundo Casca
    Cadastrar-Classe.[Classe]Cadastrar Classe
    Cadastrar-SubClasse.[SubClasse]Cadastrar SubClasse
    Enviar-Analise-Anbima.Enviar para Análise Anbima

    # Aprovação do Fundo
    Profile.Alterar o perfil    Perfil=Autorregulador    Instituicao=ANBIMA    menu=1
    Menu-Fundos.Clicar no Menu Fundos
    Filtrar-Por-Numero-Solicitacao.Filtrar por Número de Solicitação    Offshore
    Analise-de-Registro.Analisar o Registro de Fundo - Cadastro
    Aprovar-Registro.Aprovar Registro de Fundo 
    Validar-Aprovacao-Fundo.Validar Aprovacao do Registro

    Profile.Alterar o perfil    Perfil=Administrador    Instituicao=ITAU    menu=1
    Menu-Fundos.Clicar no Menu Fundos    Registrados
    # Filtrar-Por-Numero-Solicitacao.Filtrar por Número de Solicitação    Offshore
    Filtro-Avancado-Registrado.Filtro Avançado Registrado
    Alterar-Status-Encerramento.Alterar Status para Encerramento
    Skip