## Create directories to persist & clone repositories  ------------------
mkdir -p ~/project/{DOM,research}
git clone git@github.com:kcullimore/DOM_research.git ~/project/research
git clone git@github.com:kcullimore/DOM.git ~/project/DOM

## Open host machine devices to container (only need to do once per reboot)
xhost +local:

## Run docker container linked to directories with bind-mount  ------------------
docker run --rm -it \
       --network host \
       --env DISPLAY=unix$DISPLAY \
       --volume /tmp/.X11-unix:/tmp/.X11-unix \
       --mount type=bind,source=/home/$USER/project/DOM/,target=/project/DOM/ \
       --mount type=bind,source=/home/$USER/project/DOM_research/,target=/project/research/ \
       --name dom-test \
       kcull/dom_r:latest 



docker run --rm -it \
       --network host \
       --env DISPLAY=unix$DISPLAY \
       --volume /tmp/.X11-unix:/tmp/.X11-unix \
       --mount type=bind,source=/home/$USER/linCode/DOM_research/,target=/project/ \
       --name akl-test \
       test-2:latest
