FROM tensorflow/tensorflow:latest-gpu-py3

# following: https://towardsdatascience.com/tensorflow-object-detection-with-docker-from-scratch-5e015b639b0b

LABEL maintainer="carstig@yahoo.de"

RUN apt-get update && yes | apt-get upgrade
RUN apt-get install -y git python-dev python-pip protobuf-compiler python-pil python-lxml python3-protobuf build-essential cmake nano pkg-config
RUN pip install --upgrade pip

RUN pip install jupyter matplotlib numpy pandas utils requests pillow

ADD . /home/docker/labinet_work
# change to tensorflow dir
WORKDIR /home/docker/labinet_work/


# I decided to _not_ clone tensorflow-models and rather consider this as a workdir
# updated also via external work

#RUN git clone --depth 1 https://github.com/cocodataset/cocoapi.git

# install tensorflow models package
#RUN git clone --depth 1 https://github.com/tensorflow/models tensorflow-models
#WORKDIR /home/docker/labinet_work/tensorflow-models/research
#RUN echo "export PYTHONPATH=${PYTHONPATH}:`pwd`:`pwd`/object_detection:`pwd`/slim" >> /.bashrc
#>>> we still need this >>> RUN export PYTHONPATH=${PYTHONPATH}:`pwd`:`pwd`/object_detection:`pwd`/slim
#RUN source /.bashrc
#RUN protoc object_detection/protos/*.proto --python_out=.
#RUN python3 setup.py build
#RUN python3 setup.py install

#WORKDIR /home/docker/labinet_work/cocoapi/PythonAPI
#RUN make

# if pycocotools are then not found... use:
#RUN curl -OL https://github.com/google/protobuf/releases/download/v3.2.0/protoc-3.2.0-linux-x86_64.zip
#RUN unzip protoc-3.2.0-linux-x86_64.zip -d protoc3
#RUN mv protoc3/bin/* /usr/local/bin/
#RUN mv protoc3/include/* /usr/local/include/

CMD ["echo", "Running tensorflow docker"]

# now done via --mount: WORKDIR /home/docker/labinet_work/tensorflow-models/research/object_detection
WORKDIR /home/docker/
