#!/bin/bash

#ip="$1"
mkdir tmp
cd tmp
echo "=== Downloading pyo-bela binaries. ==="
wget -q https://github.com/alexdrymonitis/pyo-bela/releases/download/v1.0.6/dist-packages.tar.bz2
echo "=== Extracting pyo-bela binaries. ==="
tar xjf dist-packages.tar.bz2
echo "=== Copying files to /usr/local/lib ==="
#scp -r -q dist-packages/ root@${ip}:/usr/local/lib/python3.11/
cp -r dist-packages/* /usr/local/lib/python3.11/
echo "=== Cleanup. ==="
cd ..
rm -r tmp
echo "=== Done! ==="

