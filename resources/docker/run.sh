## Create directories to persist & clone repositories  ------------------
mkdir /home/$USER/layoutengine-research
git clone git@github.com:kcullimore/layoutengine-research.git /home/$USER/layoutengine-research

## Open host machine devices to container (only need to do once per reboot)
xhost +local:

## Run docker container linked to directories with bind-mount  ------------------
docker run --rm -it \
       --network host \
       --privileged=true \
       --env DISPLAY=unix$DISPLAY \
       --volume /tmp/.X11-unix:/tmp/.X11-unix \
       --volume /var/run/docker.sock:/var/run/docker.sock \
       --mount type=bind,source=/home/$USER/layoutegine-research/,target=/project/research/ \
       --name layoutengine-research \
       kcull/layoutengine-research:latest 

docker run --rm -it \
       --network host \
       --privileged=true \
       --env DISPLAY=unix$DISPLAY \
       --volume /tmp/.X11-unix:/tmp/.X11-unix \
       --volume /var/run/docker.sock:/var/run/docker.sock \
       --mount type=bind,source=/home/$USER/linCode/layoutengine-research/,target=/project/research/ \
       --name layoutengine-research \
       kcull/layoutengine-research:latest 
