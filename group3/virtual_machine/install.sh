# #!/bin/bash

mkdir -p /vagrant/software
ln -s /vagrant/software ~/software

mkdir -p /vagrant/scripts
ln -s /vagrant/scripts ~/scripts


# # Sytem tools!
sudo apt-get update -y 
sudo apt-get install -y -qq tree git gcc gfortran liblapack-dev libfftw3-dev  libnetcdff5 libnetcdf-dev netcdf-bin gsl-bin libgsl0-dev libgsl0ldbl


# guest additions update
# cd /opt 
# sudo wget -c -q http://download.virtualbox.org/virtualbox/5.2.12/VBoxGuestAdditions_5.2.12.iso \
#                        -O VBoxGuestAdditions_5.2.12.iso
# sudo mount VBoxGuestAdditions_5.2.12.iso -o loop /mnt
# cd /mnt
# sudo sh VBoxLinuxAdditions.run --nox11 -- --force
# cd /opt
# sudo rm *.iso
# sudo /etc/init.d/vboxadd setup
# sudo chkconfig --add vboxadd
# sudo chkconfig vboxadd on
# cd ~

#anaconda
# wget -q https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh
# bash Anaconda3-5.2.0-Linux-x86_64.sh -b -p $HOME/anaconda

wget -q https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda

echo ". /home/vagrant/miniconda/etc/profile.d/conda.sh" >> ~/.bashrc
echo "conda activate base">> ~/.bashrc
. /home/vagrant/miniconda/etc/profile.d/conda.sh
conda activate base

echo "export PYTHONPATH=$PYTHONPATH:$HOME/lib/python" >> ~/.bashrc
export PYTHONPATH=$PYTHONPATH:$HOME/lib/python



# # python 3.6
conda activate base
conda config --add channels conda-forge 
# Pamtra1 hates apreantly conda's libgfortran... so use pip!
pip install -q cython numpy scipy xarray dask numba jupyter matplotlib ipython pytest netcdf4

#launch jupyter on startup
mkdir -p /home/vagrant/.jupyter
(crontab -l ; echo "@reboot cd /home/vagrant; source ~/.bashrc;  /home/vagrant/miniconda/bin/jupyter notebook  --ip 0.0.0.0 --no-browser >> jupyter.log")| crontab -
echo '{
  "NotebookApp": {
    "password": "sha1:b269d96dff97:82c6b6c3ba8438a203a2d635b0c6d53b38f51ae9"
  }
}' >> /home/vagrant/.jupyter/jupyter_notebook_config.json
nohup /home/vagrant/miniconda/bin/jupyter notebook  --ip 0.0.0.0 --no-browser >> jupyter.log 2>&1 &


#now python 2.7
conda create -q --name py27 python=2.7
conda activate py27
conda config --add channels conda-forge 
# Pamtra1 hates apreantly conda's libgfortran... so use pip!
pip install -q numpy==1.12.1 scipy 
pip install -q ipykernel matplotlib ipython xarray numba netcdf4
python -m ipykernel install --user


# pamtra
conda activate py27
cd ~/software
git clone --recursive https://github.com/igmk/pamtra
cd ~/software/pamtra
make clean
make pyinstall
cd ~/software
python -c "import matplotlib; matplotlib.use('Agg'); execfile ('pamtra/examples/pyPamTest_ssrg_hogan2014.py');plt.savefig('test_pamtra.png')"


# pamtra2
conda activate base
cd ~/software
git clone --recursive https://github.com/maahn/pamtra2
cd ~/software/pamtra2
rm -rf build
python setup.py install
pytest -q

#libradtran
conda activate py27
cd ~/software
wget -q http://www.libradtran.org/download/libRadtran-2.0.2.tar.gz
#its not a gzip file despite the ending!!!
tar -xf libradtran-2.0.2.tar.gz
cd ~/software/libradtran-2.0.2
#to make up for the hard link in the tar archive
cp src_py/uvspec_lex.l src/uvspec_lex.l
export F77=gfortran
make clean
./configure
make

# clean up
cd ~
rm -f Anaconda3-5.2.0-Linux-x86_64.sh
rm -f Miniconda3-latest-Linux-x86_64.sh
rm -f software/libRadtran-2.0.2.tar.gz


