# This state is meant for testing purposes only.

# Required state for 2019.2.1
python-pip:
  pkg.installed

# Required to be able to do debconf.set
debconf-utils:
  pkg.installed:
    - require_in:
      - debconf: mysql_debconf
