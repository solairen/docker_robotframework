FROM python:3.11.1-slim

LABEL maintainer="solairen@solairen.tech"
ARG workdir=/robot

RUN mkdir ${workdir}
WORKDIR ${workdir}

ARG version=110.0.5481.30

COPY requirements.txt ${workdir}

# Install packages
RUN apt update && apt -y install --no-install-recommends unzip wget gnupg gnupg2 gnupg1 curl\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/

# Install Chrome & Chrome Web Driver
RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb [arch=amd64]  http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
RUN apt -y update
RUN apt -y install google-chrome-stable
RUN wget https://chromedriver.storage.googleapis.com/${version}/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN mv chromedriver /usr/bin/chromedriver
RUN chown root:root /usr/bin/chromedriver
RUN chmod +x /usr/bin/chromedriver
RUN rm -f chromedriver_linux64.zip

# Install python requirements
RUN pip install -r requirements.txt

ENTRYPOINT [ "python" ]
