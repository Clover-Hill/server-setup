#!/bin/bash

# 定义Git用户名和邮箱变量
GIT_USER_NAME="Maximus"
GIT_USER_EMAIL="maximus.cao@outlook.com"

# 打印信息函数
print_message() {
  echo "--------------------------------------------"
  echo "$1"
  echo "--------------------------------------------"
}

# 1. Github setup
print_message "开始进行GitHub配置..."

# 设置Git用户名和邮箱
git config --global user.name "$GIT_USER_NAME"
git config --global user.email "$GIT_USER_EMAIL"
echo "Git 用户信息已设置: 用户名 - $GIT_USER_NAME, 邮箱 - $GIT_USER_EMAIL"

# 生成SSH Key
print_message "正在生成SSH密钥对..."
ssh-keygen -t rsa -b 4096 -C "$GIT_USER_EMAIL" -f ~/.ssh/id_rsa -N ""
echo "SSH 密钥已生成，请复制以下公钥到GitHub账号的SSH Keys中："
cat ~/.ssh/id_rsa.pub

# 暂停，等待用户复制公钥
read -p "请复制公钥到GitHub后，按任意键继续..."

# 测试GitHub连接
print_message "测试GitHub连接..."
ssh -T git@github.com
echo "GitHub连接测试完成。"

# 2. Zsh setup
print_message "开始安装Zsh..."

# 更新apt并安装最新版本的zsh
sudo apt update
sudo apt install -y zsh

# 安装oh-my-zsh
print_message "正在安装oh-my-zsh..."
sh -c "$(curl -fsSL https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh)"