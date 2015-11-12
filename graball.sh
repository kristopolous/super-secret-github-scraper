#!/bin/bash

cwd=`pwd`
gitprojects() {
  for range in daily weekly monthly; do
    for lang in bash ruby cpp css php unknown python javascript ruby bash c; do
      repo_list=`curl 'https://github.com/trending?l='$lang'&since='$range | grep -A 1 repo-list-name | grep href | awk -F \" ' { print $2 } ' ` 

      for repo in $repo_list; do
        basename=`basename $repo`
        dirname=.`dirname $repo`
        [ -e $dirname ] || mkdir $dirname
        if [ -e .$repo ]; then
          echo "skipping $dirname"
          cd .$repo
          # git pull
          cd $cwd
        else
          git clone https://github.com$repo .$repo
        fi
      done
    done
  done
}

gitauthors() {
  [ -e compare ] || mkdir compare
  for project in *; do
    if [ -d $project -a ! -s compare/$project ]; then 
      echo $project
      cd $project
      git log --format='%aE' | sort -u | tr 'A-Z' 'a-z' > ../compare/$project
      cd $cwd
    fi
  done
}

gitprojects
gitauthors
cd compare
cat * | sort | uniq -c | sort -n

