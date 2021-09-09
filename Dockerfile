FROM moleszek/flake:1.3

LABEL maintainer="michal.oleszek@outlook.com"

RUN mkdir /robot
WORKDIR /robot

ARG version=0.29.1

# Install Python dependencies
RUN pip3 install selenium
RUN pip3 install requests
RUN pip3 install beautifulsoup4
RUN pip3 install flask

# Install RobotFramework
RUN pip3 install robotframework
RUN pip3 install robotframework-selenium2library

# Install Firefox & Gecko Driver
RUN apk add --no-cache firefox-esr
RUN wget https://github.com/mozilla/geckodriver/releases/download/v${version}/geckodriver-v${version}-linux64.tar.gz
RUN tar -zxvf geckodriver-v${version}-linux64.tar.gz
RUN mv geckodriver /usr/bin/geckodriver
RUN chmod +x /usr/bin/geckodriver
RUN rm -f geckodriver-v${version}-linux64.tar.gz

ENTRYPOINT [ "python3" ]