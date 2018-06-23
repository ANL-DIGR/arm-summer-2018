# #!/bin/bash


# pamtra
conda activate py27
cd ~/libs
python -c "execfile ('pamtra/examples/pyPamTest_ssrg_hogan2014.py');plt.savefig('test_pamtra.png')"


# pamtra2
conda activate base
cd ~/libs/pamtra2
pytest

