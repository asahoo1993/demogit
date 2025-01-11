*** Settings ***
Documentation    Validate login form
Library    SeleniumLibrary
Library    DataDriver    file=resources/data.csv    encoding=utf_8    dialect=unix
Test Teardown    Close Browser    #close browser is selenium library for closing the browser
Test Template    Validate Unsuccessful login

*** Variables ***
${error_msg_login}    css:.alert-danger

*** Test Cases ***
Login with user ${username} and password ${password}    xyz    769564

*** Keywords ***

Validate Unsuccessful login
    [Arguments]    ${username}    ${password}
    open the browser with url
    fill the login form    ${username}    ${password}
    wait until its check and display error message
    verify error message is correct

open the browser with url
    #Create Webdriver    Chrome    executable_path=chromedriver
    #C:/Users/sonal/AppData/Local/Programs/Python/chromedriver-win64/
    Open Browser    https://rahulshettyacademy.com/loginpagePractise/    chrome

fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    css:#username    ${username}
    Input Password    id:password    ${password}
    Click Button    id:signInBtn

wait until its check and display error message
    Wait Until Element Is Visible    ${error_msg_login}

verify error message is correct
    #"Incorrect username/password."
    ${error_msg}=        Get Text    ${error_msg_login}
    Should Be Equal As Strings    ${error_msg}    Incorrect username/password.
    #Element Text Should Be    ${error_msg_login}    Incorrect username/password.


