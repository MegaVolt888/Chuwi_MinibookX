# Chuwi_MinibookX
Settings and tweeks for Chuwi Minibook X n100 (2023)

The attached files have been tested on a laptop running Debian 12.7 (kernel 6.11.2-1) with LightDM and Mint.

After installation install git:  
``` 
sudo apt update && sudo apt install git -y
```
after this clone git:
```
git clone https://github.com/MegaVolt888/Chuwi_MinibookX.git
cd Chuwi_MinibookX
```
run postinstall script:
```
chmod a+x postinstall.sh
sudo ./postinstall.sh 
```

The changes will take effect after a system reboot.


**ToDo Create service to autorotate screen and activate tablet mode.**

The *angle* application is used to calculate the angle of inclination (angle.c file included to git).

Bash script *int33_my_f.sh* used for accelerometers sensors initialisation and test parameters angle cover notebook.

Fot test run in terminal ``` watch -n .1 sudo ./int33_my_f.sh ```
