# layoutEngine Research Project

This is the repository for my dissertation research and paper. This research has been configured to be reproducible with the use of a customized docker image. 

## Reproduce Report from within Linux OS

The docker image ``kcull/layoutengine-research`` is built from Ubuntu 18.04. 


Download the [docker image](https://hub.docker.com/repository/docker/kcull/layoutengine-research):  
``` 
docker pull kcull/layoutengine-research:latest
```

Clone this repository (for example):  
```
mkdir /home/$USER/layoutengine-research
git clone git@github.com:kcullimore/layoutengine-research.git /home/$USER/layoutengine-research
```


Grant local access to your X server to allow Emacs to run in a local window:  
**Warning: this exposes your computer. Read more [here](https://wiki.archlinux.org/index.php/Xhost).**  

```
xhost +local:
```


Run the container:   
**NOTE: this will bind mount the repository to ``/home/$USER/project`` in the docker container ``/project`` folder.**  

```
docker run --rm -it \
  --network host \
  --env DISPLAY=unix$DISPLAY \
  --volume /tmp/.X11-unix:/tmp/.X11-unix \
  --mount type=bind,source=/home/$USER/layoutengine-research/,target=/project/ \
  kcull/layoutengine-research:latest
```

From the container terminal prompt open report in Emacs:  
```
emacs /project/paper/paper_working_04.org
```

From Emacs org-mode generate PDF with ``C-c C-e l o`` command  

Close Emacs with ``C-x C-c`` command  

Exit the container
```
exit
```


