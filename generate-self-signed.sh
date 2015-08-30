#!/usr/bin/env bash

# SS_PASS defaults to undefined
SS_DIR=${SS_DIR:-$(pwd)}
SS_CN=${SS_CN:-$(hostname)}
SS_C=${SS_CO:-US}
SS_ST=${SS_ST:-TX}
SS_O=${SS_O:-None}
SS_L=${SS_L:-"San Antonio"}
SS_OU=${SS_OU:-IT}

SUBJ="C=$SS_C/ST=$SS_ST/O=$SS_O/L=$SS_L/CN=$SS_CN/OU=$SS_OU"
PASS_ARGS=""
if [ -z "$SS_PASS" ]; then
  PASS_ARGS="-passin pass:$SS_PASS"
fi

sudo mkdir -p "$SS_DIR"
sudo openssl genrsa -out "$SS_DIR/priv.key" 2048
sudo openssl req -new -subj "$SUBJ" -key "$SS_DIR/priv.key" -out "$SS_DIR/ssl.csr" $PASS_ARGS
sudo openssl x509 -req -days 365 -in "$SS_DIR/ssl.csr" -signkey "$SS_DIR/priv.key" -out "$SS_DIR/ssl.crt"
