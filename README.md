# Command examples

https://micromamba-docker.readthedocs.io/en/latest/quick_start.html

```
docker rmi openfold-train; docker build -t openfold-train .
mkdir outputs; chmod 777 outputs

# https://github.com/ultralytics/yolov5/issues/4964#issuecomment-1226976208
docker run -it --rm \
  --gpus=1 \
  --ipc=host \
  -p 8888:8888 \
  -v /home/ubuntu/openfold-work/data:/opt/openfold/data \
  -v /home/ubuntu/openfold-work/outputs:/opt/openfold/outputs \
  openfold-train \
  /bin/bash

python3 train_openfold.py \
  ./data/pdb_data/mmcifs \
  ./data/alignment_data/alignments \
  ./data/pdb_data/mmcifs \
  ./outputs \
  2025-04-12 \
  --config_preset "no_template" \
  --num_nodes 1 \
  --seed 42 \
  --gpus 1 \
  --deepspeed_config_path deepspeed_config.json \
  --template_release_dates_cache_path ./data/mmcif_cache.json \
  --train_chain_data_cache_path ./data/chain_data_cache.json \
  --max_epochs 1 \
  --train_epoch_len 2

torchrun \
  --nnodes=1 \
  --nproc_per_node=1 \
  --max-restarts=0 \
  --rdzv-id=1234 \
  --rdzv_backend=c10d \
  --rdzv_endpoint=localhost:8888 \
  train_openfold.py \
    ./data/pdb_data/mmcifs \
    ./data/alignment_data/alignments \
    ./data/pdb_data/mmcifs \
    ./outputs \
    2025-04-12 \
    --config_preset "no_template" \
    --num_nodes 1 \
    --seed 42 \
    --gpus 1 \
    --deepspeed_config_path deepspeed_config.json \
    --template_release_dates_cache_path ./data/mmcif_cache.json \
    --train_chain_data_cache_path ./data/chain_data_cache.json \
    --max_epochs 1 \
    --train_epoch_len 2
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
