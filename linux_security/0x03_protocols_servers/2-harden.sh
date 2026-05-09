#!/bin/bash
find / -type d -perm -0002 -exec chmod 755 {} + -print 2>/dev/null
