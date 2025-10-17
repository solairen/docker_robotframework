### About:
* Base Image: Python 3.14.0-slim-trixie

This docker container contains:
* [Python](https://www.python.org/) 3.14.0
* [Selenium](https://www.selenium.dev/) 4.36.0
* [RobotFramework](https://robotframework.org/) 7.3.2
* [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/) 6.8.0
* [Chromium](https://www.chromium.org/) & ChromeDriver 131.0.6778.204
* [Requests](https://docs.python-requests.org/en/latest/) 2.32.5
* [Beautifulsoup4](https://www.crummy.com/software/BeautifulSoup/) 4.14.2
* [Flask](https://palletsprojects.com/p/flask/) 3.1.2

### How to build or download:
#### Build docker images from Dockerfile:
* docker build . -t {tagname}

#### Download from Docker repository:
* docker pull moleszek/robotframework:latest

### How to run:
#### To run robot framework script using robotframework Docker image directly:
* docker run -it --rm -v {localFolderPath}:/robot moleszek/robotframework:latest -m robot {robotTest}.robot

#### Add headless Chromium to keywords
Inside the **keywords** section add:
```robot
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
```

This **keyword** allows to run Chromium in headless mode.

See [example](tests/example.robot).
