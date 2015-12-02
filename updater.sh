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
      if [ $? -eq 1 ]; then
        echo 'Woops, respository seems missing. Marking this for the future.'
        touch REPOSITORY-GONE
      fi
    fi

    cd $self
  else
    echo ">> Skipping $i"
  fi
done
