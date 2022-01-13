export ROOT_SIGALG=Falcon512
export LEAF_SIGALG=Falcon512
export KEX_ALG=lightsaber

cd /mnt/kemtls-experiment/mk-cert
python3 encoder.py
