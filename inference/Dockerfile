FROM carstig/labinet_trainer:latest


LABEL maintainer="carstig@yahoo.de"

RUN apt-get update && yes | apt-get upgrade

# avoids asking for 'region'
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y libopencv-dev python3-opencv

ADD . /home/docker/labinet_work
# change to tensorflow dir
WORKDIR /home/docker/labinet_work/

CMD ["echo", "Running tensorflow docker"]

WORKDIR /home/docker/

