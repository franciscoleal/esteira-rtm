*** Settings ***
Resource    ../../main.robot

*** Keywords ***
Cadastrar Classe adicional com SubClasse
    Commons.Wait And Click    //button[contains(.,'Adicionar classe')]
    Cadastrar-Classe.[Classe]Cadastrar Classe        
    Cadastrar-SubClasse.[SubClasse]Cadastrar SubClasse
    

Cadastrar Classe adicional sem SubClasse
    No Operation