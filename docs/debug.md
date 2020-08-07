# Debugging

## Things to Check

* RAM utilization -- astrad is very hungry and typically needs in excess of 1GB.  A swap file might be necessary.
* Disk utilization -- The AstraCore blockchain will continue growing and growing and growing.  Then it will grow some more.  At the time of writing, 40GB+ is necessary.

## Viewing astrad Logs

    docker logs astrad-node


## Running Bash in Docker Container

*Note:* This container will be run in the same way as the astrad node, but will not connect to already running containers or processes.

    docker run -v astrad-data:/astra --rm -it Astra_Linux/astrad bash -l

You can also attach bash into running container to debug running astrad

    docker exec -it astrad-node bash -l
