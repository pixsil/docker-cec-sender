#!/bin/sh
echo "starting apache"
apachectl start
echo "apache started"


echo "starting pipe"
tail -f /tmp/cec-pipe-in | cec-client
echo "stoped scirpt"
