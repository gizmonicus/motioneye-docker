FROM golang:latest

# Set up repo for ffmpeg using repo from official install docs
# https://github.com/ccrisan/motioneye/wiki/Install-On-Ubuntu
#RUN apt-get -y install software-properties-common && \
    #add-apt-repository -y ppa:kirillshkrogalev/ffmpeg-next && \
    #apt-get -y update && \
    #apt-get clean
RUN echo "deb http://www.deb-multimedia.org jessie main non-free" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y --allow-unauthenticated install deb-multimedia-keyring && \
    apt-get update

RUN apt-get -y install \
    ffmpeg \
    git \
    libcurl4-openssl-dev \
    libjpeg-dev \
    libssl-dev \
    motion \
    python-dev \
    python-pip \
    v4l-utils \
    wget && \
    apt-get clean

RUN go get -u github.com/odeke-em/drive/cmd/drive
RUN pip install motioneye
ADD ./upload2drive /usr/local/bin/

# Create media config dirs. These need to be persistent to save configuration 
# and images/videos generated by motion processes.
RUN mkdir -p /etc/motioneye /var/lib/motioneye
VOLUME [ "/etc/motioneye", "/var/lib/motioneye" ]
EXPOSE 8765
CMD /usr/local/bin/meyectl startserver
