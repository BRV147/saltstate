{% from "powerdns/map.jinja" import powerdns with context %}

include:
  - powerdns

conf_native:
  file.managed:
    - name: {{ powerdns.lookup.config_file }}
    - source: salt://powerdns/files/pdns_native.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 600
    - require:
      - pkg: powerdns
    - watch_in:
      - service: powerdns
