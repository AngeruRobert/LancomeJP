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
    [Arguments]  ${product}
    Click Element  ${search_locator}
    Input Text  ${searchtext_locator}  ${product}
    Press Keys  ${searchtext_locator}  ENTER
    Wait Until Element Is Visible    ${itemname_locator}
    Register.Scroll To Element    xpath=${addproduct_locator}
    Click Element    xpath=${addproduct_locator}
    Wait Until Element Is Visible    xpath=${gotocartbutton_locator}
    Click Element    xpath=${gotocartbutton_locator}
    Wait Until Page Contains    カートの内容

Proceed To Checkout
      Click Element    ${proceedcheckout_locator}
      Wait Until Page Contains    連絡先情報の入力
      Register.Scroll To Element    ${zipcode_locator} 
      Input Text    ${zipcode_locator}    ${zipcode}
      Select From List By Value    ${prefectures_locator}  ${prefectures}
      Input Text    ${address_locator}    ${address}
      Input Text    ${numberaddress_locator}    ${numberaddress}


