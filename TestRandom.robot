*** Settings ***
Library  Selenium2Library
Library  ExcelLibrary
Variables  Data.py
Variables  Locators.py
Resource  Register.robot


*** Variables ***




*** Test Cases ***
Test Random
    Open Excel Document    TestAccounts.xlsx    Accounts
    Write Excel Cell    1    2    24    Sheet
    ${row}=  Read Excel Cell  1  7  Sheet
    Log To Console    Trararararararara
    Log To Console    ${row}
    ${row}=  Evaluate    ${row}+1
    Log To Console    ${row}
#    Write Excel Cell    ${row}    1    asd    Sheet
#    Save Excel Document    TestAccounts.xlsx
