{%- from "pritunl/map.jinja" import server with context %}
{% set pritunl_cli = salt['pillar.get']('pritunl:cli') %}

pritunl_cli_script:
   file.managed:
     - name: /var/lib/pritunl/pritunl.sh
     - template: jinja
     - source: salt://pritunl/files/pritunl.sh
     - mode: 0700
     - user: 'root'
     - group: 'root'

 pritunl_initialize:
   cmd.run:
   - name:  /var/lib/pritunl/pritunl.sh
   - require:
     - file: pritunl_cli_script
