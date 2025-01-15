*** Settings ***

Resource    ../../main.robot

*** Keywords ***
Upload de informe diario
    Commons.Wait And Click    //p[contains(.,'Upload de documento')]
    Commons.Combo    //div[contains(@aria-labelledby,'tipoDeEnvio')]    //li[contains(.,'Exceção')]         
    Commons.Combo    //div[@aria-labelledby='motivoDaExcecao']    //li[contains(.,'Prazo excedido - reprocessamento')]
    SeleniumLibrary.Input Text    //textarea[@name='descricaoDaJustificativa']    text=Informe enviado com data de competência maior que 180 dias
    SeleniumLibrary.Choose File    locator=//input[@name='fileInforme']    file_path=${EXECDIR}${/}py-robot-cvm175-rtm${/}resources${/}data${/}INFORME_DIARIO_PROD_EXCECAO.json
    Commons.Visivel    (//div[contains(.,'INFORME_DIARIO_PROD_EXCECAO.json')])[8]
    Commons.Wait And Click    //button[contains(.,'Enviar')]

Upload de Informes Repetidos - Diário
    [Arguments]    ${FILE}    ${NAME-FILE}                                    #${CLASS-OR-SUBCLASS}
    Commons.Wait And Click    //p[contains(.,'Upload de documento')]
    IF    "${FILE}"=="Valido"
        # Commons.Combo    //div[contains(@aria-labelledby,'tipoDeEnvio')]    //li[contains(.,'Padrão')]
        # ${path_informes_repetidos}   Normalize Path    path=${CURDIR}${/}templates${/}template-informes-repetidos.json
        # ${dados}    Format String    ${path_informes_repetidos}
        # ...            codigo_classe_subclasse=${CLASS-OR-SUBCLASS}
        SeleniumLibrary.Choose File    locator=//input[contains(@type,'file')]    file_path=${CURDIR}${/}templates${/}${NAME-FILE}
        Commons.Visivel    (//div[contains(.,'${NAME-FILE}')])[8]
        Commons.Wait And Click    //button[contains(.,'Enviar')]
        Set Global Variable    ${NAME-FILE}
    ELSE IF    "${FILE}"=="Invalido"          
        Commons.Combo    //div[contains(@aria-labelledby,'tipoDeEnvio')]    //li[contains(.,'Padrão')]
        SeleniumLibrary.Choose File    locator=//input[contains(@type,'file')]    file_path=${CURDIR}${/}templates${/}${NAME-FILE}
        Commons.Wait And Click    //button[contains(.,'Enviar')]        
        Commons.Visivel    //p[contains(.,'Arquivo inválido')]
        Log    "O arquivo inserido é de um formato inválido, e foi exibida a mensagem de "Arquivo inválido""
    END