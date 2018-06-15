#!/bin/sh
cd /usr/local/webadmin
tar --exclude blib --exclude .svn --exclude make-module.sh --exclude Makefile -cvzf ~/adfreezone.org/AdFreeZone-API-1.0.tar.gz AdFreeZone-API-1.0/
