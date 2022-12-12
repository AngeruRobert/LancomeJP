*** Settings ***
Library  Selenium2Library
Library  ExcelLibrary
Variables  Data.py
Variables  Locators.py
Test Setup  User opens website  ${Url}
Resource  RandomGenarationData.robot
Resource  LogOut.robot


*** Variables ***
${lucid}

*** Test Cases ***
Register Account
    Go to Register Page
    Fill Form
    LogOut
    LogIn
    Save Data in Excel


*** Keywords ***
User opens website
    [Arguments]  ${url}
    Open Browser  ${url}  ${Browser}
    Maximize Browser Window
Go to Register Page
    Click Element  xpath=${LogIn_button}
    Wait Until Page Contains    ご登録はこちら
    Click Element    xpath=${Register_button}
    Wait Until Page Contains    アカウント作成

Scroll To Element
    [Arguments]  ${locator}
    ${x}=        Get Horizontal Position  ${locator}
    ${y}=        Get Vertical Position    ${locator}
    Execute Javascript  window.scrollTo(${x}, ${y})

Fill Form
    Sleep  2s
    Scroll To Element    xpath=${lastname_locator}
    Input Text    xpath=${lastname_locator}    ${lastname}
    Input Text    xpath=${firstname_locator}    ${firstname}
    Input Text    xpath=${lastnamekana_locator}    ${lastnamekana}
    Input Text    xpath=${firstnamekana_locator}    ${firstnamekana}
    Generate Random PhoneNumber
    Input Text    xpath=${phonenumber_locator}    ${phone_number}
    Select From List By Value    xpath=${year_locator}  ${year}
    Select From List By Value    xpath=${month_locator}  ${month}
    Select From List By Value    xpath=${day_locator}  ${day}
#    Click Element    ${male_locator}
    Generate Random Email
    Input Text    xpath=${email_locator}    ${email_valid}
    Input Text    xpath=${comfirmationemail_locator}    ${email_valid}
    Input Text    xpath=${password_locator}    ${password}
    Input Text    xpath=${comfirmationpassword_locator}    ${password}
    Scroll To Element    xpath=${privacy_locator}
    Sleep  1s
    Wait Until Element Is Visible    xpath=${privacy_locator}
    Sleep  1s
    Click Element    xpath=${privacy_locator}
    Click Element    xpath=${submitregister_locator}
    Wait Until Page Contains    ご登録情報  20s
#    Scroll To Element    xpath=//h1[contains(text(),'ご登録情報')]

LogIn
    Sleep  5s
    Input Text    xpath=${emaillogin_locator}    ${email_valid}
    Input Text    xpath=${passwordlogin_locator}    ${password}
    Click Element    xpath=${submitlogin_locator}
    Wait Until Page Contains    ご登録情報  10s
    Scroll To Element    xpath=${membership_locator}
    Sleep  2s
    Click Element    xpath=${membership_locator}
    Sleep  3s
    Page Should Contain Element   xpath=${membershipvalidation_locator}  20s
    Sleep  1s
    Scroll To Element    xpath=${qrcode_locator}
    ${lucid}=  Get Element Attribute  xpath=${qrcode_locator}  title
    Log To Console    ${lucid}
    Set Global Variable    ${lucidvalue}  ${lucid}
Save Data in Excel
    Open Excel Document    TestAccounts.xlsx    Accounts
    ${row}=  Read Excel Cell  1  7
    Write Excel Cell    ${row}    1    ${email_valid}    Sheet
    Write Excel Cell    ${row}    2    ${password}    Sheet
    Write Excel Cell    ${row}    3    ${firstnamekana}    Sheet
    Write Excel Cell    ${row}    4    ${lastnamekana}    Sheet
    Write Excel Cell    ${row}    5    ${phone_number}    Sheet
    Log To Console    ${lucidvalue}
    Write Excel Cell    ${row}    6    ${lucidvalue}   Sheet
    ${row}=  Evaluate    ${row}+1
    Write Excel Cell    1    7    ${row}
    Save Excel Document    TestAccounts.xlsx