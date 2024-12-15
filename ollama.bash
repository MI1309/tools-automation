# requirements tools ollama

AUTHOR="MUHAMMAD IMRON"
CONTRIBUTOR="NONE"
VERSION="1.0.0"
APP="Automasi Tugas Git"
banner="
       _____                                 _____               
      |_   _|                               |  __ \              
        | |   _ __ ___   _ __  ___   _ __   | |  | |  ___ __   __
        | |  | '_ \` _ \ | '__|/ _ \ | '_ \  | |  | | / _ \\ \ / /
       _| |_ | | | | | || |  | (_) || | | | | |__| ||  __/ \ V / 
      |_____||_| |_| |_||_|   \___/ |_| |_| |_____/  \___|  \_/  
"

clear
echo App: $APP
echo Version: $Version
echo "_______________________________________________________________________________"
echo ""

# Menu utama
options=("create_model" "run" "list")

while true; do
    echo "$banner"
    echo "_______________________________________________________________________________"
    echo "               Masukkan input di luar opsi angka ini untuk keluar"
    echo "_______________________________________________________________________________"
    echo ""
    echo "Pilih opsi:"
    echo ""
    PS3="Nomor: "
    select ollama in "${options[@]}"; do
        case $ollama in
        create_model)
            echo pastikan ada file Makefile untuk membuat model
            read -rp "Masukkan nama model: " model
            ollama create $model -f ./Makefile
            break
            ;;
        run)
            echo "menjalankan model AI"
            read -rp "Masukkan Nama Model: " model
            ollama run $model
            break
            ;;
        list)
            echo Model Terinstall
            ollama list
            break
            ;;
        *)
            clear
            echo Keluar Dari Script
            exit
            ;;
        esac
    done
done
