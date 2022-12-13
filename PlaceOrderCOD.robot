*** Settings ***
Library  Selenium2Library
Library  ExcelLibrary
Library    XML
Variables  Data.py
Variables  Locators.py
#Resource  Register.robot
Resource  RandomGenarationData.robot
Test Setup  User opens website  ${Url}


*** Variables ***

*** Test cases ***
PlaceOrderCOD
    Go to LogIn Page
    LogIn Account
    Go product page and Add to cart  ${normal_item_EAN}
    Proceed To Checkout
    Save Data in Excel
    
*** Keywords ***
User opens website
    [Arguments]  ${url}
    Open Browser  ${url}  ${Browser}
    Maximize Browser Window
Scroll To Element
    [Arguments]  ${locator}
    ${x}=        Get Horizontal Position  ${locator}
    ${y}=        Get Vertical Position    ${locator}
    Execute Javascript  window.scrollTo(${x}, ${y})
Go to LogIn Page
    Click Element  xpath=${LogIn_button}
    Wait Until Page Contains    ご登録はこちら  20s

LogIn Account
    Input Text    xpath=${emaillogin_locator}    ${predefinedemail}
    Input Text    xpath=${passwordlogin_locator}    ${password}
    Click Element    xpath=${submitlogin_locator}
    Wait Until Page Contains    ご登録情報  60s

Go product page and Add to cart
    [Arguments]  ${product}
    Click Element  ${search_locator}
    Input Text  ${searchtext_locator}  ${product}
    Press Keys  ${searchtext_locator}  ENTER
    Wait Until Element Is Visible    ${itemname_locator}
    Scroll To Element    xpath=${addproduct_locator}
    Sleep  2s
    Click Element    xpath=${addproduct_locator}
    Wait Until Element Is Visible    xpath=${gotocartbutton_locator}  20s
    Click Element    xpath=${gotocartbutton_locator}
    Wait Until Page Contains    カートの内容

Proceed To Checkout
      Sleep  1s
      Click Element    ${proceedcheckout_locator}
      Wait Until Page Contains    連絡先情報の入力  20s
      Sleep  3s
      Run Keyword And Warn On Failure  Scroll To Element    ${zipcode_locator}
      Run Keyword And Warn On Failure  Input Text    ${zipcode_locator}    ${zipcode}
      Run Keyword And Warn On Failure  Scroll To Element    ${prefectures_locator}
      Run Keyword And Warn On Failure  Select From List By Index    ${prefectures_locator}  ${prefectures}
      Run Keyword And Warn On Failure  Input Text    ${address_locator}    ${address}
      Run Keyword And Warn On Failure  Input Text    ${numberaddress_locator}    ${numberaddress}
      Run Keyword And Warn On Failure  Click Element    ${submitbuttonsteps_locator}
      Sleep  4s
      Run Keyword And Warn On Failure  Wait Until Page Contains    通常配送  20s
      Run Keyword And Warn On Failure  Click Element    ${submitbuttonsteps_locator}
      Sleep  4s
      Run Keyword And Warn On Failure  Wait Until Page Contains    ご本人がお  20s
      Run Keyword And Warn On Failure  Click Element    ${COD_locator}
      Run Keyword And Warn On Failure  Click Element    ${submitbuttonsteps_locator}
      Sleep  5s
      Wait Until Page Contains    カート内容  20s
      Run Keyword And Warn On Failure  Scroll To Element    ${termscheckout_locator}
      Run Keyword And Warn On Failure  Click Element    ${termscheckout_locator}
      Run Keyword And Warn On Failure  Wait Until Element Is Enabled    ${submitbuttonsteps_locator}     20s
      Sleep  3s
      Run Keyword And Warn On Failure  Click Element    ${submitbuttonsteps_locator}
      Run Keyword And Warn On Failure  Wait Until Page Contains    ご注文の概要  20s
      ${OrderID}=  Get Text  xpath=${orderid_locator}
      Log To Console    ${OrderID}
      Set Global Variable    ${OrderIDvalue}  ${OrderID}

Save Data in Excel
    Open Excel Document    Orders.xlsx    Orders
    ${row}=  Read Excel Cell  1  3
    Write Excel Cell    ${row}    2    COD    Sheet
    Write Excel Cell    ${row}    1    ${OrderIDvalue}   Sheet
    ${row}=  Evaluate    ${row}+1
    Write Excel Cell    1    3    ${row}
    Save Excel Document    Orders.xlsx




