read -rp "link : " link
read -rp "Key : " key
read -rp "masukkan data array json : " array
read -rp "masukkan datanya : " data

curl -i -X POST $link/$key -d "$array=$data"
