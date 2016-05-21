#!/bin/sh

~/.gem/ruby/2.2.0/bin/jekyll build
tar -caf site.tgz _site
scp site.tgz erebus.the-tk.com:
