*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
TC01-login pass1
    Set Selenium Speed 	 5s
    Open Browser        https://fakestoreapi.com/products
     