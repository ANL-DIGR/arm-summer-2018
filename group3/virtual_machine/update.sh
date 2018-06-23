# #!/bin/bash


# pamtra
conda activate py27
cd ~/libs/pamtra
git pull
make clean
make pyinstall

# pamtra2
conda activate base
cd ~/libs/pamtra2
git pull
rm -rf build
python setup.py install
