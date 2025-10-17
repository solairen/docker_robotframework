*** Settings ***
Library     SeleniumLibrary
Test Setup  Chromium Headless

*** Test Cases ***
Go to google
    Navigate To Google

*** Keywords ***
Chromium Headless
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Evaluate    setattr($chrome_options, 'binary_location', '/usr/bin/chromium')
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(executable_path='/usr/bin/chromedriver')    sys, selenium.webdriver.chrome.service
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}

Navigate To Google
    Go To    https://google.com
