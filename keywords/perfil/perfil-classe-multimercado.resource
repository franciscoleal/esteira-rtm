*** Settings ***
Resource    ../../main.robot

*** Variables ***


*** Keywords ***
Preencher Perfil Classe Multimercado
    Commons.Combo    //div[contains(@aria-labelledby,'composicaoFundo')]    //li[contains(.,'CI')]       #opções disponíveis (CI /CIC / CICPC/ CIPC)
    Commons.Combo    //div[contains(@aria-labelledby,'tributacaoPerseguida')]    //li[contains(.,'Longo Prazo')]     #opções disponíveis (Longo Prazo /Curto Prazo / Alícota de 15%/ Não Aplicável/ Outros/ Insento)
    Commons.Combo    //div[contains(@aria-labelledby,'fundoAlavancado')]    //li[contains(.,'Não')]
    Commons.Combo    //div[contains(@aria-labelledby,'derivativos')]    //li[contains(.,'Permitido')]
    Commons.Combo    //div[contains(@aria-labelledby,'possuiBenchmark')]    //li[contains(.,'Sim')]
    Commons.Wait And Click    //div[contains(@aria-labelledby,'benchmark')]            #opções disponíveis (CDI /CDI 30X30 / DÓLAR COMERCIAL/ DÓLAR PTAX/ EURO)
    SeleniumLibrary.Scroll Element Into View    //p[contains(.,'EURO')]
    SeleniumLibrary.Click Element    //p[contains(.,'EURO')]
    SeleniumLibrary.Press Keys    None    TAB
    Commons.Combo    //div[contains(@aria-labelledby,'creditoPrivado')]    //li[contains(.,'Sim')]
    Commons.Wait And Input    //input[contains(@name,'percentualCreditoPrivado')]    60  
    Commons.Combo    //div[contains(@aria-labelledby,'investimentosExterior')]    //li[contains(.,'Até 40%')]     
    Commons.Wait And Input    //input[contains(@name,'percentualAutorizadoInvestimentoExterior')]    40   # opções disponíveis (Não se aplica / Até 20% / Até 40%)
    Commons.Combo    //div[contains(@aria-labelledby,'indicadorLimitesPorEmissorAtivo')]    //li[contains(.,'Não se aplica')]  
    Commons.Combo    //div[contains(@aria-labelledby,'fundoEsg')]    //li[contains(.,'Não')]
    Sleep    1s
    Commons.Combo    //div[contains(@aria-labelledby,'formaCondominio')]    //li[contains(.,'Aberto')]
    Commons.Combo    //div[contains(@aria-labelledby,'criptoativosMaiorRiscoDaCarteira')]    //li[contains(.,'Não')]
    Commons.Combo    //div[contains(@aria-labelledby,'prazoDuracao')]    //li[contains(.,'Indeterminado')]
    Commons.Combo    //div[contains(@aria-labelledby,'responsabilidadeLimitada')]    //li[contains(.,'Não')]
    Commons.Combo    //div[@aria-labelledby='fundosIsentosComeCotas']    //li[contains(.,'Sim')]
