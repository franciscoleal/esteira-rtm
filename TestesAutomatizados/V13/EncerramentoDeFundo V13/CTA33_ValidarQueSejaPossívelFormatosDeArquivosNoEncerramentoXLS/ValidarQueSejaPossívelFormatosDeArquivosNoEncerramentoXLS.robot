*** Settings ***
Documentation      Essa automação valida que seja possível as seguintes formatos de arquivos no encerramento (xls)

Resource           ../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Test33] Validar que seja possível as seguintes formatos de arquivos no encerramento (xls)
    Acessar o HUB    daniele.negoro@vericode.com.br
    Validar perfil    Administrador
    Criar fundo casca valido completo com subclasse Multimercado V13
    Enviar para analise anbima v13
    Get Register Number
    Alterar o perfil    Autorregulador    ANBIMA    1
    Clicar na opção fundos V13    Solicitações
    Filtrar fundo por numero da solicitacao no perfil autorregulador
    Acessar solicitacao
    Acessar analise de cadastro
    Aprovar registro
    Validar aprovacao do registro    FIF
    Alterar o perfil    Administrador    ITAU UNIBANCO SA    1
    Clicar na opção fundos V13    Registrados
    Filtrar por CNPJ registrados    Ativo
    Alterar status para encerramento xlsx
    Alterar o perfil    Autorregulador    ANBIMA    1
    Clicar na opção fundos V13
    Filtrar por CNPJ    Aguardando análise anbima
    Acessar solicitacao encerramento
    Acessar analise de encerramento
    Validar arquivo xlsx    Evidencia_Arquivo_XLS