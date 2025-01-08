#!/bin/bash

# Ping Google DNS untuk memeriksa konektivitas jaringan
PING_TARGET="8.8.8.8"
PING_COUNT=1

echo "Memeriksa konektivitas jaringan..."

if ping -c $PING_COUNT $PING_TARGET &> /dev/null
then
	    echo "Jaringan tersambung."
    else
	        echo "Tidak ada koneksi jaringan."
fi

