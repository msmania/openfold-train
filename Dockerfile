FROM mambaorg/micromamba:cuda12.8.1-ubuntu22.04

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
  git \
  && rm -rf /var/lib/apt/lists/*

USER mambauser
WORKDIR /work

RUN git clone https://github.com/msmania/openfold.git \
  -b pl_upgrades

RUN micromamba install -y -n base -f openfold/environment.yml \
  && micromamba clean --all --yes
