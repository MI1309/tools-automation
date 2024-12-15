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

# tambah fitur unset global

# Menu utama
options=("status" "add" "update" "init" "commit" "help" "remote" "fetch" "clone" "list-config" "pull" "log" "push" "branch" "exit")

while true; 
do
    echo ""
    echo "Pilih opsi: "
    PS3="?: "
    select git in "${options[@]}"; 
    do
        case $git in
            add) 
                echo "Masukkan file yang ingin ditambahkan ke staging:"
                read file
                echo "Masukkan pesan commit:"
                read commit
                echo "Running execution ..."
                git add "$file" && git commit -m "$commit" && git push
                break
                ;;
            update) 
                echo "Masukkan pesan commit untuk update:"
                read commit
                echo "Running execution ..."
                git commit -am "$commit" && git push
                break
                ;;
            help)
                git --help
                break
                ;;
            init)
                echo "Running execution ..."
                git init
                break
                ;;
            commit)
                echo "Masukkan pesan commit:"
                read commit
                echo "Masukkan parameter tambahan (opsional):"
                read param
                git commit $param -m "$commit"
                break
                ;;
            status)
                git status
                break
                ;;
            remote)
            # sub options
                remote_options=("add" "-v" "show" "back")
                while true; 
                do
                echo "Pilih opsi remote:"
                select remote in "${remote_options[@]}"; 
                do
                    case $remote in
                        add) 
                            echo "Nama remote:"
                            read name
                            echo "Masukkan URL repo:"
                            read repo
                            git remote add "$name" "$repo"
                            ;;
                        "-v")
                            git remote -v
                            ;;
                        show)
                            git remote
                            ;;
                        back)
                            break
                            ;;
                        *) 
                            echo "Masukkan input yang benar 😑"
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
                echo "Masukkan URL repo GitHub yang ingin diclone:"
                read url
                echo "Running execution ..."
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
                echo "Pilih opsi log:"
                select log in oneline default back; do
                    case $log in
                        oneline) 
                            echo "Running execution ..."
                            git log --oneline
                            ;;
                        default)
                            git log
                            ;;
                        back)
                            break
                            ;;
                        *) 
                            echo "Masukkan input yang benar 😑"
                            ;;
                    esac
                done
                break
                ;;
            push)
                echo "Running execution ..."
                git push
                break
                ;;
            branch)
                echo "Pilih opsi branch:"
                select branch in switch add back; do
                    case $branch in
                        switch) 
                            echo "Masukkan nama branch yang ingin di-switch:"
                            read branch_name
                            echo "Running execution ..."
                            git switch "$branch_name"
                            ;;
                        add)
                            echo "Masukkan nama branch baru:"
                            read name_branch
                            echo "Running execution ..."
                            git branch -M "$name_branch"
                            ;;
                        back)
                            break
                            ;;
                        *) 
                            echo "Masukkan input yang benar 😑"
                            ;;
                    esac
                done
                break
                ;;
            exit)
                echo "Keluar dari script. Terima kasih!"
                exit
                ;;
            *) 
                clear 
                echo keluar dari script
                ;;
        esac
    done
done
