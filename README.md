# layoutEngine Research Project

This is the repository for my dissertation research and paper. This research has been configured to be reproducible with the use of a customized docker image. 

## Reproduce Report from within Linux OS

The docker image ``kcull/layoutengine-research`` is built from Ubuntu 18.04. 
- username: `user`
- password: `password`


Download the [docker image](https://hub.docker.com/repository/docker/kcull/layoutengine-research):  
``` 
$ docker pull kcull/layoutengine-research:latest
```

Clone this repository (for example):  
```
$ mkdir /home/$USER/layoutengine-research
$ git clone git@github.com:kcullimore/layoutengine-research.git /home/$USER/layoutengine-research
```


Grant local access to your X server to allow Emacs to run in a local window:  
**Warning: this exposes your computer. Read more [here](https://wiki.archlinux.org/index.php/Xhost).**  

```
$ xhost +local:
```

Run the container:   
**NOTE: this will bind mount the repository to ``/home/$USER/project`` in the docker container ``/project`` folder.**  

```
$ docker run --rm -it \
         --network host \
         --privileged=true \
         --env DISPLAY=unix$DISPLAY \
         --volume /tmp/.X11-unix:/tmp/.X11-unix \
         --volume /var/run/docker.sock:/var/run/docker.sock \
         --mount type=bind,source=/home/$USER/layoutengine-research/,target=/project/research/ \
         --name layoutengine-research \
         kcull/layoutengine-research:latest
```

From the container terminal prompt open report in Emacs:  
```
$ emacs /project/paper/layoutengine-research-paper.org
```

From Emacs org-mode generate PDF with ``C-c C-e l o`` command  

Close Emacs with ``C-x C-c`` command  

Reset X server privileges
```
$ xhost -
```

Exit the container
```
$ exit
```


## Reproduce Report from within MacOS

All steps are similar to the Linux OS instructions with the exception of the `docker run` command. The difference is for the sole purpose of opening Emacs in its GUI form. 


Run the container:   
**NOTE: this will bind mount the repository to ``/home/$USER/project`` in the docker container ``/project`` folder.**  

```
$ docker run --rm -it \
         --network host \
         --privileged=true \
         --env DISPLAY=$(ipconfig getifaddr en0):0 \
         --env XAUTHORITY=/.Xauthority \
         --volume /tmp/.X11-unix:/tmp/.X11-unix \
         --volume $HOME/.Xauthority:/.Xauthority \
         --volume /var/run/docker.sock:/var/run/docker.sock \
         --mount type=bind,source=$HOME/macBox/iah/code/layoutengine-research/,target=/project/research/ \
         --name layoutengine-research \
         kcull/layoutengine-research:latest
```
