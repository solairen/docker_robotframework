### About:
* OS: private image based on alpine linux

This docker container contains:
* [Python](https://www.python.org/)
* [Selenium](https://www.selenium.dev/)
* [RobotFramework](https://robotframework.org/)
* [Selenium2Library](https://robotframework.org/Selenium2Library/Selenium2Library.html)
* [GeckoDriver](https://github.com/mozilla/geckodriver)

### Tag version
Check latest container tag [version](https://hub.docker.com/r/moleszek/robotframework/tags?page=1&ordering=last_updated) and change **<tag>** with proper tag version.

### How to build or download:
#### Build docker images from Dockerfile:
* docker build . -t {tagname}

#### Download from Docker repository:
* docker pull moleszek/robotframework:<tag>

### How to run:
#### To run robot framework script using robotframework Docker image directly:
* docker run -it --rm -v {localFolderPath}:/robot moleszek/robotframework:<tag> -m robot {robotTest}.robot

#### To run Firefox in headless mode add this parameters to Keywords in robot test
```txt
    ${firefox options} =     Evaluate    sys.modules['selenium.webdriver'].firefox.webdriver.Options()    sys, selenium.webdriver
    Call Method    ${firefox options}   add_argument    -headless
    Create Webdriver    Firefox    firefox_options=${firefox options}
    Maximize Browser Window
    Go To    https://github.com
    Capture Page Screenshot
    [Teardown]    Close All Browsers
```
