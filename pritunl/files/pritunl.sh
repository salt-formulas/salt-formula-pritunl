#!/bin/bash

# generate ssl cert
pritunl set app.acme_domain {{ grains.id }}
pritunl set app.acme_key "openssl genrsa 4096"
pritunl set app.acme_timestamp `python -c 'import time;print time.time()'`
pritunl set app.acme_renew 0
