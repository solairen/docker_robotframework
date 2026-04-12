# Docker Robot Framework

[![Docker Hub](https://img.shields.io/docker/pulls/moleszek/robotframework)](https://hub.docker.com/r/moleszek/robotframework)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A Docker container pre-configured with [Robot Framework](https://robotframework.org/) and related testing libraries for automated browser and API testing.

## Included Components

| Component | Version |
| --------- | ------- |
| [Python](https://www.python.org/) | 3.14.0 |
| [Robot Framework](https://robotframework.org/) | 7.4.2 |
| [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/) | 6.8.0 |
| [Selenium](https://www.selenium.dev/) | 4.43.0 |
| [Chromium](https://www.chromium.org/) & ChromeDriver | 131.0.6778.204 |
| [Requests](https://docs.python-requests.org/en/latest/) | 2.33.1 |
| [BeautifulSoup4](https://www.crummy.com/software/BeautifulSoup/) | 4.14.3 |
| [Flask](https://palletsprojects.com/p/flask/) | 3.1.3 |

## Getting Started

### Pull from Docker Hub

```bash
docker pull moleszek/robotframework:latest
```

### Build locally

```bash
docker build . -t robotframework:latest
```

## Usage

Run a Robot Framework test suite:

```bash
docker run -it --rm -v /path/to/tests:/robot moleszek/robotframework:latest -m robot test_suite.robot
```

### Headless Chromium

To run browser tests inside the container, add the following keyword to your Robot Framework test:

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

See [tests/example.robot](tests/example.robot) for a complete working example.

## Multi-Architecture Support

The Docker image is built for both `linux/amd64` and `linux/arm64` platforms.

## Contributing

Contributions are welcome! Please read the [Contributing Guide](CONTRIBUTING.md) before submitting a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
