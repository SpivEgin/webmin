#!/bin/sh
cd /usr/local/webadmin
tar --exclude blib --exclude .svn --exclude make-module.sh --exclude Makefile -cvzf ~/webmin.com/AdFreeZone-API-1.0.tar.gz AdFreeZone-API-1.0/
