# requirements tools pyenv and library python more

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
options=("pip_install" "create_file" "import" "export" "version" "pyenv_install" "pyenv_uninstall" "pyenv_global" "list_pyenv")

while true; do
    echo ""
    echo "$banner"
    echo "_______________________________________________________________________________"
    echo "               Masukkan input di luar opsi angka ini untuk keluar"
    echo "_______________________________________________________________________________"
    echo "Pilih opsi:"
    PS3="Nomor: "
    select python in "${options[@]}"; do
        case $python in
        pip_install)
            read -rp "Package yang ingin diinstall: " package
            echo "Running execution ..."
            pip install $package
            break
            ;;
        create_file)
            echo "membuat file python"
            read -rp "Masukkan nama file: " -a file
            echo "Running execution ..."
            echo ""
            for file in "${file[@]}"; do
                touch "$file.py"
                echo "file yang dibuat:" $file.py
            done
            break
            ;;
        import)
            echo "Import library python"
            echo "Running execution ..."
            pip install -r requirements.txt
            echo ""
            echo "--- sukses import ---"
            break
            ;;
        export)
            echo "Export library dari env"
            echo "Running execution ..."
            pip freeze >requirements.txt
            echo sukses export
            break
            ;;
        version)
            read -rp "version: " version
            $version --version
            break
            ;;
        pyenv_install)
            echo "Install python version"
            read -rp "Install versi Python: " python
            pyenv install $python
            break
            ;;
        pyenv_uninstall)
            echo "Uninstall python version"
            read -rp "pilih versi yang di uninstall: " versi
            pyenv uninstall $versi
            break
            ;;
        pyenv_global)
            echo ""
            echo "Set Versi Python Secara Global"
            read -rp "pilih versi python: " versi
            echo running execution ...
            pyenv global $versi
            echo sukses
            break
            ;;
        list_pyenv)
            echo "list pyenv yang terinstall"
            pyenv versions
            break
            ;;
        *)
            clear
            exit
            ;;
        esac
    done
done
