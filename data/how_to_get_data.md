# How to populate this directory

Each group who has worked with DIGR has a datastreams.md file that has a link that
connects you to a datastream which you can order one or more files from.

Click the link and you will be presented with a window at the ARM archive with your data
streams. For many data sources you can click the **blue plus** to add all files in the
date range. For some data (Spectral etc..) you will not want to order the whole day so
click the **green folder** to select files of interest. 

Once this is done you can click "quick order" which will then prompt you for your ARM 
username and submit the order. 

This repository has a script ```get_arm.py``` (in the scripts directory )which 
automates download. 

To get your ordered data simply:

```./get_arm.py arm_uname ordernumber /path/to/your/repository/data/```

eg

```./get_arm.py scollis 205011 /Users/scollis/arm-summer-2018/data```

Then the notebooks will work on data in that directory. 