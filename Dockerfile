FROM python:3.8-slim

LABEL maintainer="michal.oleszek@outlook.com"

WORKDIR /home

ARG version=86.0.4240.22

RUN apt-get -y update \
    && apt-get -y install --no-install-recommends apt-utils curl unzip ca-certificates gnupg gnupg2 gnupg1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install selenium
RUN pip install requests
RUN pip install lxml
RUN pip install beautifulsoup4
RUN pip install flask
RUN pip install numpy

# Install RobotFramework
RUN pip install robotframework
RUN pip install robotframework-selenium2library

# Install Chrome & Chrome WebDriver
RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb [arch=amd64]  http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
RUN apt-get -y update \
    && apt-get -y install --no-install-recommends google-chrome-stable \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN curl https://chromedriver.storage.googleapis.com/${version}/chromedriver_linux64.zip -o driver.zip
RUN unzip driver.zip
RUN mv chromedriver /usr/bin/chromedriver
RUN chown root:root /usr/bin/chromedriver
RUN chmod +x /usr/bin/chromedriver
RUN rm -f driver.zip

ENTRYPOINT [ "python" ]