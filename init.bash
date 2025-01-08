# yang diperlukan .zshrc .config/ init.bash config-nginx

sudo su apt update && apt upgrade -y 
apt install -y zsh ripgrep iputils-ping make gcc nginx tk-dev uuid-dev libgdbm-dev libreadline-dev libsqlite3-dev libncurses5-dev libncursesw5-dev libnss3-dev xz-utils liblzma-dev git curl apt-utils wget rclone cron vim neovim neofetch nano man-db build-essential zlib1g-dev libffi-dev libssl-dev libbz2-dev mysql-server
unminimize -y 
chsh -s /bin/zsh 

#oh my zsh and extesion theme
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# pyenv
curl https://pyenv.run | bash
