#!/bin/bash

set -o nounset
set -o errexit


cd /mnt/kemtls-experiment/mk-cert
cp /mnt/updated/encoder.py .

SIG_ALGS="falcon512 dilithium2 rainbowIclassic"
KEX_ALGS="kyber512 ntruhps2048509 lightsaber"
TARGET_DIR="/mnt/certs"
NUM_CERTS=1000

if [ ! -d  $TARGET_DIR ]; then
    mkdir -p $TARGET_DIR
fi

for SIG_ALG in $SIG_ALGS; do
    for KALG in $KEX_ALGS; do

        export ROOT_SIGALG=$SIG_ALG
        export INT_SIGALG=$SIG_ALG
        export LEAF_ALG=$KALG

        for i in $(seq 1 ${NUM_CERTS}); do
            NUM=$(printf "%04d" $i)
            echo "Doing ${ROOT_SIGALG} x ${LEAF_ALG} number ${NUM} now."
            python3 encoder.py
            mv kem.crt ${TARGET_DIR}/${ROOT_SIGALG}_${LEAF_ALG}_${NUM}.crt
            mv kem.key ${TARGET_DIR}/${ROOT_SIGALG}_${LEAF_ALG}_${NUM}.key
            mv kem-ca.crt ${TARGET_DIR}/${ROOT_SIGALG}_${LEAF_ALG}_${NUM}_ca.crt
        done
    done
done
