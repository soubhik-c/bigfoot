
# Steps to install and run this notebook

## Prerequisite:
* Python@3.10 or more
* GeoPandas@0.10.2 or more

## Additional data folders
a) state_geo folder (shared on previous classes) consisting of state info must be inside src/ folder as "src/state_geo/*.shp".
b) county_geo folder as this project dependency should be inside src/ folder as "src/count_geo/*.shp"
c) county.csv inside src/ folder.
d) bigfoot.csv data inside src/ folder

## Installation:
a) MAC:
   - Open terminal (command+space -> terminal)
   - Go to the unzipped folder
   - invoke "./init.sh"

   if homebrew is installed and python is of lower version, init will try to install python3.10.
   You will then need to EXIT the terminal window (close it) and spin up a new window, for the .zshrc file to refresh the path.

b) Linux and Windows environment will require python3.10 to be installed outside the script.


## What init.sh script does.
   - Once you have python@3.10, it will expect annaconda to be also there already.
   - The script will then create a virtual environment on the local folder and install all its depedencies (some needs complex installation and certain order for geopandas to install correctly). Mainly, gdal, blas, numpy and scikit are the prerequisites thatis operating system dependent.
   - It will subsequently download required nlp model (~777mb) for smoother experience within the notebook. 

   - wait for few seconds after the browser comes up, jupyter takes a while to bring up the notebook.

## Troubleshooting:
   - in case of any difficulty, please contact any of the following team members:

     a) Soubhik @ +1 617 906 1795 , schakraborty@falcon.bentley.edu, whatsapp +91 7410 588 355
     b) Yousuf  @ +1 781 778 8769 , maziz@falcon.bentley.edu, whatsapp -> same as mobile.



