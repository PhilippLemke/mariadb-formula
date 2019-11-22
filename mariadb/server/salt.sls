# Integration for MariaDB into Salt-minion
{%- set os_family = salt['grains.get']('os_family', None) %}
{%- set python_major_version = salt['grains.get']('pythonversion', ['2','7'])[0] %}
{%- set pymysqldb_pkg = 'python-mysqldb' %}
{%- if python_major_version == 3 %}
{%- set pymysqldb_pkg = 'python3-mysqldb' %}
{%- endif %}

# Teach Salt to use the debian.cnf file
{%- if os_family == 'Debian' %}
salt_mysql_config:
  file.managed:
    - name: /etc/salt/minion.d/mysql.conf
    - contents: "mysql.default_file: '/etc/mysql/debian.cnf'"
    - require:
      - pkg: salt-minion
      - pkg: mysql-server
    - watch_in:
      - service: salt-minion
    - require_in:
      - service: salt-minion
{% endif %}

# We need {{ pymysqldb_pkg }} in order to make users and such
{{ pymysqldb_pkg }}:
  pkg.installed:
    - watch_in:
      - service: salt-minion
