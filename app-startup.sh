#! /bin/bash

privoxy --no-daemon /etc/privoxy/config
trap : TERM INT; sleep infinity & wait
