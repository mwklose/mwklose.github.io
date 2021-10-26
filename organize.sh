#!/bin/sh
# Shell script for moving site items to correct location
cp -a /md/site_libs/ site_libs/
rm -rf /md/site_libs/
# Move HTML documents to top level
mv /md/*.html /.