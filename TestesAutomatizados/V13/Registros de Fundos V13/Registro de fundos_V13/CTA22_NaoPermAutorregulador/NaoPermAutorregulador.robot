*** Settings ***
Documentation      Essa automação valida que não seja permitido o registro com papel de "Autorregulador(Anbima)"

Resource    ../../../../Keywords/Keywords.robot
Resource    ../../../../../main.robot

Test Setup         Abrir o navegador
Test Teardown      Fechar o navegador

*** Test Cases ***

[Registro de fundos][Test22]Validar que não seja permitido o registro com papel de "Autorregulador(Anbima)"
    [Tags]    teste22
    Acessar o HUB    ${EMAIL}
    Alterar o acesso para autorregulador
    #Selecionar acesso    Autorregulador
    Clicar na opção fundos    Solicitações
    Clicar em registro de fundos Autoregulador/Informante
    #Clicar em registro de fundos
    #Preencher os dados cadastrais sem permissao
	Alterar acesso para Administrador
    

