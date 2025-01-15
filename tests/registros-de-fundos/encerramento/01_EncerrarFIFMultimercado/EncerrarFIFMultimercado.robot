*** Settings ***
Documentation      Essa automação realiza encerramento de FIF Multimercado

Resource           ../../../../main.robot

Test Setup         Navegador-Config.Abrir o navegador
Test Teardown      Navegador-Config.Fechar o navegador

*** Test Cases ***

[Test01] Encerrar FIF Multimercado
    [Tags]    V13.1
    Login.Acessar o HUB    ${EMAIL}    ${LINK_HUB_CERT}
    Profile.Alterar o perfil    Perfil=Administrador    Instituicao=ITAU    menu=1
    Novo-Fundo.Efetuar novo Registro de Fundos através do formulário
    Cadastrar-Fundo-Casca.[Fundo Casca]Cadastrar Fundo Casca
    Cadastrar-Classe.[Classe]Cadastrar Classe
    Cadastrar-SubClasse.[SubClasse]Cadastrar SubClasse
    Criar fundo casca valido completo com subclasse Multimercado V13
    Enviar para analise anbima v13
    Get Register Number
    Alterar o acesso para autorregulador
    Clicar na opção fundos V13    Solicitações
    Filtrar fundo por numero da solicitacao no perfil autorregulador
    Acessar solicitacao
    Acessar analise de cadastro
    Aprovar registro
    #Validar aprovacao do registro    FIF
    Alterar acesso para administrador
    Clicar na opção fundos V13    Registrados
    Filtrar por CNPJ registrados    Ativo
    Alterar status para encerramento
    Alterar o acesso para autorregulador
    Clicar na opção fundos V13
    Filtrar por CNPJ    Aguardando análise anbima
    Acessar solicitacao encerramento
    Acessar analise de encerramento
    Aprovar encerramento
    Validar aprovacao do encerramento    Evidencia_Sucesso_Aprovacao_Encerramento