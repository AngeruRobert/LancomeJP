*** Settings ***
Library  Selenium2Library
Library  ExcelLibrary
Variables  Data.py
Variables  Locators.py
Resource  Register.robot


*** Variables ***




*** Test Cases ***
Test Random
    Open Browser  ${url}  ${Browser}
    Maximize Browser Window
    ${OrderID}=  Get Text  xpath=//h2[@class='c-section__title h-text-align-center']
    Log To Console    ${OrderID}


#    Write Excel Cell    ${row}    1    asd    Sheet
#    Save Excel Document    TestAccounts.xlsx
