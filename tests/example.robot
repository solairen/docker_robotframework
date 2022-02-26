*** Settings ***
Library     SeleniumLibrary
Test Setup  Chrome Headless

*** Test Cases ***
Go to google
    Navigate To Google

*** Keywords ***
Chrome Headless
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome_options}

Navigate To Google
    Go To    https://google.com
