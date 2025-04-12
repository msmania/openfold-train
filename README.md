# Command examples

https://micromamba-docker.readthedocs.io/en/latest/quick_start.html

```
docker rmi openfold-train; docker build -t openfold-train .
docker run -it --rm openfold-train /bin/bash
```

Local testing

```
docker run -it --rm \
  -v /home/ubuntu/work:/work \
  mambaorg/micromamba:cuda12.8.1-ubuntu22.04 \
  /bin/bash
cd /work
micromamba install -y -n base -f environment.yml
```
