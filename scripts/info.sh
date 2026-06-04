#!/bin/bash

# cpu info
echo " "
echo -e "\e[36m********** cpu info **********\e[0m"
LANG=C lscpu

# partitioning
echo " "
echo -e "\e[36m********** partitioning **********\e[0m"
lsblk -fa && LANG=C sudo parted -l

# pci devices
echo " "
echo -e "\e[36m********** pci devices **********\e[0m"
lspci -k

# ram info
echo " "
echo -e "\e[36m********** ram info **********\e[0m"
free -h

# Storage use
echo " "
echo -e "\e[36m********** storage use **********\e[0m"
LANG=C df -h

# PATH
echo " "
echo -e "\e[36m********* PATH **********\e[0m"
echo $PATH
