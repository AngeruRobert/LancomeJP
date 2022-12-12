*** Settings ***
Library  Selenium2Library
Library  ExcelLibrary
Variables  Data.py
Variables  Locators.py

*** Variables ***




*** Keywords ***
LogOut
    Mouse Over    xpath=${usernameheader_locator}
    Sleep  2s
    Wait Until Element Is Visible    xpath=${usernameheaderlist_locator}
    Click Element    xpath=${logoutbutton_locator}

Scroll To Element
    [Arguments]  ${locator}
    ${x}=        Get Horizontal Position  ${locator}
    ${y}=        Get Vertical Position    ${locator}
    Execute Javascript  window.scrollTo(${x}, ${y})
