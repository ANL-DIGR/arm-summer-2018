# #!/bin/bash


# pamtra
conda activate py27
cd ~/software/pamtra
git pull
make clean
make pyinstall

# pamtra2
conda activate base
cd ~/software/pamtra2
git pull
rm -rf build
python setup.py install
