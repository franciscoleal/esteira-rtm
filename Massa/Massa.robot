*** Settings ***

#Setando as libraries
Library    SeleniumLibrary
Library    Process
Library    Dialogs
Library    ScreenCapLibrary
Library    OperatingSystem
Library    DateTime
Library    Collections
# Library    ExcelLibrary
Library    String
Library    FakerLibrary    locale=pt_BR


*** Variables ***    #Variáveis globais

#${LINK_HUB}    https://hubanbima-qa.rtm.net.br/    #Link para acessar o HUB QA
${LINK_HUB}    https://hubanbima-cert.rtm.net.br/    #Link para acessar o HUB CERT
${LINK_HUB_V13}    https://hubanbima-uat.rtm.net.br/    #Link para acessar o HUB UAT
# ${LINK_HUB_V13}    https://hubanbima-qa-v13.rtm.net.br/    #Link para acessar o HUB V13
#${LINK_HUB_V13}    https://hubanbima-uat-v13.rtm.net.br/    #Link para acessar o HUB V13
${LINK_HUB_DEV}    https://hubanbima-dev.rtm.net.br/    #Link para acessar o HUB DEV
${LINK_HUB_MERC}    https://hubanbima-cert-mercado.rtm.net.br/