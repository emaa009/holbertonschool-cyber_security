#!/bin/bash
grep -Ev '^#|^$' /etc/snmp/snmpd.conf | grep "public"
