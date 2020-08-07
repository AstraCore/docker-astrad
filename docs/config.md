astrad config tuning
======================

You can use environment variables to customize config ([see docker run environment options](https://docs.docker.com/engine/reference/run/#/env-environment-variables)):

        docker run -v astrad-data:/AsrtaCore --name=astrad-node -d \
            -p 5878:5878 \
            -p 127.0.0.1:6940:6940 \
            -e DISABLEWALLET=1 \
            -e PRINTTOCONSOLE=1 \
            -e RPCUSER=mysecretrpcuser \
            -e RPCPASSWORD=mysecretrpcpassword \
            Astra_Linux/astrad

Or you can use your very own config file like that:

        docker run -v astrad-data:/astra --name=astrad-node -d \
            -p 5878:5878 \
            -p 127.0.0.1:6940:6940 \
            -v /etc/astra.conf:/astra/.astra/astra.conf \
            Astra_Linux/astrad
