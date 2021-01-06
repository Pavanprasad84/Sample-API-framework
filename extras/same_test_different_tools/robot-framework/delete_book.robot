*** Settings ***
Library	Collections
Library	RequestsLibrary


*** Variables ***
${user}=    bob


*** Test Cases ***
Delete book
    Create Session              ApiApp                  http://localhost:8000

    ${resp}=                    GET On Session          ApiApp                        /books
    Should Be Equal As Strings  ${resp.status_code}     200
    Set Test Variable           ${book_id}              ${resp.json()[0]['id']}


    ${resp}=                    POST On Session         ApiApp                        /token/${user}       data=None
    Set Test Variable           ${token}                ${resp.json()['token']}
    Should Be Equal As Strings  ${resp.status_code}     201

    ${headers}=                 Create Dictionary       user=${user}  token=${token}
    ${resp}=                    DELETE On Session       ApiApp                          /books/${book_id}  headers=${headers}
    Should Be Equal As Strings  ${resp.status_code}     200

    ${resp}=                    GET On Session          ApiApp                          /books/${book_id}  expected_status=404
    Should Be Equal As Strings  ${resp.status_code}     404