#!/bin/sh

jekyll build
tar -caf site.tgz -C _site .
scp site.tgz erebus.the-tk.com:
ssh -t erebus.the-tk.com webtools/updateweb.sh
