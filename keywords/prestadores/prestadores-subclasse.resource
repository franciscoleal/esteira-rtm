*** Settings ***
Resource    ../../main.robot

*** Keywords ***
[SubClasse]Preencher Prestadores da SubClasse
    SeleniumLibrary.Press Keys    None    HOME
    SeleniumLibrary.Wait Until Element Is Visible    //span[contains(.,'Cadastrar prestadores')]    45s    
    Commons.Visivel    //span[contains(.,'Cadastrar prestadores')]
    Commons.Combo    //div[contains(@aria-labelledby,'tipoPrestador')]    //li[contains(.,'Distribuidor')]
    Sleep    4s
    Commons.Wait And Input    //input[contains(@name,'cnpjCpf')]    60701190000104 
    SeleniumLibrary.Press Keys    none    RETURN
    Sleep    3s
    Commons.Visivel    //td[contains(.,'Distribuidor')]
    Sleep    5s
    Commons.Combo    //div[contains(@aria-labelledby,'tipoPrestador')]    //li[contains(@data-value,'INFORMANTE_VALORES_DIARIOS')]
    Sleep    4s
    Commons.Wait And Input    //input[contains(@name,'cnpjCpf')]    60701190000104      
    SeleniumLibrary.Press Keys    none    RETURN
    Commons.Visivel    //p[contains(.,'Informante de valores diários')]
    SeleniumLibrary.Press Keys    None    END
    Sleep    3s
    Commons.Wait And Click    //button[contains(.,'Concluir subclasse')]
    