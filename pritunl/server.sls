{%- from "pritunl/map.jinja" import server with context %}
{%- if server.enabled %}

pritunl_packages:
  pkg.latest:
  - names: {{ common.pkgs }}

/etc/pritunl.conf:
  file.managed:
  - source: salt://pritunl/files/pritunl.conf
  - template: jinja
  - mode: 640
  - group: pritunl
  - require:
    - pkg: pritunl_packages

pritunl_service:
  service.running:
  - enable: true
  - name: pritunl
  - watch:
    - file: /etc/pritunl.conf

{%- endif %}
