## Create directories to persist & clone repositories  ------------------
mkdir /home/$USER/layoutengine-research
git clone git@github.com:kcullimore/layoutengine-research.git /home/$USER/layoutengine-research

## Open host machine devices to container (only need to do once per reboot)
xhost +local:

## Run docker container linked to directories with bind-mount  ------------------
docker run --rm -it \
       --network host \
       --env DISPLAY=unix$DISPLAY \
       --volume /tmp/.X11-unix:/tmp/.X11-unix \
       --mount type=bind,source=/home/$USER/layoutegine-research/,target=/project/ \
       --name akl-test \
       test-2:latest


docker run --rm -it \
       --network host \
       --env DISPLAY=unix$DISPLAY \
       --volume /tmp/.X11-unix:/tmp/.X11-unix \
       --mount type=bind,source=/home/$USER/linCode/layoutengine-research/,target=/project/ \
       --name akl-test \
       test-2:latest
