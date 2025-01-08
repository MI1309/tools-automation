#!/bin/bash

# Ganti 'nama_layanan' dengan nama layanan yang ingin diperiksa
SERVICE=$1

# Periksa status layanan menggunakan 'service'
if service "$SERVICE" status | grep -q "is not running"; then
    echo "$(date) - $1 tidak berjalan, bersiap menjalankan ..."
    service $1 restart
else
    echo "Program ini sedang berjalan"
fi
