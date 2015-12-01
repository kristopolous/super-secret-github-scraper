#!/bin/bash
cd ..
self=`pwd`
for i in */*; do
  cd $i
  git pull
  cd $self
done
