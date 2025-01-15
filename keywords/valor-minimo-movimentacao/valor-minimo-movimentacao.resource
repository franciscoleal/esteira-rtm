*** Settings ***
Resource    ../../main.robot

*** Keywords ***
[SubClasse]Preencher valor minimo e movimentacao    #não alterar caso mudança na regra (13/08/2024) - utilizado em RegistroDeFundoParaCadaTipo_V13
    [Arguments]    ${TIPO}
    Commons.Visivel    //span[contains(.,'Valores mínimos e movimentação')]

    IF    "${TIPO}" == "Offshore"
        Commons.Wait And Click    //button[contains(.,'Próximo')]
    ELSE
        SeleniumLibrary.Scroll Element Into View    //label[contains(@for,'indicadorPrazoEmissaoCotas')] 
        Commons.Combo      //div[contains(@aria-labelledby,'indicadorPrazoEmissaoCotas')]    //li[contains(.,'Dias corridos')]
        Commons.Wait And Input    //input[contains(@name,'prazoEmissaoCotas')]    7
        IF    "${TIPO}" == "FIF-Multimercado"   
            # Para rodar registro multiclasse, precisa habilitar.
            Commons.Combo    //div[contains(@aria-labelledby,'indicadorPrazoConversaoResgate')]    //li[contains(.,'Dias corridos')]     
            Commons.Wait And Input    //input[contains(@name,'prazoConversaoResgate')]    7
            Commons.Combo    //div[contains(@aria-labelledby,'indicadorPrazoPagamentoResgate')]    //li[contains(.,'Dias corridos')]
            Commons.Wait And Input    //input[contains(@name,'prazoPagamentoResgate')]    10
        END
        Commons.Combo    //div[contains(@aria-labelledby,'regraAdicionalPagamentoResgate')]    //li[contains(.,'Não')]
        ${RND_NUM}    Commons.Random Number    4
        Commons.Wait And Input    //input[contains(@name,'carenciaInicial')]    ${RND_NUM}
        ${RND_NUM}    Commons.Random Number    4
        Commons.Wait And Input    //input[contains(@name,'carenciaCiclica')]    ${RND_NUM}
        Commons.Combo    //div[contains(@aria-labelledby,'indicadorValoresMinimos')]    //li[contains(.,'Não se aplica')]
        Wait Until Keyword Succeeds    5X    5s    SeleniumLibrary.Scroll Element Into View    //button[contains(.,'Próximo')]
        Commons.Wait And Click    //button[contains(.,'Próximo')] 
    END  