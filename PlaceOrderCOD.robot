*** Settings ***
Library  Selenium2Library
Library  ExcelLibrary
Variables  Data.py
Variables  Locators.py
Resource  Register.robot
Resource  RandomGenarationData.robot
Test Setup  User opens website  ${Url}


*** Variables ***

*** Test cases ***
PlaceOrderCOD
    Go to LogIn Page
    LogIn Account
    Go To prduct page and Add to cart

    
*** Keywords ***
LogIn
    Open Browser  https://uat-jp-lan-ngl.dw-sites-apac.com/on/demandware.store/Sites-lancome-jp-ng-Site/ja_JP/Account-Login  ${Browser}
    Maximize Browser Window
    Wait Until Page Contains    ご登録はこちら  10s
    Input Text    xpath=${emaillogin_locator}    ${email_valid}
    Input Text    xpath=${passwordlogin_locator}    ${password}
    Click Element    xpath=${submitregister_locator}
    Wait Until Page Contains    ご登録情報  10s

Go to LogIn Page
    Click Element  xpath=${LogIn_button}
    Wait Until Page Contains    ご登録はこちら

LogIn Account
    Input Text    xpath=${emaillogin_locator}    ${email_valid}
    Input Text    xpath=${passwordlogin_locator}    ${password}
    Click Element    xpath=${submitlogin_locator}
    Wait Until Page Contains    ご登録情報  10s

Go To prduct page and Add to cart
    [Arguments] ${product}
    Go To    ${url_normal_item}
    Wait Until Element Is Visible    xpath=${productname_locator}
    Register.Scroll To Element    xpath=${addproduct_locator}
    Click Element    xpath=${addproduct_locator}
    Wait Until Element Is Visible    xpath=${gotocartbutton_locator}
    Click Element    xpath=${gotocartbutton_locator}