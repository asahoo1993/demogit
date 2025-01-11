*** Settings ***
Documentation    Validate login form
Library    SeleniumLibrary
Library    String
Library    Collections
Test Setup    open the browser with url
Test Teardown    Close Browser    #close browser is selenium library for closing the browser

*** Variables ***
${email}
*** Test Cases ***
Validate child window functionality
    select the link of child window
    verify the user is switched to child window
    grab the email id in the child window
    switch to parent window and enter the email
    

*** Keywords ***
open the browser with url
    Open Browser    https://rahulshettyacademy.com/loginpagePractise/    chrome

select the link of child window
    Click Element    css:.blinkingText
    Sleep    5

verify the user is switched to child window
    Switch Window    NEW
    Element Text Should Be    css:h1    DOCUMENTS REQUEST

grab the email id in the child window
    ${text}=    Get Text    css:.red
    @{words}=    Split String    ${text}    at
    ${test_split}=    Get From List    ${words}    1
    @{words_2}=    Split String    ${test_split}
    ${email}=    Get From List    ${words_2}    0
    Log    ${email}
    Set Global Variable    ${email}


switch to parent window and enter the email
    Switch Window    MAIN
    Input Text    css:#username    ${email}








    
    





