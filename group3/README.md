Group 3: High latitudes cloud systems Manfred Wendisch and Maximilian Maahn
---------------------------------------------------------------------------

To make distribution of the software easier, we created a virtual machine image with
all required software. You have to install the following software in order to 
run the virtual machine on your computer:

* Virtualbox https://www.virtualbox.org/
* Vagrant https://www.vagrantup.com/

For version, management, make sure you have git installed:

* git https://git-scm.com/downloads

Then, clone this git repository to get the configuration. E.g., in your terminal, do 

    git clone https://github.com/ANL-DIGR/arm-summer-2018

Change the directory to group3/virtual_machine (on linux and 
mac os `cd group3/virtual_machine`) and type 

    vagrant up

This command will configure the virtual machine based on the information provided
in `Vagrantfile`. It will download a lot of data, so don't do that with a bad 
internet connection and make sure you have 2-3 GB space on your hard disk.
Installation will take a while depending on network speed, be patient. 

When the machine is running, you can connect to it with 

    vagrant ssh

and have terminal access. When you are done, do 

    vagrant halt

to turn the virtual machine off. You can start with 

    vagrant up

again. To reset everything, do 

    vagrant halt

Note that the `shared` folder in the virtual machine's home directory links to 
the `virtual_machine` of the host system. I.e. you can use that directory for file exchange and for editing the scripts/files with you favorite editor. 

When the virtual machine is running, you should be able to access a jupyter notebook
at http://localhost:8880.  The password is `jupyter`. Both examples in shared/examples
should work and produce a plot. Jupyter notebook is a python envionment, but can be 
used with other languages, too. More information at http://jupyter.org.



