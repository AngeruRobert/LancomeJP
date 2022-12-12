*** Settings ***
Library  Selenium2Library
Variables  Data.py
Variables  Locators.py
Test Setup  User opens website  ${Url}
Test Teardown  Close All Browsers
*** Variables ***


*** Test Cases ***
Testcase1
#    User opens website  https://osf.digital/
    Log To Console    It’s works
    Click Element    xpath=//*[@class='c-user__text m-login']
    Wait Until Page Contains    ご登録はこちら  10s
    Input Text    xpath=//*[starts-with(@data-component-id,'i_')]/input    angeru.robert.alexandru@gmail.com
    Input Text    xpath=//*[starts-with(@id,'password-')]    Test1234
    Click Element    xpath=//form[@name='login']/div/button
    Wait Until Page Contains    ご登録情報  10s
#    Scroll To Element  xpath=//*[@class='c-button m-expand']
#    Sleep    1s
#    Click Element    xpath=//*[@class='c-button m-expand']
#    Wait Until Page Contains    ご登録情報を変更
#    Verify LastName    ${lastname}
#    Element Should Contain    xpath=//*[starts-with(@id,'firstname-')]    "おおおお"
#    Element Should Contain    xpath=//*[starts-with(@id,'lastnamekana-')]    "オオオオ"
#    Element Should Contain    xpath=//*[starts-with(@id,'firstnamekana-')]    "オオオオ"

*** Keywords ***
User opens website
    [Arguments]  ${url}
    Open Browser  ${url}  ${Browser}
    Maximize Browser Window
#    Close Cookies

#Close Cookies
#    Click Element    xpath=//*[@id='CybotCookiebotDialogBodyLevelButtonAccept']
#    Wait Until Element Is Not Visible    xpath//*[@name='CybotCookiebotDialog']

Scroll To Element
    [Arguments]  ${locator}
    ${x}=        Get Horizontal Position  ${locator}
    ${y}=        Get Vertical Position    ${locator}
    Execute Javascript  window.scrollTo(${x}, ${y})

Verify LastName
    [Arguments]  ${text}
    Scroll To Element  xpath=//*[starts-with(@id,'lastname-')]
    ${value}=  Get Element Attribute  //*[starts-with(@id,'lastname-')]  value
    Should Be Equal As Strings   ${value}  ${text}