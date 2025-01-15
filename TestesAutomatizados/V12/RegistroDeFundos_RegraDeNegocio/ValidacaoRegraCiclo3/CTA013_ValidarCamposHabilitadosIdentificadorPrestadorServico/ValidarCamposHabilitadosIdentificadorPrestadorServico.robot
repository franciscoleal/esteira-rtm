*** Settings ***
Documentation      Essa automação valida campos habilitados relacionados ao campo retornado pela Anbima com inconsistência - Identificador do prestador de serviço

Resource           ../../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***
[Test013]Validar campos habilitados relacionados ao campo retornado pela Anbima com inconsistência - Identificador do prestador de serviço
#Ajustar cenário com bug
    Acessar o HUB    vimerson.miura@vericode.com.br
    Selecionar acesso para Administrador    ITAU
    Criar fundo casca valido completo com subclasse
    Enviar para analise anbima
    Get Register Number
    Alterar o acesso para autorregulador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao no perfil autorregulador
    Acessar solicitacao
    Acessar analise de cadastro
    Indicar inconsistencia no campo prestador de servico casca
    Indicar inconsistencia no campo prestador de servico classe
    Indicar inconsistencia no campo prestador de servico subclasse
    Alterar acesso para administrador
    Clicar na opção fundos
    Filtrar fundo por numero da solicitacao
    Acessar solicitacao
    Validar inconsistencias no prestador de servico classe    Evidencia_Inconsistencia_Prestador_Servico_Classe
    Validar inconsistencias no prestador de servico subclasse    Evidencia_Inconsistencia_Prestador_Servico_Subclasse
    Enviar ajustes inconsistencia para Anbima
    Clicar na opção fundos
    Filtrar por CNPJ    Aguardando análise anbima
    Validar filtro por status    Aguardando análise anbima