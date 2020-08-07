Astrad for Docker
===================

[![Docker Stars](https://img.shields.io/docker/stars/Astra_Linux/astrad.svg)](https://hub.docker.com/r/Astra_Linux/astrad/)
[![Docker Pulls](https://img.shields.io/docker/pulls/Astra_Linux/astrad.svg)](https://hub.docker.com/r/Astra_Linux/astrad/)
[![Build Status](https://travis-ci.org/AsrtaCore/docker-astrad.svg?branch=master)](https://travis-ci.org/AsrtaCore/docker-astrad/)
[![ImageLayers](https://images.microbadger.com/badges/image/Astra_Linux/astrad.svg)](https://microbadger.com/#/images/Astra_Linux/astrad)

Docker image that runs the AstraCore astrad node in a container for easy deployment.


Requirements
------------

* Physical machine, cloud instance, or VPS that supports Docker (i.e. [Vultr](http://bit.ly/1HngXg0), [Digital Ocean](http://bit.ly/18AykdD), KVM or XEN based VMs) running Ubuntu 14.04 or later (*not OpenVZ containers!*)
* At least 100 GB to store the block chain files (and always growing!)
* At least 1 GB RAM + 2 GB swap file

Recommended and tested on unadvertised (only shown within control panel) [Vultr SATA Storage 1024 MB RAM/250 GB disk instance @ $10/mo](http://bit.ly/vultrastrad).  Vultr also *accepts ASTRAchain payments*!


Really Fast Quick Start
-----------------------

One liner for Ubuntu 14.04 LTS machines with JSON-RPC enabled on localhost and adds upstart init script:

    curl https://raw.githubusercontent.com/AstraCore/docker-astrad/master/bootstrap-host.sh | sh -s trusty


Quick Start
-----------

1. Create a `astrad-data` volume to persist the astrad blockchain data, should exit immediately.  The `astrad-data` container will store the blockchain when the node container is recreated (software upgrade, reboot, etc):

        docker volume create --name=astrad-data
        docker run -v astrad-data:/astra --name=astrad-node -d \
            -p 5878:5878 \
            -p 127.0.0.1:6940:6940 \
            astra/astrad

2. Verify that the container is running and astrad node is downloading the blockchain

        $ docker ps
        CONTAINER ID        IMAGE                         COMMAND             CREATED             STATUS              PORTS                                              NAMES
        d0e1076b2dca        astra/astrad:latest     "astra_oneshot"       2 seconds ago       Up 1 seconds        127.0.0.1:6940->6940/tcp, 0.0.0.0:5878->5878/tcp   astrad-node

3. You can then access the daemon's output thanks to the [docker logs command]( https://docs.docker.com/reference/commandline/cli/#logs)

        docker logs -f astrad-node

4. Install optional init scripts for upstart and systemd are in the `init` directory.


Documentation
-------------

* Additional documentation in the [docs folder](docs).
