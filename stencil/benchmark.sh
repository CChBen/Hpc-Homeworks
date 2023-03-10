# !/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <executable> <number of nodes>" >&2
  exit 1
fi

export DAPL_DBG_TYPE=0

DATAPATH=/gpfs/home/bxjs_01/stencil_data/stencil_data

srun -p compute -N $2 $1 7 256 256 256 100 ${DATAPATH}/stencil_data_256x256x256
srun -p compute -N $2 $1 7 384 384 384 100 ${DATAPATH}/stencil_data_384x384x384
srun -p compute -N $2 $1 7 512 512 512 100 ${DATAPATH}/stencil_data_512x512x512
srun -p compute -N $2 $1 7 768 768 768 100 ${DATAPATH}/stencil_data_768x768x768
