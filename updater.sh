#!/bin/bash
cd ..
self=`pwd`
for i in */*; do
  if [ -d $i ]; then
    echo ">> updating $i"
    cd $i
    git pull
    cd $self
  else
    echo ">> skipping $i"
  fi
done
