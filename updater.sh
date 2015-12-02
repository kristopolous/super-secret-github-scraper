#!/bin/bash
cd ..
self=`pwd`
for i in */*; do
  if [ -d $i ]; then
    echo ">> Updating $i"
    cd $i

    if [ -e REPOSITORY-GONE ]; then
      echo '>> Repository is supposedly gone. Skipping'
    else
      git pull
      [ $? -eq 1 ] && touch REPOSITORY-GONE
    fi

    cd $self
  else
    echo ">> Skipping $i"
  fi
done
