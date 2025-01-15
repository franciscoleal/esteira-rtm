*** Settings ***
Resource            ../../main.robot

Test Setup          Navegador-config.Abrir o navegador
Test Teardown       Navegador-config.Fechar o navegador

*** Test Cases ***
[Informes Periódicos] Validar envio Justificativa de Inconsistências - Via Tela - CERT
    [Documentation]     Para validar a justificativa pegue uma classe/subclasse - NA COLUNA SUBCLASSE filtre por:
    ...    instituição, fechamento, hub, diário
    Login.Acessar o HUB    ${EMAIL}    ENV=${LINK_HUB_CERT}
    Profile.Alterar o perfil    Perfil=Administrador    Instituicao=ITAU    menu=1
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro PLCota inicial para limites
    ...    DIA=02    MES=09    ANO=2024        
    ...    COD_SCLASSE=C0000230146    
    ...    COTA=1
    ...    PATRIMONIO=1
    ...    COTISTA=1
    Validar-Processamento.Validar processamento do informe de rentabilidade    Possiveis Inconsistencias
    Enviar-Justificativa.Enviar a Justificativa de Inconsistencia    
    ...    MENSAGEM=Justificativa de informe de fundo rejeitado    
    ...    JUSTIFICATIVA=0001 - Marcação à mercado / Precificaçao
    Profile.Alterar o perfil    Perfil=Autorregulador    Instituicao=ANBIMA    menu=1
    Commons.Filtrar informe por numero de justificativa
    Profile.Alterar o perfil    Perfil=Administrador    Instituicao=ITAU    menu=1
    Commons.Acessar o PLCota
    Commons.Filtrar informe por numero envio de arquivo
    Commons.Acessar informe

[Informes Periódicos] Validar envio Justificativa de Inconsistências - Via Tela - UAT
    [Documentation]     Para validar a justificativa pegue uma classe/subclasse - NA COLUNA SUBCLASSE filtre por:
    ...    instituição, fechamento, hub, diário
    Login.Acessar o HUB    ${EMAIL}    ENV=${LINK_HUB_UAT}
    Profile.Alterar o perfil    Perfil=Administrador    Instituicao=ITAU    menu=1
    Commons.Acessar o PLCota
    Commons.Iniciar cadastro manual
    Preencher-Cadastro.Preencher cadastro PLCota inicial para limites
    ...    DIA=02    MES=09    ANO=2024        
    ...    COD_SCLASSE=C0000470317    
    ...    COTA=20,04791200000000000
    ...    PATRIMONIO=1964185919,22000
    ...    COTISTA=1
    Validar-Processamento.Validar processamento do informe de rentabilidade    Possiveis Inconsistencias
    Enviar-Justificativa.Enviar a Justificativa de Inconsistencia    
    ...    MENSAGEM=Justificativa de informe de fundo rejeitado
    ...    JUSTIFICATIVA=0002 - TESTE
    Profile.Alterar o perfil    Perfil=Autorregulador    Instituicao=ANBIMA    menu=1
    Commons.Filtrar informe por numero de justificativa
    Profile.Alterar o perfil    Perfil=Administrador    Instituicao=ITAU    menu=1
    Commons.Acessar o PLCota
    Commons.Filtrar informe por numero envio de arquivo
    Commons.Acessar informe
