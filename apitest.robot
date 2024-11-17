*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://fakestoreapi.com


*** Test Cases ***

Tc_Get
    #GET
    Open Browser    ${BASE_URL}/products     chrome 
    close Browser   

Tc_02
    #GET with parameter
    Open Browser    https://fakestoreapi.com/products?sort=asc    chrome 
    close Browser  
    Open Browser    https://fakestoreapi.com/products?sort=desc    chrome 
    close Browser  


Tc_POST
    Create Session    fake_api    ${BASE_URL}
    ${data}=          Create Dictionary    title=yok fongchan   price=99.99    description=This is a test product   image=https://i.pravatar.cc     category=electronic
    ${response}=      POST ON Session    fake_api    /products    json=${data}
    Log               ${response.status_code}
    Log               ${response.json()}
    Should Be Equal As Numbers    ${response.status_code}    200


Tc_PUT
    Create Session    fake_api    ${BASE_URL}
    ${data}=          Create Dictionary    title=Updated Product    price=109.99
    ${response}=      Put ON Session    fake_api    /products/1    json=${data}
    Log               ${response.status_code}
    Log               ${response.json()}
    Should Be Equal As Numbers    ${response.status_code}    200


Tc_DELETE
    Create Session    fake_api    ${BASE_URL}
    ${response}=      Delete ON Session    fake_api    /products/1
    Log               ${response.status_code}
    Log               ${response.json()}
    Should Be Equal As Numbers    ${response.status_code}    200

    
Tc_GET_CATEGORIES 
    Create Session    fake_api    ${BASE_URL}
    ${response}=      GET ON Session    fake_api    /products/categories
    Log               ${response.status_code}
    Log               ${response.json()}
    Should Be Equal As Numbers    ${response.status_code}    200




    
    