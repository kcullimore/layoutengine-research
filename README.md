# layoutEngine Research Project

This is the repository for my dissertation research and paper. This research has been configured to be reproducible with the use of a customized docker image. 

# Reproduce Report with Linux OS

The docker image *kcull/layoutengine-research* is built from Ubuntu 18.04. 

Download the [docker image](https://hub.docker.com/repository/docker/kcull/layoutengine-research):  
`docker pull kcull/layoutengine-research:latest`

Clone this repository:  
`mkdir /home/$USER/layoutengine-research`
`git clone git@github.com:kcullimore/layoutengine-research.git /home/$USER/layoutengine-research`


Grant local access to your X screen (*Warning: this exposes your computer*): 
`xhost +local`


Run the container with access to X server
`docker run --rm -it \
       --network host \
       --env DISPLAY=unix$DISPLAY \
       --volume /tmp/.X11-unix:/tmp/.X11-unix \
       --mount type=bind,source=/home/$USER/layoutegine-research/,target=/project/ \
       kcull/layoutengine-research:latest`

From the terminal open an Emacs window
`emacs /project/paper/paper_working_04.org`

From Emacs org-mode generate PDF 
`C-c C-e l o`

Close Emacs
`C-x C-c`

