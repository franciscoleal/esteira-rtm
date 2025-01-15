*** Settings ***
Resource    ../../../main.robot


Test Setup          Navegador-Config.Abrir o navegador
Test Teardown       Navegador-Config.Fechar o navegador

*** Test Cases ***
[Análise de Alteração][Taxa Global][Classe] Inconsistência no campo "Data de alteração taxa composição global"
    [Documentation]    Hub aponta inconsistência no campo "Data de alteração taxa composição global", mas mantém todos os campos travados    
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_DEV_V13}
    Profile.Alterar o perfil    Perfil=Administrador    Instituicao=ITAU    menu=1
    Novo-Fundo.Efetuar novo Registro de Fundos através do formulário
    Cadastrar-Fundo-Casca.[Fundo Casca]Cadastrar Fundo Casca
    Cadastrar-Classe.[Classe]Cadastrar Classe
    Cadastrar-SubClasse.[SubClasse]Cadastrar SubClasse
    Enviar-Analise-Anbima.Enviar para Análise Anbima
    Profile.Alterar o perfil    Perfil=Autorregulador    Instituicao=ANBIMA    menu=1
    Filtrar-Solicitacoes-Por-CNPJ.Filtrar Solicitações por CNPJ e confirmar status    STATUS=Aguardando análise Anbima
    Analise-de-Registro.Analisar o Registro de Fundo - Cadastro
    # Aprovar-Registro.Aprovar Registro de Fundo 
    # Profile.Alterar o perfil    Perfil=Administrador    Instituicao=ITAU    menu=1
    # Menu-Fundos.Clicar no Menu Fundos    Registrados
    # Filtrar-Por-Numero-Solicitacao.Filtrar por Número de Solicitação
    Numero-Solicitacao.Disponibilizar os números de solicitação desde Teste