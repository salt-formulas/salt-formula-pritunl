{%- if pillar.pritunl is defined %}
include:
{%- if pillar.pritunl.server is defined %}
- pritunl.server
{%- endif %}
{%- endif %}
