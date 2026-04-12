FROM python:3.14-slim-trixie

LABEL maintainer="michal@michaloleszek.com"
ARG workdir=/robot

RUN mkdir ${workdir}
WORKDIR ${workdir}

COPY requirements.txt ${workdir}

# Install packages including Chromium and ChromeDriver
RUN apt update && apt -y install --no-install-recommends \
    unzip wget gnupg gnupg2 gnupg1 curl \
    chromium chromium-driver \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create symlinks for compatibility
RUN ln -s /usr/bin/chromium /usr/bin/google-chrome || true && \
    ln -s /usr/bin/chromedriver /usr/bin/chromedriver || true

# Install python requirements
RUN pip install -r requirements.txt

ENTRYPOINT [ "python" ]
