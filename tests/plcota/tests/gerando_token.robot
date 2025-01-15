*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem

*** Variables ***
${BASEURL}=    https://fundos-api-auth.cer.anbima.com.br
${KEY}=    1qgh1v8bhh1jlmc29ng2d4kv3k
${SECRET}=    5le1cs9v3cdgf45altl3u5fgd8fbh2kphjfrfl52vjatgjjgfv8


*** Keywords ***

    
*** Test Cases ***
Get Auth Token

    Create Session  mysession  ${BASEURL}    verify=False
    ${data}=  Create Dictionary  
    ...  grant_type=client_credentials    client_id=${KEY}  client_secret=${SECRET}    
    ${headers}=  Create Dictionary    Content-Type=application/x-www-form-urlencoded              
    ${response}=  POST On Session   mysession   /oauth2/token    data=${data}    headers=${headers}        
    
    log to console  ${response.status_code}
    log to console  ${response.content}

    # ${status_code}=  convert to string  ${response.status_code}
    # should be equal  ${status_code}  200

    # ${res_body}=  convert to string  ${response.content}
    # should contain  ${res_body}  0

        #     POST /oauth2/token HTTP/1.1
        # Content-Type: application/x-www-form-urlencoded
        # Authorization: Basic MXFnaDF2OGJoaDFqbG1jMjluZzJkNGt2M2s6NWxlMWNzOXYzY2RnZjQ1YWx0bDN1NWZnZDhmYmgya3BoamZyZmw1MnZqYXRnampnZnY4
        # User-Agent: PostmanRuntime/7.43.0
        # Accept: */*
        # Cache-Control: no-cache
        # Postman-Token: 10a5cf34-2354-47a0-b3b6-12513a22b9a8
        # Host: fundos-api-auth.cer.anbima.com.br
        # Accept-Encoding: gzip, deflate, br
        # Connection: keep-alive
        # Content-Length: 29
        
        # grant_type=client_credentials