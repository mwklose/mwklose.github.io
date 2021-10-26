#!/bin/sh
# Shell script for moving site items to correct location
if [ -d "md/site_libs" ]
then
  cp -a md/site_libs/ site_libs/
  rm -rf md/site_libs/
else
  echo "site_libs already moved"
fi

# Move HTML documents to top level
count=`ls -1 md/*.html 2>/dev/null | wc -l`
if [ $count != 0 ]
then 
  mv md/*.html .
else
  echo "no HTML files to move"
fi