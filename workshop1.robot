*** Settings ***
Library    SeleniumLibrary



***Variables***
${url}      https://www.saucedemo.com/
${browser}      chrome
${locator_email}        id=user-name
${locator_password}     id=password   
${locator_login}        id=login-button  
${Firstname}            id=first-name
${Lastname}             id=last-name
${Zip}                  id=postal-code


***Keywords***
Open Web
        Open Browser        ${url}      ${browser}
        SeleniumLibrary.Maximize Browser Window

Input Data
        Input Text 	 ${locator_email} 	 standard_user
        Input Text 	 ${locator_password} 	 secret_sauce




*** Test Cases ***
Tc_01
    Open Web
    
