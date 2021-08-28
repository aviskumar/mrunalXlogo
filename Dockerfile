IMPORT kalilinux/kali-rolling
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt upgrade -y && apt-get install sudo -y && apt-get install apt-utils -y
RUN touch ~/.hushlogin
RUN apt-get install -y\
    coreutils \
    bash \
    nodejs \
    bzip2 \
    curl \
    figlet \
    gcc \
    g++ \
    git \
    util-linux \
    libevent-dev \
    libjpeg-dev \
    libffi-dev \
    libpq-dev \
    libwebp-dev \
    libxml2 \
    libxml2-dev \
    libxslt-dev \
    musl \
    neofetch \
    libcurl4-openssl-dev \
    postgresql \
    postgresql-client \
    postgresql-server-dev-all \
    #chromedriver \
    openssl \
    pv \
    jq \
    wget \
    python3 \
    python3-dev \
    python3-pip \
    libreadline-dev \
    apktool \
    zipalign \
    sqlite3 \
    ffmpeg \
    mediainfo \
    imagemagick \
    libsqlite3-dev \
    chromium\
    zlib1g-dev \
    recoverjpeg \
    zip \
    megatools \
    axel \
    procps \
    policykit-1\
    opus-tools \
    bpm-tools \
    libfreetype6-dev
RUN sed -i '/<policy domain="path" rights="none" pattern="@\*"/d' /etc/ImageMagick-6/policy.xml
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install && axel https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && apt install -y ./google-chrome-stable_current_amd64.deb && rm google-chrome-stable_current_amd64.deb && axel https://chromedriver.storage.googleapis.com/86.0.4240.22/chromedriver_linux64.zip && unzip chromedriver_linux64.zip && chmod +x chromedriver && mv -f chromedriver /usr/bin/ && rm chromedriver_linux64.zip
RUN wget https://raw.githubusercontent.com/msy1717/logoCollabx/master/main.py
RUN wget https://raw.githubusercontent.com/msy1717/logo-bymrunal/master/requirements.txt
RUN pip3 install -r requirements.txt
CMD ["python3","mrunalbot.py"]