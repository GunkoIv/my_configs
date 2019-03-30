#!/bin/bash

make all -j $(($(nproc) + 1))

cp ~/.bashrc ~/.bashrc_old && echo "export PATH=$PATH:/opt/bin" >> ~/.bashrc

# git log only one branch
git log --graph {branch_name}

# Remove ( color / special / escape / ANSI ) codes, from text, with sed
sed "s,\x1B\[[0-9;]*[a-zA-Z],,g"

## Remove files younger than 1 day (to rm older replace '-' to '+' befor ''(day count))
find -type f -mtime -1 -exec rm '{}' \;

# запуск фонового процесса и ожидание его выполнения
cp some /home/some/ &
# ....
wait

# estimate time of some action
time=$(date +%s) && some_action && echo $(($(date +%s)-$time))

# Create some_file of 1 Gbyte
dd of=some_file bs=1 count=0 seek=1G

# Sorting by size list of files and dirs
du -sh * | sort -h

#Info about interace
ethtool enp6s0 

# порты используемые ситемой
netstat -nlp

# упаковка
tar -cvzf files.tar.gz ~/files
# распаковка
tar -xvf archive.tar.bz2 -C /path/to/folder

##
#   Docker
##

#Remove all containers:
docker rm $(docker ps -a -q) 

# Remove all untagged images:

docker rmi $(docker images | grep "^<none>" | awk '{print $3}') 

# Print the size of directories
for D in `find . -maxdepth 1 -type d`
do
  du -hs "${D}"
done

# Inspecting interaction with docker daemon
socat -v UNIX-LISTEN:/tmp/fake,fork UNIX-CONNECT:/var/run/docker.sock
# In other terminal
export DOCKER_HOST=unix:///tmp/fake
docker ps
#....

##
#   Git
##

# Removing multiple files from a Git repo that have already been deleted from disk
git ls-files --deleted -z | xargs -0 git rm 

## Remove tag
# localy
git tag --delete tagname
# from repo
git push --delete origin tagname

## .gitignore START
# Ignore everything
*
# But not these files...
!.gitignore
!*.example
## .gitignore END


# add alias
git config --global alias.last 'log -1 HEAD'

# Change repo
git remote set-url origin ...

# Easy way pull latest of all submodules
git submodule update --recursive --remote

# Удалить submodul
# The all removal process would then be:
mv some_submodule asubmodule_tmp
git submodule deinit some_submodule    
git rm some_submodule
# Note: some_submodule (no trailing slash)
# or, if you want to leave it in your working tree
git rm --cached some_submodule
mv asubmodule_tmp some_submodule
#But you seem to still need a:
rm -rf .git/modules/some_submodule

# Add submodule
git submodule add git@bitbucket.org:smilart/daemon_utils.git lib/daemon_utils

##
#   Building appl
##

# OpenCV problem with CUDA (maybe cuda 8)
cmake -DCUDA_USE_STATIC_CUDA_RUNTIME=OFF ..

#Problem with cuda lib
#32-bit: 
sudo ldconfig /usr/local/cuda/lib
#64-bit: 
sudo ldconfig /usr/local/cuda/lib64

#Дрова Nvidia для ubuntu
#http://help.ubuntu.ru/wiki/nvidia-prime
 
#несколько GCC на одной системе 
#http://forum.ubuntu.ru/index.php?topic=273521.0
#выбор:
sudo update-alternatives --config gcc
sudo update-alternatives --config g++

# Problem in C++ with  #include <caffe/caffe.hpp> (don,t forget add lib caffa/include for your compiler)
# You need to generate caffe.pb.h manually using protoc as follows.
# In the directory you installed Caffe do:
protoc src/caffe/proto/caffe.proto --cpp_out=.
mkdir include/caffe/proto
mv src/caffe/proto/caffe.pb.h include/caffe/proto
