# Labinet Docker Container

_to train and test labinet images_

## TODO
- cp/mv tensorflow-models into this dir. maybe i should add git clone and keep the images and train config separately
- TODO: add script to symbolic links for data and train that should come from the host volume
  - must run docker as root (-> no -u ... )
  - PYTHONPATH does not work
  - git clone tensorflow-models -> maybe replace with my old clone
    - currently I get python code api problems (`ValueError: Protocol message SsdFeatureExtractor has no field num_layers.`)

## build this container

```
cd <path to dockerfile> 
docker build --rm -t carstig/labinet_trainer . --no-cache=true
```

## run this container

either use `nvidia-docker` or `docker --runtime=nvidia` . This is deprecated. check that you can use `docker --gpu all` 

```
$> docker run --gpus all -it --mount type=bind,source=/home/cgreiner/python/object_detection/tf_objectdetect_input,target=/home/docker/tf_objectdetect_input --rm carstig/labinet_trainer /bin/bash
``` 

from within this shell I do:
```
cd .../tensorflow-models/research/object-detection
python train.py --logtostderr --train_dir=training --pipeline_config_path=training/ssd_mobilenet_v1_coco.config
```

see TODO list now


