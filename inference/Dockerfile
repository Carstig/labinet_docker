FROM carstig/labinet_trainer:latest


LABEL maintainer="carstig@yahoo.de"

RUN apt-get update && yes | apt-get upgrade

#RUN apt-get install -y \
#  python3-lxml \
#  python3-pil
#   python3-notebook 
#   python3-jupyter-console 
#   python3-jupyter-core 
#   python3-jupyter-client 
#   python3-ipykernel

# avoids asking for 'region'
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y python-opencv


ADD . /home/docker/labinet_work
# change to tensorflow dir
WORKDIR /home/docker/labinet_work/

CMD ["echo", "Running tensorflow docker"]

WORKDIR /home/docker/

