#!/bin/bash
cd ..
self=`pwd`
for i in */*; do
  if [ -d $i ]; then
    cd $i
    git pull
    cd $self
  fi
done
