### About:
* OS: python 3.10

This docker container contains:
* [Python](https://www.python.org/)
* [Selenium](https://www.selenium.dev/)
* [RobotFramework](https://robotframework.org/)
* [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/)
* [ChromeDriver](https://chromedriver.chromium.org/)
* [Requests](https://docs.python-requests.org/en/latest/)
* [Beautifulsoup4](https://www.crummy.com/software/BeautifulSoup/)
* [Flask](https://palletsprojects.com/p/flask/)

### How to build or download:
#### Build docker images from Dockerfile:
* docker build . -t {tagname}

#### Download from Docker repository:
* docker pull moleszek/robotframework:latest

### How to run:
#### To run robot framework script using robotframework Docker image directly:
* docker run -it --rm -v {localFolderPath}:/robot moleszek/robotframework:latest -m robot {robotTest}.robot

#### Add headless chrome to keywords
Inside the **keywords** section add:
```robot
*** Keywords ***
Chrome Headless
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome_options}
```

This **keyword** allows to run chrome in headless mode.

See [example](tests/example.robot).
