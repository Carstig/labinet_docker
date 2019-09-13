# Labinet Docker Container

_to train and test labinet images_

Things to do before the build:
- cp/mv tensorflow-models into this dir. maybe i should add git clone and keep the images and train config separately
- TODO: add script to symbolic links for data and train that should come from the host volume

## build this container

`cd <path to dockerfile> docker build --rm -t carstig/labinet_trainer . --no-cache=true`

## run this container

either use `nvidia-docker` or `docker --runtime=nvidia` :

```
$> nvidia-docker run -u $(id -u):$(id -g) -it --mount type=bind,source=/home/cgreiner/python/object_detection/tensorflow_models,target=/home/docker/tensorflow-models --rm --runtime=nvidia carstig/labinet_trainer /bin/bash
``` 

from within this shell I do:
```
cd .../tensorflow-models/research/object-detection
python train.py --logtostderr --train_dir=training --pipeline_config_path=training/ssd_mobilenet_v1_coco.config
```

currently, fails with CUDA init problem. 


