#!/bin/bash

# generate ssl cert
pritunl set app.acme_domain {{ grains.id }}
pritunl set app.acme_key "openssl genrsa 4096"
pritunl set app.acme_timestamp `python -c 'import time;print time.time()'`
pritunl set app.acme_renew 0

# set Okta
pritunl set app.sso "{{ cli.sso|yaml }}"
pritunl set app.sso_okta_app_id "{{ cli.app_id|yaml }}"
pritunl set app.sso_saml_url "{{ cli.saml_url|yaml }}"
pritunl set app.sso_saml_issuer_url "{{ cli.saml_issuer_url|yaml }}"
pritunl set app.sso_okta_token "{{ cli.okta_token|yaml }}"
pritunl set app.sso_okta_mode = "{{ cli.okta_mode|yaml }}"
pritunl set app.sso_saml_cert = "{{ cli.saml_cert|yaml }}"
