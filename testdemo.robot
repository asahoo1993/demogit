*** Settings ***
Documentation    Validate login form
Library    SeleniumLibrary
Test Teardown    Close Browser    #close browser is selenium library for closing the browser

*** Variables ***
${error_msg_login}    css:.alert-danger


*** Test Cases ***
Validate Unsuccessful login
    open the browser with url
    fill the login form
    wait until its check and display error message
    verify error message is correct

*** Keywords ***
open the browser with url
    #Create Webdriver    Chrome    executable_path=chromedriver
    #C:/Users/sonal/AppData/Local/Programs/Python/chromedriver-win64/
    Open Browser    https://rahulshettyacademy.com/loginpagePractise/    chrome

fill the login form
    Input Text    css:#username    rahulshettyacademy
    Input Password    id:password    11111
    Click Button    id:signInBtn

wait until its check and display error message
    Wait Until Element Is Visible    ${error_msg_login}

verify error message is correct
    #"Incorrect username/password."
    ${error_msg}=        Get Text    ${error_msg_login}
    Should Be Equal As Strings    ${error_msg}    Incorrect username/password.
    #Element Text Should Be    ${error_msg_login}    Incorrect username/password.


