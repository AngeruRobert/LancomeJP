*** Settings ***
Library  Selenium2Library
Library  ExcelLibrary
Variables  Data.py
Variables  Locators.py
Resource  Register.robot


*** Variables ***




*** Test Cases ***
Test Random
    Create Excel Document      Orders
    Save Excel Document    Orders.xlsx
#    Write Excel Cell    ${row}    1    asd    Sheet
#    Save Excel Document    TestAccounts.xlsx
