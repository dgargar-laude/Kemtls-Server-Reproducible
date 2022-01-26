#!/bin/bash

set -o nounset
set -o errexit

cd /mnt/kemtls-experiment/rustls/rustls-mio

cargo build --example tlsserver
