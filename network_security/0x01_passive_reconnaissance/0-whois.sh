#!/bin/bash
whois $1 | awk -F':[[:space:]]*' '/^(Registrant|Admin|Tech)[[:space:]]/{key=$1; val=$2; if (key ~ /Street$/) val=val" "; if (key ~ /Ext$/) key=key":"; printf "%s,%s\n", key, val}' > $1.csv
