
## Linux ## ------------------ ## ------------------ ## ------------------ ##
## Create directories to persist & clone repositories  ------------------
mkdir /home/$USER/layoutengine-research
git clone git@github.com:kcullimore/layoutengine-research.git /home/$USER/layoutengine-research

## Open host machine devices to container (only need to do once per reboot)
xhost +local:

## Initialize docker swarm 
docker swarm init \
       --advertise-addr 192.168.1.78

## Create bridge network 
docker network create \
       --driver overlay \
       --attachable research-net

## Run docker container linked to directories with bind-mount  ------------------
docker run --rm -it \
       --network research-net \
       --privileged=true \
       --env DISPLAY=unix$DISPLAY \
       --volume /tmp/.X11-unix:/tmp/.X11-unix \
       --volume /var/run/docker.sock:/var/run/docker.sock \
       --mount type=bind,source=/home/$USER/layoutengine-research/,target=/project/research/ \
       --name layoutengine-research \
       kcull/layoutengine-research:latest 

docker run --rm -it \
       --network research-net \
       --privileged=true \
       --env DISPLAY=unix$DISPLAY \
       --volume /tmp/.X11-unix:/tmp/.X11-unix \
       --volume /var/run/docker.sock:/var/run/docker.sock \
       --mount type=bind,source=/home/$USER/linCode/layoutengine-research/,target=/project/research/ \
       --name layoutengine-research \
       kcull/layoutengine-research:latest 



## MacOS ## ------------------ ## ------------------ ## ------------------ ##
## Run docker container linked to directories with bind-mount  ------------------

## Open host machine devices to container (only need to do once per reboot)
## NOTE: Xquartz X11 Preferences/Security set "Allow connections from network clients"
xhost +local:

## Run docker container linked to directories with bind-mount  ------------------
docker run --rm -it \
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
