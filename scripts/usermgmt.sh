#!/bin/bash

echo "Welcome to user management"

function user_creation {
	read -p "enter username:" username
        read -p "enter password:" password

        sudo useradd -m $username -p $password

        echo "user $username created"
}

function user_deletion {
	read -p "enter username to be deleted:" username
	sudo userdel -rf $username
	echo "user $usename deleted"
}

function usage {
	echo "1.enter c to create users"
        echo "2.enter d to delete user"
}



case "$1" in
	c)
		read -p "enter the number of user to be created:" u

		for((i=1; i<=$u; i++))
		do
        		user_creation
		done
	;;
	d)
		user_deletion
	;;
	*)
		usage
	;;
esac	
