# requirements tools yt-dlp and ffmpeg

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
options=("substitle" "playlist" "video" "audio" "list_substitle")

while true; do
    echo ""
    echo "$banner"
    echo "_______________________________________________________________________________"
    echo "               Masukkan input di luar opsi angka ini untuk keluar"
    echo "_______________________________________________________________________________"
    echo "Pilih opsi:"
    PS3="Nomor: "
    select yt_dlp in "${options[@]}"; do
        case $yt_dlp in
        substitle)
            echo "Masukkan link YouTube yang ingin didownload dari subtitle yang ada:"
            read -rp "Link: " link
            echo "Bahasa yang ingin dipakai:"
            read bahasa
            echo "Running execution ..."
            yt-dlp --write-auto-subs --sub-lang $bahasa --skip-download $link
            break
            ;;
        playlist)
            echo "Masukkan link playlist YouTube yang ingin didownload:"
            read -rp "Link: " link
            playlist="yt-dlp -f \"bv*+ba/b\" -o \"%(playlist_title)s/%(title)s.%(ext)s\" --merge-output-format mp4"
            echo "Running execution ..."
            $playlist $link
            break
            ;;
        audio)
            echo "Masukkan link YouTube untuk mendownload audio:"
            read -rp "Link: " link
            audio="yt-dlp -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0"
            echo "Running execution ..."
            $audio $link
            break
            ;;
        video)
            echo "Masukkan link YouTube untuk mendownload video:"
            read -rp "Link: " link
            echo "Running execution ..."
            yt-dlp -f bestvideo+bestaudio --merge-output-format mp4 $link
            break
            ;;
        list_substitle)
            echo "Masukkan link YouTube untuk melihat daftar subtitle yang tersedia:"
            read -rp "Link: " link
            yt-dlp --list-subs $link
            break
            ;;
        *)
            echo "Masukkan input yang benar 😑"
            exit
            ;;
        esac
    done
done
