mkdir tmp
cd tmp
echo "=== Downloading pyo-bela binaries. ==="
wget -q https://github.com/alexdrymonitis/pyo-bela/releases/download/v1.0.6/dist-packages.tar.bz2
echo "=== Extracting pyo-bela binaries. ==="
tar xjf dist-packages.tar.bz2
echo "=== Copying files to the BBB. ==="
scp -r -q dist-packages/ root@192.168.6.2:/usr/local/lib/python3.11/
echo "=== Cleanup. ==="
cd ..
rm -r tmp
echo "=== Done! ==="

