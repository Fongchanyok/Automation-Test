*** Settings ***
Library    SeleniumLibrary

# *** Variables ***
# ${url}    https://www.saucedemo.com/    
# ${browser}    chrome
# ${locator_email}    id=user-name
# ${locator_password}    id=password
# ${locator_login}    id=login-button


# *** Keywords ***
# Open Web Browser
#     Open Browser    ${url}    ${browser}
#     Maximize Browser Window

# Input Data
#     Input Text    ${locator_email}    standard_user
#     Input Text    ${locator_password}    secret_sauce
#     Click Element    ${locator_login}


*** Test Cases ***
Tc_01
    #GET
    Open Browser    https://fakestoreapi.com/products    chrome 
    close Browser   
Tc_02
    #GET with parameter
    Open Browser    https://fakestoreapi.com/products?sort=asc    chrome 
    close Browser  
    Open Browser    https://fakestoreapi.com/products?sort=desc    chrome 
    close Browser  


    



    
    