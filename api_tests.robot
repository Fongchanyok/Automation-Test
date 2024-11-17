*** Settings ***
Library           RequestsLibrary

*** Variables ***
${BASE_URL}       https://fakestoreapi.com

*** Test Cases ***
Verify GET Products API Returns 200
    [Tags]    Smoke
    Create Session    https://api_session    ${BASE_URL}
    ${response}=    GET    https://api_session    /products
    Should Be Equal As Strings    ${response.status_code}    200
    Log    Response content: ${response.text}

Verify POST Products API Creates New Product
    [Tags]    Regression
    Create Session    https://api_session    ${BASE_URL}
    ${body}=    Create Dictionary    title=Test Product    price=29.99    description=A sample product    category=electronics    image=https://example.com/product.jpg
    ${response}=    POST    https://api_session    /products    json=${body}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    Response content: ${response.text}
    Should Contain    ${response.text}    Test Product

Verify DELETE Product API Deletes Product
    [Tags]    Regression
    Create Session    https://api_session    ${BASE_URL}
    ${response}=    DELETE    https://api_session    /products/1
    Should Be Equal As Strings    ${response.status_code}    200
    Log    Response content: ${response.text}

Verify GET Product with Invalid ID Returns 404
    [Tags]    Negative
    Create Session    https://api_session    ${BASE_URL}
    ${response}=    GET    https://api_session    /products/9999
    Should Be Equal As Strings    ${response.status_code}    404
    Log    Response content: ${response.text}
