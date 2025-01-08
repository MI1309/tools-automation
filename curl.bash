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
echo Version: $VERSION
echo "_______________________________________________________________________________"
echo ""


# Menu utama
options=("post" "get" "delete" "put")

while true; do
    echo ""
    echo "$banner"
    echo "_______________________________________________________________________________"
    echo "               Masukkan input di luar opsi angka ini untuk keluar"
    echo "_______________________________________________________________________________"
    echo "Pilih opsi:"
    PS3="Nomor: "
    select curl in "${options[@]}"; do

        case $curl in
        post)
            bash ~/tools-automation/post-curl.bash
            echo "Suksess"
            break
            ;;
        get)
            bash ~/tools-automation/get-curl.bash   
            break
            ;;
        put)
            read -rp "link : " link 
            read -rp "endpoint api : " endpoint
            read -rp "data : " data
            curl $link/$endpoint -d "key=$data" -X PUT
            break
            ;;
        init)
            echo "Inisialisasi ..."
            git init
            break
            ;;
        commit)
            read -rp "Masukkan pesan commit: " commit git commit -m "$commit"
            break
            ;;
        status)
            git status
            break
            ;;
        remote)
            # sub options
            remote_options=("add" "-v" "show")
            while true; do
                echo ""
                echo "$banner"
                echo "_______________________________________________________________________________"
                echo "               Masukkan input di luar opsi angka ini untuk keluar"
                echo "_______________________________________________________________________________"
                echo "Pilih opsi:"
                select remote in "${remote_options[@]}"; do
                    case $remote in
                    add)
                        read -rp "Nama remote: " name
                        read -rp "Masukkan URL repo: " repo
                        git remote add "$name" "$repo"
                        break
                        ;;
                    "-v")
                        git remote -v
                        break
                        ;;
                    show)
                        git remote
                        break
                        ;;
                    *)
                        break 3
                        ;;
                    esac
                done
            done
            ;;
        fetch)
            git fetch
            break
            ;;
        clone)
            echo
            read -rp "Masukkan URL repo GitHub yang ingin diclone: " url
            echo "Cloning ..."
            git clone "$url"
            break
            ;;
        list-config)
            git config --global --list
            break
            ;;
        pull)
            git pull
            break
            ;;
        log)
            echo ""
            echo "$banner"
            echo "_______________________________________________________________________________"
            echo "               Masukkan input di luar opsi angka ini untuk keluar"
            echo "_______________________________________________________________________________"
            echo "Pilih opsi:"
            select log in oneline default; do
                case $log in
                oneline)
                    git log --oneline
                    break
                    ;;
                default)
                    git log
                    break
                    ;;
                *)
                    break 3
                    ;;
                esac
            done
            break
            ;;
        push)
            echo "Ngepush Code ..."
            git push
            break
            ;;
        branch)
            echo ""
            echo "$banner"
            echo "_______________________________________________________________________________"
            echo "               Masukkan input di luar opsi angka ini untuk keluar"
            echo "_______________________________________________________________________________"
            echo "Pilih opsi:"

            select branch in switch add; do
                case $branch in
                switch)
                    echo "Masukkan nama branch yang ingin di-switch:"
                    read branch_name
                    echo "Running execution ..."
                    git switch "$branch_name"
                    break
                    ;;
                add)
                    echo "Masukkan nama branch baru:"
                    read name_branch
                    echo "Running execution ..."
                    git branch -M "$name_branch"
                    break
                    ;;
                *)
                    break 3
                    ;;
                esac
            done
            break
            ;;
        *)
            clear
            echo keluar dari script
            exit
            ;;
        esac
    done
done
