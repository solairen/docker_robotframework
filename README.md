### About:
* OS: python:3.8.0-slim

This docker container contains:
* [Python](https://www.python.org/)
* [Selenium](https://www.selenium.dev/)
* [RobotFramework](https://robotframework.org/)
* [Selenium2Library](https://robotframework.org/Selenium2Library/Selenium2Library.html)
* [ChromeWebDriver](https://chromedriver.chromium.org/getting-started)

### How to build or download:
#### Build docker images from Dockerfile:
* docker build . -t {tagname}

#### Download from Docker repository:
* docker pull moleszek/robotframework:1.0

### To run robot framework script using python-robotframework Docker image directly:
* docker run -it --rm -v {localFolderPath}:/home -w /home moleszek/python-robotframework:1.0 -m robot {robotTest}.robot

### To run robot scripts from docker compose:
* docker-compose run --rm robot -m robot {robotFramework}.robot

### To run chrome in headless mode add this parameters to Keywords in robot test
```
    ${chrome options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome options}   add_argument    headless
    Call Method    ${chrome options}   add_argument    disable-gpu
    Call Method    ${chrome options}   add_argument    no-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome options}
    Go to    www.bbc.com
    Maximize Browser Window
```