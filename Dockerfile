FROM tensorflow/tensorflow:latest-gpu-py3

ADD . /home/docker/labinet_work

# change to tensorflow dir
WORKDIR /home/docker/labinet_work

LABEL maintainer="carstig@yahoo.de"

RUN apt-get update

RUN apt-get install -y git python3-protobuf protobuf-compiler \
  build-essential cmake nano pkg-config
  

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

WORKDIR /home/docker/labinet_work/
RUN git clone --depth 1 https://github.com/cocodataset/cocoapi.git

# install tensorflow models package
RUN git clone --depth 1 https://github.com/tensorflow/models tensorflow-models
WORKDIR ./tensorflow-models/research
RUN echo "export PYTHONPATH=${PYTHONPATH}:`pwd`:`pwd`/object_detection:`pwd`/slim" >> /.bashrc
RUN export PYTHONPATH=${PYTHONPATH}:`pwd`:`pwd`/object_detection:`pwd`/slim
RUN source /.bashrc

RUN python3 setup.py build
RUN python3 setup.py install

WORKDIR /home/docker/labinet_work/cocoapi/PythonAPI
RUN make
# if pycocotools are then not found... use:
#RUN curl -OL https://github.com/google/protobuf/releases/download/v3.2.0/protoc-3.2.0-linux-x86_64.zip
#RUN unzip protoc-3.2.0-linux-x86_64.zip -d protoc3
#RUN mv protoc3/bin/* /usr/local/bin/
#RUN mv protoc3/include/* /usr/local/include/

CMD ["echo", "Running tensorflow docker"]

WORKDIR /home/docker/labinet_work/tensorflow-models/research/object_detection

# TODO working files : images, data, training dir (config) and dir where to put training results 
# 
