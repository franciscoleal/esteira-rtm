*** Settings ***
Documentation      Essa automação valida que não seja permitido o registro com papel de "Informante"

Resource           ../../../Keywords/Keywords.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de fundos][Test24]Validar que não seja permitido o registro com papel de "Informante"
    [Tags]    teste24
    Acessar o HUB    daniele.negoro@vericode.com.br
    Selecionar acesso    Informante
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos Autoregulador/Informante
    #Clicar em registro de fundos
    #Preencher os dados cadastrais sem permissao
	Alterar acesso principal ADMINISTRADOR
    