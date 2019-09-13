FROM tensorflow/tensorflow:latest-gpu-py3

ADD . /home/docker/labinet_work

# change to tensorflow dir
WORKDIR /home/docker/labinet_work

LABEL maintainer="carstig@yahoo.de"

RUN apt-get update

RUN apt-get install -y protobuf-compiler \
  build-essential cmake pkg-config
  

# stuff probably not needed
#  libgtk-3-dev
#  libjpeg8-dev libtiff5-dev 
#  libavcodec-dev libavformat-dev libswscale-dev libv4l-dev 
#  libxvidcore-dev libx264-dev 

RUN apt-get install -y \
  python3-lxml \
  python3-pil

#   python3-notebook 
#   python3-jupyter-console 
#   python3-jupyter-core 
#   python3-jupyter-client 
#   python3-ipykernel

RUN pip3 install jupyter

# hangs? fails with Terminal input (use value : 8 for Europe)
#RUN apt-get install -y \
#  python3-opencv
# RUN pip install opencv-python==3.4.0.12 requests

RUN pip3 install matplotlib numpy pandas utils requests

# install tensorflow models package
WORKDIR /home/docker/labinet_work/tensorflow-models/research
RUN echo "export PYTHONPATH=${PYTHONPATH}:`pwd`:`pwd`/object_detection:`pwd`/slim" >> ~/.bashrc#
#
RUN python3 setup.py build
RUN python3 setup.py install

WORKDIR /home/docker/labinet_work/cocoapi/PythonAPI
RUN make

CMD ["echo", "Running tensorflow docker"]

# TODO working files : images, data, training dir (config) and dir where to put training results 
# 
