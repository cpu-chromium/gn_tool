#!/bin/bash
trap 'exit' ERR

function getGnHash()
{
  local OS_NAME=$1
  local FILE_EXT=
  if [ "$OS_NAME" == "win" ]; then
    eval FILE_EXT=.exe
  fi
  local hash=`curl https://chromium.googlesource.com/chromium/buildtools/+/master/$OS_NAME/gn$FILE_EXT.sha1 | grep -Po '<td class="FileContents-lineContents" id="1"><span class="pln">\K[A-Za-z0-9]+'`
  echo $hash
}

if [ ! -f gsutil/gsutil ]
  then
    rm -fr gsutil.tar.gz
    wget https://commondatastorage.googleapis.com/pub/gsutil.tar.gz
    tar zxf gsutil.tar.gz
    gsutil/gsutil --version
fi

mkdir -p mac
mkdir -p linux
mkdir -p win

# https://chromium.googlesource.com/chromium/buildtools/+/master/win/gn.exe.sha1
echo "win: $(getGnHash win)"
gsutil/gsutil cp gs://chromium-gn/$(getGnHash win) win/gn.exe

# https://chromium.googlesource.com/chromium/buildtools/+/master/mac/gn.sha1
echo "mac: $(getGnHash mac)"
gsutil/gsutil cp gs://chromium-gn/$(getGnHash mac) mac/gn

# https://chromium.googlesource.com/chromium/buildtools/+/master/linux64/gn.sha1 
echo "linux64: $(getGnHash linux64)"
gsutil/gsutil cp gs://chromium-gn/$(getGnHash linux64) linux/gn

