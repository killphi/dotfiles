#!/bin/bash
[[ -z `ps -e | grep redshift` ]] || killall -9 redshift
[[ -e /usr/bin/redshift ]] && exec /usr/bin/redshift
