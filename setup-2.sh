#!/bin/bash

# 打印信息函数
print_message() {
  echo "--------------------------------------------"
  echo "$1"
  echo "--------------------------------------------"
}

# 安装Powerlevel10k主题
print_message "正在安装Powerlevel10k主题..."
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# 安装Zsh插件
print_message "正在安装Zsh插件..."
git clone https://gitee.com/mirrors/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://gitee.com/mirrors/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# 复制并应用.bashrc和.zshrc
print_message "正在复制并应用.bashrc和.zshrc文件..."
cp .bashrc ~/.bashrc
cp .zshrc ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh
source ~/.zshrc
echo ".bashrc和.zshrc文件已复制并应用。"

# 3. Tmux setup
print_message "开始安装Tmux..."

# 更新apt并安装tmux
sudo apt update
sudo apt install -y tmux

# 下载并配置oh-my-tmux
print_message "正在安装oh-my-tmux..."
cd ~
git clone https://gitee.com/qiuye_dlmu/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# 4. Neovim setup 
sudo apt install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install neovim
nvim -v
echo "Neovim安装完成"

print_message "所有设置完成！"