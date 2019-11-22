# This state is meant for testing purposes only.
{%- set python_major_version = salt['grains.get']('pythonversion', ['2','7'])[0] %}

{%- set pypip_pkg = 'python-pip' %}
{%- if python_major_version == 3 %}
{%- set pypip_pkg = 'python3-pip' %}
{%- endif %}

# Required state for 2019.2.1
{{ pypip_pkg }}:
  pkg.installed
