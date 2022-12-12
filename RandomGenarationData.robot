*** Settings ***
Library  FakerLibrary
Library  Selenium2Library



*** Keywords ***

Generate Random Email
    ${randomemail}=    Random Number    5
    Set Test Variable    ${email_valid}    angeru.robert.alexandru+${randomemail}@gmail.com

Generate Random PhoneNumber
    ${randomnumber}=    Random Number    9
    Set Test Variable    ${phone_number}  09${randomnumber}
