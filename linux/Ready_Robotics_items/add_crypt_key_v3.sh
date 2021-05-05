# !/usr/bin/bash
# Author: jcrowley
# Version 0.3
# Date: 2019-12-01
# Description:
# add crypt key for user
# run after system has been added to jumpcloud and the user has been added and logged in.

echo "-------------------------------------------------"
echo 
echo "This script is intended to make adding a user"
echo "key easier for the assigned user."
echo
echo "-------------------------------------------------"


# checkPartition

echo "-------------------------------------------------"
echo 
echo "Listing the existing partitions:" 
echo 
echo "-------------------------------------------------"

lsblk


echo "-------------------------------------------------"
echo 
echo "Please record the partition information listed" 
echo "with the <_crypt> label." 
echo 
echo "-------------------------------------------------"


echo "-------------------------------------------------"
echo 
echo "Would you like to add a passkey to the keyring?" 
read -p "Please answer yes or no: " proceedAnswer
echo 
echo "-------------------------------------------------"

if [[ $proceedAnswer =~ ^([yY][eE][sS]|[yY]) ]]
then
	echo "-------------------------------------------------"
	echo 
	echo "Please enter the partition name. "
	read -p "Example <sda5>: " partitionName 
	echo 
	echo "-------------------------------------------------"
	
else
	echo "-------------------------------------------------"
	echo 
	echo "You answered "$proceedAnswer". Exiting." 
	echo 
	echo "-------------------------------------------------"
	#exit on a NO answer
	exit
fi


# addToKeyRing
echo "-------------------------------------------------"
echo 
echo "Starting... Please follow the onscreen Prompts. "
echo 
echo "-------------------------------------------------"

sudo cryptsetup -y luksAddKey /dev/$partitionName

# remindAndExit
echo "-------------------------------------------------"
echo 
echo "Please make a secure note of your password." 
echo 
echo "-------------------------------------------------"

exit


