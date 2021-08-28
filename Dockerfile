IMPORT kalilinux/kali-rolling
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt upgrade -y && apt-get install sudo -y && apt-get install apt-utils -y
RUN apt-get install -y\
    bash \
    wget \
    python3 \
    python3-dev \
    python3-pip \
RUN git clone https://github.com/msy1717/mrunalXlogo.git
RUN pip3 install -r requirements.txt
CMD ["bash", "start.sh"]

